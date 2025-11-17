table 50001 Model
{

    fields
    {
        field(1; Model; Code[20])
        {
            Caption = 'Model';
        }

        field(2; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            TableRelation = "Knk Manufacturer";
        }

        field(3; "Manufacturing Start"; Date)
        {
            Caption = 'Manufacturing Start';
        }

        field(4; "Manufacturing Stop"; Date)
        {
            Caption = 'Manufacturing Stop';
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
        fieldgroup(DropDown; Model, "Manufacturing Start", "Manufacturing Stop") { }
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
        BaujahrVon := Rec."Manufacturing Start";
        BaujahrBis := Rec."Manufacturing Stop";


        if (BaujahrVon <> 0D) and (BaujahrBis <> 0D) then begin
            if BaujahrVon > BaujahrBis then begin
                Error('Das "Baujahr von" darf nicht nach dem "Baujahr bis" liegen.');
            end;
        end;
    end;
}