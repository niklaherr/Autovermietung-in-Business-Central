table 70002 Teacher
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }

        field(2; "Salutation"; Text[20])
        {
        }

        field(3; "First Name"; Text[50])
        {
        }

        field(4; "Last Name"; Text[50])
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
        }

        field(10; "E-Mail"; Text[80])
        {
        }

        field(11; "Birth Date"; Date)
        {
        }

        field(12; "Birthplace"; Text[50])
        {
        }

        field(13; "Gender"; enum Gender)
        {
        }

        field(14; "Denomination"; Text[50])
        {
        }

        field(15; "Tax ID"; Text[50])
        {
        }

        field(16; "Account No."; Text[20])
        {
        }

        field(17; "Bank Code"; Code[20])
        {
        }

        field(18; "1. Subject"; Text[50])
        {
            TableRelation = Lecture;
        }

        field(19; "2. Subject"; Text[50])
        {
            TableRelation = Lecture;
        }

        field(20; "3. Subject"; Text[50])
        {
            TableRelation = Lecture;
        }
    }

    keys
    {
        key(PrimaryKey; "Last Name", "No.")
        {
            Clustered = true;
        }
    }
}