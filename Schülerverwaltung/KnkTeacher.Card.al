page 70006 TeacherCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Teacher;
    Caption = 'Teacher Card';

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

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }

                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }

                field("City"; Rec.City)
                {
                    ApplicationArea = All;
                }

                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }

                field("Address"; Rec.Address)
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

                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }

                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                }

                field("Birthplace"; Rec.Birthplace)
                {
                    ApplicationArea = All;
                }

                field("Gender"; Rec.Gender)
                {
                    ApplicationArea = All;
                }

                field("Denomination"; Rec.Denomination)
                {
                    ApplicationArea = All;
                }

                field("Tax ID"; Rec."Tax ID")
                {
                    ApplicationArea = All;
                }

                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }

                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = All;
                }

                field("1. Subject"; Rec."1. Subject")
                {
                    ApplicationArea = All;
                }

                field("2. Subject"; Rec."2. Subject")
                {
                    ApplicationArea = All;
                }

                field("3. Subject"; Rec."3. Subject")
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