table 50005 "KnkPosted Rental Header"
{
    Caption = 'Posted Rental Header';

    fields
    {
        field(1; "Nr"; Integer)
        {
            Caption = 'Nr';
            Editable = false;
            AutoIncrement = true;
        }

        field(3; Customer; Code[20])
        {
            Caption = 'Customer';
            Editable = false;
        }

        field(4; CustomerName; Text[50])
        {
            Caption = 'Customer Name';
            Editable = false;
        }

        field(5; StartDate; Date)
        {
            Caption = 'Start Date';
            Editable = false;
        }

        field(6; EndDate; Date)
        {
            Caption = 'End Date';
            Editable = false;
        }

        field(7; "Booking Date"; Date)
        {
            Caption = 'Booking Date';
            Editable = false;
        }

        field(8; Comment; Integer)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("KnkComment" where(HeaderNo = field(Nr), Posted = const(true)));
        }
    }

    keys
    {
        key(PrimaryKey; Nr)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; CustomerName, StartDate, EndDate, "Booking Date") { }
    }

}
