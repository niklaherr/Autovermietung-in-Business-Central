page 70051 "KnkRental Header List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "KnkRental Header";
    Caption = 'Rental Header List';
    CardPageId = 70052;
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
                }
            }
        }
    }
}
