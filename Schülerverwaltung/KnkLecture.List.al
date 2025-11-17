page 70002 LectureList
{
    PageType = List;
    CardPageId = LectureCard;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Lecture;
    Caption = 'Lecture List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }

                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field("Session"; Rec.Session)
                {
                    ApplicationArea = All;
                }

                field("Classroom"; Rec.Classroom)
                {
                    ApplicationArea = All;
                }

                field("Class Teacher"; Rec."Class Teacher")
                {
                    ApplicationArea = All;
                }

            }

        }
    }
}