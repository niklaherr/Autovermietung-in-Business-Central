page 60001 "KnkPosted Rental Header Card"
{
    PageType = Card;
    UsageCategory = History;
    SourceTable = "KnkPosted Rental Header";
    Caption = 'Posted Rental Header Card';
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

                field("Booking Date"; Rec."Booking Date")
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
                        CommentRec.SetRange(Posted, true);
                        CommentList.SetTableView(CommentRec);
                        CommentList.Run();
                    end;
            }
            }

            group(RentalLines)
            {
                part(RentalLinesPart; 60002)
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
                        RentheadRented: Record "KnkPosted Rental Header";
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
