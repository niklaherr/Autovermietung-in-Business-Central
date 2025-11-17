table 70001 Lecture
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }

        field(2; "Description"; Text[50])
        {
        }

        field(3; "Session"; Date)
        {
        }

        field(4; "Classroom"; Text[10])
        {
        }

        field(5; "Class Teacher"; Code[20])
        {
            TableRelation = Teacher;
        }
    }

    keys
    {
        key(PrimaryKey; "Code", "Description")
        {
            Clustered = true;
        }
    }
}