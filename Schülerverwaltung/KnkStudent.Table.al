table 70000 Student
{

    DrillDownPageId = StudentCard;
    LookupPageId = StudentCard;
    Caption = 'Student';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }

        field(2; "Salutation"; Text[20])
        {
        }

        field(3; "Name"; Text[50])
        {
        }

        field(4; "Name 2"; Text[50])
        {
        }

        field(5; "City"; Text[50])
        {
        }

        field(6; "Post Code"; Code[20])
        {
        }

        field(7; "Address"; Text[50])
        {
        }

        field(8; "Country Code"; Code[10])
        {
        }

        field(9; "Phone No."; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }

        field(10; "Birth Date"; Date)
        {
        }

        field(11; "Birth Place"; Text[50])
        {
        }

        field(12; "Gender"; enum Gender)
        {
        }

        field(13; "Denomination"; Text[50])
        {
        }

        field(14; "1. Parent"; Text[80])
        {
        }

        field(15; "2. Parent"; Text[80])
        {
        }

        field(16; "Average Grade"; Decimal)
        {
        }

        field(17; "Class Teacher"; Code[20])
        {
            TableRelation = Teacher;
        }

        field(18; "Lecture Code"; Code[20])
        {
            TableRelation = Lecture;
        }
    }

    keys
    {
        key(PrimaryKey; "No.", Name, "Name 2")
        {
            Clustered = true;
        }
    }
}