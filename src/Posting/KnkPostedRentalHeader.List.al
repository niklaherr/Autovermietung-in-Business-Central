page 60000 "KnkPosted Rental Header List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "KnkPosted Rental Header";
    Caption = 'Posted Rental Header List';
    CardPageId = 60001;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
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

                field("Booking Date"; Rec."Booking Date")
                {
                    ApplicationArea = All;
                }


                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
