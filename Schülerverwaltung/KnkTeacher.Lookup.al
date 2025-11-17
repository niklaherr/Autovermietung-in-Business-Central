page 70010 TeacherLookup
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = Teacher;
    Caption = 'Teacher Lookup';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field(Salutation; Rec.Salutation)
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
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Select)
            {
                Caption = 'Select';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.Mark(true);
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        myInt: Integer;
}