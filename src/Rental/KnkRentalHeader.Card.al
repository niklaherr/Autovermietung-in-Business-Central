page 70052 "KnkRental Header Card"
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = "KnkRental Header";
    Caption = 'Rental Header Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Nr"; Rec.Nr)
                {
                    ApplicationArea = All;
                }

                field(Customer; Rec.Customer)
                {
                    ApplicationArea = All;
                }

                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;
                }

                field(StartDate; Rec.StartDate)
                {
                    ApplicationArea = All;
                }


                field(EndDate; Rec.EndDate)
                {
                    ApplicationArea = All;
                }

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                        CommentList: Page "KnkComment List";
                        CommentRec: Record "KnkComment";
                    begin
                        CommentRec.SetRange(HeaderNo, Rec.Nr);
                        CommentRec.SetRange(Posted, false);
                        CommentList.SetTableView(CommentRec);
                        CommentList.Run();
                    end;
                }
            }

            group(RentalLines)
            {
                part(RentalLinesPart; 70061)
                {
                    ApplicationArea = All;
                    SubPageLink = "HeaderNo" = field(Nr);
                    UpdatePropagation = Both;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(RentalActions)
            {
                Caption = 'Rental';
                action("Post Rental")
                {
                    ApplicationArea = All;
                    Caption = 'Post Rental';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        PostingManager: Codeunit "KnkPosting Rental";
                        RentRow: Record "KnkRental Line";
                        PostedHeaderNo: Integer;
                    begin
                        PostedHeaderNo := PostingManager.TransferHead(Rec);
                        RentRow.SetRange(HeaderNo, Rec.Nr);
                        if RentRow.FindSet(false) then
                            repeat
                                PostingManager.TransferRow(PostedHeaderNo, RentRow);
                            until RentRow.Next() = 0;
                        PostingManager.ClearHead(Rec.Nr);
                    end;
                }
            }
        }
    }
}
