page 50051 comments
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Comment;
    Editable = false;
    CardPageId = 50052;
    Caption = 'Commentlist';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Headnr; Rec.Headnr)
                {
                    ApplicationArea = All;
                }

                field(Nr; Rec.Nr)
                {
                    ApplicationArea = All;
                }

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }

                field(Booked; Rec.Booked)
                {
                    ApplicationArea = All;
                }

                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
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