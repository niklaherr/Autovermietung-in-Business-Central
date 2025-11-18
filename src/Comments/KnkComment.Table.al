table 50050 "KnkComment"
{
    Caption = 'Rental Comment';
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

        field(4; Posted; Boolean)
        {
            Caption = 'Posted';
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
        fieldgroup(DropDown; HeaderNo, Posted, Date) { }
    }

    trigger OnModify()
    begin
        UpdateParentCommentCount();
    end;


    trigger OnInsert()
    begin
        UpdateParentCommentCount();
    end;

    local procedure UpdateParentCommentCount()
    var
        RentalHeaderRec: Record "KnkRental Header";
        PostedRentalHeaderRec: Record "KnkPosted Rental Header";
    begin
        Date := Today;
        if not Posted then begin
            if RentalHeaderRec.Get(HeaderNo) then
                RentalHeaderRec.CalcFields(Comment);
        end else begin
            if PostedRentalHeaderRec.Get(HeaderNo) then
                PostedRentalHeaderRec.CalcFields(Comment);
        end;
    end;
}
