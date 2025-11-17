table 50050 "KnkComment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; HeaderNo; Integer)
        {
            Caption = 'Header No.';
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
        key(PrimaryKey; Nr, HeaderNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; HeaderNo, Booked, Date) { }
    }

    trigger OnModify()
    var
        RentalHeaderRec: Record "KnkRental Header";
        PostedRentalHeaderRec: Record "KnkPosted Rental Header";
    begin
        Date := Today;
        if not Booked then begin
            RentalHeaderRec.Get(HeaderNo);
            RentalHeaderRec.CalcFields(Comment)
        end else begin
            PostedRentalHeaderRec.Get(HeaderNo);
            PostedRentalHeaderRec.CalcFields(Comment)
        end;
    end;


    trigger OnInsert()
    var
        RentalHeaderRec: Record "KnkRental Header";
        PostedRentalHeaderRec: Record "KnkPosted Rental Header";
    begin
        Date := Today;
        if not Booked then begin
            RentalHeaderRec.Get(HeaderNo);
            RentalHeaderRec.CalcFields(Comment)
        end else begin
            PostedRentalHeaderRec.Get(HeaderNo);
            PostedRentalHeaderRec.CalcFields(Comment)
        end;
    end;
}
