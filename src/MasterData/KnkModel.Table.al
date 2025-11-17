table 50001 "KnkModel"
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
            TableRelation = "KnkManufacturer";
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
        AutosRec: Record "KnkCar";

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
        ManufacturingStartDate: Date;
        ManufacturingStopDate: Date;
    begin
        ManufacturingStartDate := Rec."Manufacturing Start";
        ManufacturingStopDate := Rec."Manufacturing Stop";


        if (ManufacturingStartDate <> 0D) and (ManufacturingStopDate <> 0D) then begin
            if ManufacturingStartDate > ManufacturingStopDate then begin
                Error('The "Manufacturing Start" date must be before the "Manufacturing Stop" date.');
            end;
        end;
    end;
}
