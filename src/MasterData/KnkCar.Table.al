table 50002 "KnkCar"
{

    fields
    {
        field(1; "Number Plate"; Code[10])
        {
            Caption = 'Number Plate';

            trigger OnValidate()
            var
                i: Integer;
                IsValid: Boolean;
            begin
                IsValid := true;

                // Validate the first two characters are capital letters
                for i := 1 to 2 do
                    if not IsLetter("Number Plate"[i]) then
                        IsValid := false;

                // Validate the third character is a dash
                if "Number Plate"[3] <> '-' then
                    IsValid := false;

                // Validate the next two characters are capital letters
                for i := 4 to 5 do
                    if not IsLetter("Number Plate"[i]) then
                        IsValid := false;

                // Validate the sixth character is a dash
                if "Number Plate"[6] <> '-' then
                    IsValid := false;

                // Validate the last four characters are digits
                for i := 7 to 10 do
                    if not IsDigit("Number Plate"[i]) then
                        IsValid := false;

                if not IsValid then
                    Error('The license plate must match the "JB-HS-9187" format.');
            end;
        }


        field(2; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            TableRelation = "KnkManufacturer";

            trigger OnValidate()
            begin
                Rec."Model Description" := '';
                Rec.Modify();
            end;
        }

        field(3; "Model Description"; Code[20])
        {
            Caption = 'Model Description';
            TableRelation = "KnkModel";
        }

        field(4; Color; enum KnkColor)
        {
            Caption = 'Color';
        }

        field(5; "Year Of Construction"; Date)
        {
            Caption = 'Year Of Construction';
            trigger OnValidate()
            begin
                ValidateManufacturingYear();
            end;
        }

        field(6; Rented; Boolean)
        {
            Caption = 'Rented';
        }

        field(7; "Price Per Day"; Decimal)
        {
            Caption = 'Price Per Day';
        }

        field(8; "Price Per 100km Over 15000km"; Decimal)
        {
            Caption = 'Price Per 100km Over 15000km';
        }
    }

    keys
    {
        key(PrimaryKey; "Number Plate")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Number Plate", Manufacturer, "Model Description", Color, "Year Of Construction", "Price Per Day", "Price Per 100km Over 15000km") { }
    }

    procedure ValidateManufacturingYear()
    var
        ModelRecord: Record "KnkModel";
        ManufacturingStart: Date;
        ManufacturingStop: Date;
        CarManufacturingDate: Date;
    begin
        if ModelRecord.Get("Model Description") then begin
            ManufacturingStart := ModelRecord."Manufacturing Start";
            ManufacturingStop := ModelRecord."Manufacturing Stop";
        end;

        CarManufacturingDate := Rec."Year Of Construction";

        if (ManufacturingStart = 0D) and (ManufacturingStop = 0D) then begin
            Error('Please maintain the manufacturing period for the selected model.');
        end;

        if (ManufacturingStart = 0D) xor (ManufacturingStop = 0D) then begin
            if ManufacturingStop = 0D then begin
                if CarManufacturingDate < ManufacturingStart then begin
                    Error('The car cannot be manufactured before the official start date.');
                end;
            end else if CarManufacturingDate > ManufacturingStop then begin
                Error('The car cannot be manufactured after the official stop date.');
            end;
        end;

        if (ManufacturingStart <> 0D) and (ManufacturingStop <> 0D) then begin
            if CarManufacturingDate < ManufacturingStart then begin
                Error('The car cannot be manufactured before the official start date.');
            end;
            if CarManufacturingDate > ManufacturingStop then begin
                Error('The car cannot be manufactured after the official stop date.');
            end;
        end;
    end;

    local procedure DeleteCar()
    begin

    end;

    procedure IsLetter(Char: Char): Boolean;
    begin
        exit((Char >= 'A') and (Char <= 'Z'));
    end;

    procedure IsDigit(Char: Char): Boolean;
    begin
        exit((Char >= '0') and (Char <= '9'));
    end;
}
