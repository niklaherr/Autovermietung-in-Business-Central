table 50005 "Posted Rental Header"
{

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

        field(4; Customername; Text[50])
        {
            Caption = 'Customername';
            Editable = false;
        }

        field(5; Startdate; Date)
        {
            Caption = 'Start Date';
            Editable = false;
        }

        field(6; Enddate; Date)
        {
            Caption = 'Enddate';
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
            CalcFormula = count("Knk Comment" where(Headnr = field(Nr)));
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
        fieldgroup(DropDown; Customername, Startdate, Enddate, "Booking Date") { }
    }

}