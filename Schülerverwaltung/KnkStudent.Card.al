page 70001 StudentCard
{
    PageType = Card;
    SourceTable = Student;
    Caption = 'Student Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Salutation"; Rec.Salutation)
                {
                    ApplicationArea = All;
                }

                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                }

                field("City"; Rec."City")
                {
                    ApplicationArea = All;
                }

                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }

                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                }

                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = All;
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }

                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                }

                field("Birth Place"; Rec."Birth Place")
                {
                    ApplicationArea = All;
                }

                field("Gender"; Rec."Gender")
                {
                    ApplicationArea = All;
                }

                field("Denomination"; Rec."Denomination")
                {
                    ApplicationArea = All;
                }

                field("1. Parent"; Rec."1. Parent")
                {
                    ApplicationArea = All;
                }

                field("2. Parent"; Rec."2. Parent")
                {
                    ApplicationArea = All;
                }

                field("Average Grade"; Rec."Average Grade")
                {
                    ApplicationArea = All;
                }

                field("Class Teacher"; Rec."Class Teacher")
                {
                    ApplicationArea = All;
                }

                field("Lecture Code"; Rec."Lecture Code")
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