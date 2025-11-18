table 50000 "KnkManufacturer"
{
    Caption = 'Manufacturer';

    fields
    {
        field(1; Name; Code[20])
        {
            Caption = 'Name';
        }

        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(PrimaryKey; Name)
        {
            Clustered = true;
        }
    }
}
