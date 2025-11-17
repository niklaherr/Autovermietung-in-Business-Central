page 50052 "Knk Comment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Knk Comment";
    Caption = 'Knk Comment Card';

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