table 50001 Model
{

    fields
    {
        field(1; Model; Code[20])
        {
            Caption = 'Model';
        }

        field(2; Manufactor; Code[20])
        {
            Caption = 'Manufactor';
            TableRelation = Manufactor;
        }

        field(3; "Manufactoring Start"; Date)
        {
            Caption = 'Manufactoring Start';
        }

        field(4; "Manufactoring Stop"; Date)
        {
            Caption = 'Manufactoring Stop';
        }
    }

    keys
    {
        key(PrimaryKey; Model)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Model, "Manufactoring Start", "Manufactoring Stop") { }
    }

    var
        AutosRec: Record Car;

    trigger OnInsert()
    begin
        CheckDates();
    end;

    trigger OnModify()
    begin
        CheckDates();
    end;


    local procedure CheckDates()
    var
        BaujahrVon: Date;
        BaujahrBis: Date;
    begin
        BaujahrVon := Rec."Manufactoring Start";
        BaujahrBis := Rec."Manufactoring Stop";


        if (BaujahrVon <> 0D) and (BaujahrBis <> 0D) then begin
            if BaujahrVon > BaujahrBis then begin
                Error('Das "Baujahr von" darf nicht nach dem "Baujahr bis" liegen.');
            end;
        end;
    end;
}