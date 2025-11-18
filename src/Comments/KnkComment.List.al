page 50051 "KnkComment List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "KnkComment";
    Editable = false;
    CardPageId = 50052;
    Caption = 'Rental Comment List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(HeaderNo; Rec.HeaderNo)
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

                field(Posted; Rec.Posted)
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
