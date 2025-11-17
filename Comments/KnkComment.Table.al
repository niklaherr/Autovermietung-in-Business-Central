table 50050 "KnkComment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Headnr; Integer)
        {
            Caption = 'Headnr';
            DataClassification = ToBeClassified;
            TableRelation = "KnkRental Header";
        }

        field(2; Nr; Integer)
        {
            Caption = 'Nr';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(3; Comment; Text[250])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }

        field(4; Booked; Boolean)
        {
            Caption = 'Booked';
            DataClassification = ToBeClassified;
        }

        field(5; Date; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PrimaryKey; Nr, Headnr)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Headnr, Booked, Date) { }
    }

    trigger OnModify()
    var
        RecRenthead: Record "KnkRental Header";
        RecHeadRented: Record "KnkPosted Rental Header";
    begin
        Date := Today;
        if not Booked then begin
            RecRenthead.Get(Headnr);
            RecRenthead.CalcFields(Comment)
        end else begin
            RecHeadRented.Get(Headnr);
            RecHeadRented.CalcFields(Comment)
        end;
    end;


    trigger OnInsert()
    var
        RecRenthead: Record "KnkRental Header";
        RecHeadRented: Record "KnkPosted Rental Header";
    begin
        Date := Today;
        if not Booked then begin
            RecRenthead.Get(Headnr);
            RecRenthead.CalcFields(Comment)
        end else begin
            RecHeadRented.Get(Headnr);
            RecHeadRented.CalcFields(Comment)
        end;
    end;
}
