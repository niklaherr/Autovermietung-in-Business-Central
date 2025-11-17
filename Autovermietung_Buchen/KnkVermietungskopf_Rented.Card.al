page 60001 RentheadsRented
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = RentheadRented;
    Caption = 'Rentcard';
    Editable = false;

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

                field("Booking Date"; Rec."Booking Date")
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
                        CommentRec.SetRange(Booked, true);
                        CommentList.SetTableView(CommentRec);
                        CommentList.Run();
                    end;
                }
            }

            group(Rentrow)
            {
                part(Zeile; 60002)
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
            group("Report")
            {
                Caption = 'Report';
                action("Print Order")
                {
                    ApplicationArea = All;
                    Caption = 'Print Order';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        MyCustumReport: Report Invoice;
                        RentheadRented: Record RentheadRented;
                    begin
                        // MyCustumReport.Run();
                        RentheadRented := Rec;
                        RentheadRented.SetRecFilter();
                        Report.Run(Report::Invoice, true, false, RentheadRented);
                    end;
                }
            }
        }
    }
}