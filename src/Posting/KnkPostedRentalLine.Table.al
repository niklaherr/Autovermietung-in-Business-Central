table 50006 "KnkPosted Rental Line"
{

    fields
    {
        field(1; "Nr"; Integer)
        {
            Caption = 'Nr';
            Editable = false;
            AutoIncrement = true;
        }

        field(2; HeaderNo; Integer)
        {
            Caption = 'Header No.';
            Editable = false;
        }

        field(3; Car; Code[20])
        {
            Caption = 'Car';
            Editable = false;
        }

        field(4; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            Editable = false;
        }

        field(5; Model; COde[20])
        {
            Caption = 'Model';
            Editable = false;
        }

        field(6; "Driven Km"; Integer)
        {
            Caption = 'Driven Km';
            Editable = false;
        }

        field(7; Price; Decimal)
        {
            Caption = 'Price';
            Editable = false;
        }
    }


    keys
    {
        key(PrimaryKey;
        Nr, HeaderNo)
        {
            Clustered = true;
        }
    }
}
