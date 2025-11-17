page 50052 "KnkComment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "KnkComment";
    Caption = 'KnkComment Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(HeaderNo; Rec.HeaderNo)
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
