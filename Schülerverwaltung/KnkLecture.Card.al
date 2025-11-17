page 70004 LectureCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Lecture;
    Caption = 'Lecture Card';

    layout
    {
        area(Content)
        {
            group(General)
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

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}