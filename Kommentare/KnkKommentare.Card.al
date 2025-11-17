page 50052 comment
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Comment;
    Caption = 'Kommentarkarte';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Headnr; Rec.Headnr)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Nr; Rec.Nr)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }

                field(Booked; Rec.Booked)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }
}