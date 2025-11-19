table 50002 "KnkCar"
{
    Caption = 'Car';

    fields
    {
        field(1; "Number Plate"; Code[10])
        {
            Caption = 'Number Plate';

            trigger OnValidate()
            begin
                ValidateGermanNumberPlate();
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

        field(6; "Price Per Day"; Decimal)
        {
            Caption = 'Price Per Day';
        }

        field(7; "Price Per 100km Over 15000km"; Decimal)
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

    local procedure ValidateGermanNumberPlate()
    var
        Plate: Text[10];
        DashPositions: array[2] of Integer;
        DashCount: Integer;
        SectionLength: Integer;
        i: Integer;
    begin
        Plate := UpperCase("Number Plate");
        "Number Plate" := Plate;

        for i := 1 to StrLen(Plate) do begin
            if Plate[i] = '-' then begin
                DashCount += 1;
                if DashCount <= 2 then
                    DashPositions[DashCount] := i;
            end else
                if not (IsLetter(Plate[i]) or IsDigit(Plate[i])) then
                    Error('A German number plate may only contain letters, digits, and dashes.');
        end;

        if DashCount <> 2 then
            Error('A German number plate must contain exactly two dashes (e.g. "HB-AB-1234").');

        SectionLength := DashPositions[1] - 1;
        if (SectionLength < 1) or (SectionLength > 3) then
            Error('The city prefix must consist of 1 to 3 letters.');
        for i := 1 to SectionLength do
            if not IsLetter(Plate[i]) then
                Error('The city prefix may only contain letters.');

        SectionLength := DashPositions[2] - DashPositions[1] - 1;
        if (SectionLength < 1) or (SectionLength > 2) then
            Error('The letter block after the first dash must consist of 1 or 2 letters.');
        for i := DashPositions[1] + 1 to DashPositions[2] - 1 do
            if not IsLetter(Plate[i]) then
                Error('The letter block after the first dash may only contain letters.');

        SectionLength := StrLen(Plate) - DashPositions[2];
        if (SectionLength < 1) or (SectionLength > 4) then
            Error('The number block must consist of 1 to 4 digits.');
        if Plate[DashPositions[2] + 1] = '0' then
            Error('The number block may not start with zero.');
        for i := DashPositions[2] + 1 to StrLen(Plate) do
            if not IsDigit(Plate[i]) then
                Error('The number block may only contain digits.');
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
