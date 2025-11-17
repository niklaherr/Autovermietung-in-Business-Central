page 50051 "Knk Comment List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Knk Comment";
    Editable = false;
    CardPageId = 50052;
    Caption = 'Knk Comment List';

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