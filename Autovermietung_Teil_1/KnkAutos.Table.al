table 50002 Car
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

                // Prüfe die ersten zwei Zeichen auf Großbuchstaben
                for i := 1 to 2 do
                    if not IsLetter("Number Plate"[i]) then
                        IsValid := false;

                // Prüfe das 3. Zeichen auf einen Bindestrich
                if "Number Plate"[3] <> '-' then
                    IsValid := false;

                // Prüfe die nächsten zwei Zeichen auf Großbuchstaben
                for i := 4 to 5 do
                    if not IsLetter("Number Plate"[i]) then
                        IsValid := false;

                // Prüfe das 6. Zeichen auf einen Bindestrich
                if "Number Plate"[6] <> '-' then
                    IsValid := false;

                // Prüfe die letzten vier Zeichen auf Ziffern
                for i := 7 to 10 do
                    if not IsDigit("Number Plate"[i]) then
                        IsValid := false;

                if not IsValid then
                    Error('Das Kennzeichen muss dem Format "JB-HS-9187" entsprechen.');
            end;
        }


        field(2; Manufactor; Code[20])
        {
            Caption = 'Manufactor';
            TableRelation = Manufactor;

            trigger OnValidate()
            begin
                Rec."Model Description" := '';
                Rec.Modify();
            end;
        }

        field(3; "Model Description"; Code[20])
        {
            Caption = 'Model Description';
            TableRelation = Model;

            /*trigger OnValidate()
            var
                myInt: Integer;
            begin
                Rec.Hersteller := '';
                Rec.Modify();
            end;*/
        }

        field(4; Color; enum Color)
        {
            Caption = 'Color';
        }

        field(5; "Year Of Construction"; Date)
        {
            Caption = 'Year Of Contruction';
            trigger OnValidate()
            begin
                CheckAutoBaujahr();
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
        fieldgroup(DropDown; "Number Plate", Manufactor, "Model Description", Color, "Year Of Construction", "Price Per Day", "Price Per 100km Over 15000km") { }
    }

    procedure CheckAutoBaujahr()
    var
        ModelleRec: Record Model;
        BaujahrVon: Date;
        BaujahrBis: Date;
        AutoBau: Date;
    begin
        if ModelleRec.Get("Model Description") then begin
            BaujahrVon := ModelleRec."Manufactoring Start";
            BaujahrBis := ModelleRec."Manufactoring Stop";
        end;

        Autobau := Rec."Year Of Construction";

        if (BaujahrVon = 0D) and (BaujahrBis = 0D) then begin
            Error('Bitte Daten Eingeben');
        end;

        if (BaujahrVon = 0D) xor (BaujahrBis = 0D) then begin
            if BaujahrBis = 0D then begin
                if AutoBau < BaujahrVon then begin
                    Error('Auto kann nicht vor offiziellem Baujahr hergestellt sein');
                end;
            end else if AutoBau > BaujahrBis then begin
                Error('Auto kann nicht nach offiziellem Baujahr hergestellt sein');
            end;
        end;

        if (BaujahrVon <> 0D) and (BaujahrBis <> 0D) then begin
            if AutoBau < BaujahrVon then begin
                Error('Auto kann nicht vor offiziellem Baujahr hergestellt sein');
            end;
            if AutoBau > BaujahrBis then begin
                Error('Auto kann nicht nach offiziellem Baujahr hergestellt sein');
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