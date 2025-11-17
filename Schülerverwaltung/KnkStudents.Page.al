page 70000 StudentList
{
    PageType = List;
    CardPageId = StudentCard;
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Student;
    Caption = 'Student List';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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

                field("Address"; Rec."Address")
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

                field("Average Grade"; Rec."Average Grade")
                {
                    ApplicationArea = All;
                }

            }

        }
    }
}