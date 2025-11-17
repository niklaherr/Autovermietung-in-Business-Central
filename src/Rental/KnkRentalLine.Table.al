table 50004 "KnkRental Line"
{

    fields
    {
        field(1; "Nr"; Integer)
        {
            Caption = 'Nr';
            Editable = false;
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

        field(2; HeaderNo; Integer)
        {
            Caption = 'Header No.';
            TableRelation = "KnkRental Header";
            Editable = false;
        }

        field(3; Car; Code[20])
        {
            Caption = 'Car';
            TableRelation = "KnkCar"."Number Plate";
            trigger OnValidate()
            var
                CarRecord: Record "KnkCar";
                RentalHeader: Record "KnkRental Header";
            begin
                if CarRecord.Get(Car) then begin
                    Manufacturer := CarRecord.Manufacturer;
                    Model := CarRecord."Model Description";
                    if RentalHeader.Get(HeaderNo) then begin
                        Price := CalculatePrice(RentalHeader, Rec);
                    end;
                end else begin
                    Error('The selected car could not be found.');
                end;
            end;
        }

        field(4; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            Editable = false;
            TableRelation = "KnkCar".Manufacturer;
        }

        field(5; Model; Code[20])
        {
            Caption = 'Model';
            Editable = false;
            TableRelation = "KnkCar"."Model Description";
        }

        field(6; "Driven Km"; Integer)
        {
            Caption = 'Driven Km';
            trigger OnValidate()
            var
                RentalHeader: Record "KnkRental Header";
            begin
                if RentalHeader.Get(HeaderNo) then begin
                    Price := CalculatePrice(RentalHeader, Rec);
                end;
            end;
        }

        field(7; Price; Decimal)
        {
            Caption = 'Price';
            Editable = false;
        }

        field(8; PickupDateTime; DateTime)
        {
            Caption = 'Pickup Date & Time';
            trigger OnValidate()
            begin
                IsCarRented();
            end;
        }

        field(9; ReturnDateTime; DateTime)
        {
            Caption = 'Return Date & Time';
            trigger OnValidate()
            begin
                IsCarRented();
            end;
        }
    }


    keys
    {
        key(PrimaryKey;
        Nr, HeaderNo)
        {
            Clustered = true;
        }
    }

    procedure CalculatePrice(RentalHeader: Record "KnkRental Header"; RentLine: Record "KnkRental Line"): Decimal
    var
        CarRecord: Record "KnkCar";
        BasePrice: Decimal;
        AdditionalPrice: Integer;
    begin
        BasePrice := 0;
        if RentLine."Driven Km" > 0 then begin
            if CarRecord.Get(Car) then begin
                if (RentalHeader.StartDate = 0D) or (RentalHeader.EndDate = 0D) then begin
                    Error('Please fill in both date fields.');
                end else begin
                    BasePrice := (RentalHeader.EndDate - RentalHeader.StartDate) * CarRecord."Price Per Day";
                    if RentLine."Driven Km" > 15000 then begin
                        AdditionalPrice := CarRecord."Price Per 100km Over 15000km" * ((RentLine."Driven Km" - 15000) / 100);
                        BasePrice := BasePrice + AdditionalPrice;
                    end;
                end;
            end;
        end;
        exit(BasePrice);
    end;

    procedure IsCarRented()
    var
        RentalLine: Record "KnkRental Line";
        AlreadyRentedLbl: Label 'The selected vehicle is already rented in another rental contract!';
    begin
        // Check if both required fields aren't empty
        if ((Rec.PickupDateTime <> 0DT) and (Rec.ReturnDateTime <> 0DT)) then begin

            // Filter second rental line table using the rental period from the created line
            RentalLine.SetFilter(PickupDateTime, '<=%1', Rec.PickupDateTime);
            RentalLine.SetFilter(ReturnDateTime, '>=%1', Rec.ReturnDateTime);

            // Check if there are still entries in the rental list after filtering
            if RentalLine.FindFirst() then
                // Rental lines were found after filtering, meaning the vehicle is already rented
                Error(AlreadyRentedLbl);
        end;
    end;
}
