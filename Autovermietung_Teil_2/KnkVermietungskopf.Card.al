page 70052 VermietungskopfCard
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = RentalHeader;
    Caption = 'RentalHeader';

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
                        CommentList: Page comments;
                        CommentRec: Record Comment;
                    begin
                        CommentRec.SetRange(Headnr, Rec.Nr);
                        CommentRec.SetRange(Booked, false);
                        CommentList.SetTableView(CommentRec);
                        CommentList.Run();
                    end;
                }
            }

            group(Rentrow)
            {
                part(Zeile; 70061)
                {
                    ApplicationArea = All;
                    SubPageLink = "Headnr" = field(Nr);
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
                        Rentrow: Record Rentrow;
                        NewNumber: Record RentheadRented;
                    begin
                        Book.TransferHead(Rec);
                        Rentrow.SetRange(Headnr, Rec.Nr);
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
