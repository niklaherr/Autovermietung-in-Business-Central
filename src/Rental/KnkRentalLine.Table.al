table 50004 "KnkRental Line"
{
    Caption = 'Rental Line';

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
            begin
                PopulateCarDetails();
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
            begin
                UpdatePriceFromHeader();
            end;
        }

        field(7; Price; Decimal)
        {
            Caption = 'Price';
            Editable = false;
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
        AdditionalPrice: Decimal;
        RentalDays: Integer;
    begin
        if RentLine.Car = '' then
            exit(0);

        if not CarRecord.Get(RentLine.Car) then
            Error('The selected car could not be found.');

        if (RentalHeader.StartDate = 0D) or (RentalHeader.EndDate = 0D) then
            exit(0);

        RentalDays := RentalHeader.EndDate - RentalHeader.StartDate;
        if RentalDays < 0 then
            Error('The end date must be after the start date.');

        BasePrice := RentalDays * CarRecord."Price Per Day";
        if RentLine."Driven Km" > 15000 then begin
            AdditionalPrice := CarRecord."Price Per 100km Over 15000km" * ((RentLine."Driven Km" - 15000) / 100);
            BasePrice := BasePrice + AdditionalPrice;
        end;

        exit(BasePrice);
    end;

    local procedure PopulateCarDetails()
    var
        CarRecord: Record "KnkCar";
        RentalHeader: Record "KnkRental Header";
    begin
        if not CarRecord.Get(Car) then
            Error('The selected car could not be found.');

        Manufacturer := CarRecord.Manufacturer;
        Model := CarRecord."Model Description";

        if RentalHeader.Get(HeaderNo) then
            Price := CalculatePrice(RentalHeader, Rec);
    end;

    local procedure UpdatePriceFromHeader()
    var
        RentalHeader: Record "KnkRental Header";
    begin
        if RentalHeader.Get(HeaderNo) then
            Price := CalculatePrice(RentalHeader, Rec);
    end;

}
