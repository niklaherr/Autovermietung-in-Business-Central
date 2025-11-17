page 60000 RentheadRented
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = RentheadRented;
    Caption = 'Rentedlist';
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
                }
            }
        }
    }
}