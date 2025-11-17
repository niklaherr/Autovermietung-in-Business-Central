page 70052 "KnkRental Header Card"
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = "KnkRental Header";
    Caption = 'KnkRental Header Card';

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
                        CommentRec.SetRange(Booked, false);
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
            group(OrderActions)
            {
                Caption = 'Order';
                action("Book Order")
                {
                    ApplicationArea = All;
                    Caption = 'Book Order';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        Book: Codeunit "KnkPosting Rental";
                        Rentrow: Record "KnkRental Line";
                        NewNumber: Record "KnkPosted Rental Header";
                    begin
                        Book.TransferHead(Rec);
                        Rentrow.SetRange(HeaderNo, Rec.Nr);
                        if Rentrow.FindSet(false) then
                            repeat
                                Book.TransferRow(Rec, Rentrow);
                            until Rentrow.Next() = 0;
                        Book.ClearHead(Rec, Rec.Nr);
                    end;
                }
            }
        }
    }
}
