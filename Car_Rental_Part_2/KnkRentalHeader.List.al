page 70051 "KnkRental Header List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "KnkRental Header";
    Caption = 'KnkRental Header List';
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
                }
            }
        }
    }
}
