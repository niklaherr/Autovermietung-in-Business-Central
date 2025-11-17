page 70052 "Rental Header Card"
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = "Rental Header";
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

                field(Customername; Rec.Customername)
                {
                    ApplicationArea = All;
                }

                field(Startdate; Rec.Startdate)
                {
                    ApplicationArea = All;
                }


                field(Enddate; Rec.Enddate)
                {
                    ApplicationArea = All;
                }

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                        CommentList: Page "Knk Comment List";
                        CommentRec: Record "Knk Comment";
                    begin
                        CommentRec.SetRange(Headnr, Rec.Nr);
                        CommentRec.SetRange(Booked, false);
                        CommentList.SetTableView(CommentRec);
                        CommentList.Run();
                    end;
                }
            }

            group(RentalLines)
            {
                part(Zeile; 70061)
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
            group("Auftrag")
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
                        Book: Codeunit Book;
                        Rentrow: Record "Rental Line";
                        NewNumber: Record "Posted Rental Header";
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
