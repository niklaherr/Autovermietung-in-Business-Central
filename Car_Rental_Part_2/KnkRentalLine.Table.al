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
            Caption = 'HeaderNo';
            TableRelation = "KnkRental Header";
            Editable = false;
        }

        field(3; Car; Code[20])
        {
            Caption = 'Car';
            TableRelation = "KnkCar"."Number Plate";
            trigger OnValidate()
            var
                Autorec: Record "KnkCar";
                RentalHeader: Record "KnkRental Header";
            begin
                if Autorec.Get(Car) then begin
                    Manufacturer := Autorec.Manufacturer;
                    Model := Autorec."Model Description";
                    if RentalHeader.Get(HeaderNo) then begin
                        Price := Verrechnen(RentalHeader, Rec);
                    end;
                end else begin
                    Error('Das Auto konnte nicht gefunden werden');
                end;
            end;
        }

        field(4; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            Editable = false;
            TableRelation = "KnkCar".Manufacturer;
        }

        field(5; Model; COde[20])
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
                    Price := Verrechnen(RentalHeader, Rec);
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
            Caption = 'Pickup Date&Time';
            trigger OnValidate()
            begin
                IsCarRented();
            end;
        }

        field(9; ReturnDateTime; DateTime)
        {
            Caption = 'Return Date&Time';
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

    procedure Verrechnen(RentalHeader: Record "KnkRental Header"; Rentline: Record "KnkRental Line"): Decimal
    var
        Autorec: Record "KnkCar";
        Tagespreis: Decimal;
        RestPreis: Integer;
    begin
        Tagespreis := 0;
        if Rentline."Driven Km" > 0 then begin
            if Autorec.Get(Car) then begin
                if (RentalHeader.Startdate = 0D) or (RentalHeader.Enddate = 0D) then begin
                    Error('Bitte füllen Sie beide Datumsfelder aus.');
                end else begin
                    Tagespreis := (RentalHeader.Enddate - RentalHeader.Startdate) * Autorec."Price Per Day";
                    if Rentline."Driven Km" > 15000 then begin
                        RestPreis := Autorec."Price Per 100km Over 15000km" * ((Rentline."Driven Km" - 15000) / 100);
                        Tagespreis := Tagespreis + RestPreis;
                    end;
                end;
            end;
        end;
        exit(Tagespreis);
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
