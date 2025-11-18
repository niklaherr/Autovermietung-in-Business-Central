page 70062 "KnkRental Line Card"
{
    PageType = Card;
    UsageCategory = Tasks;
    SourceTable = "KnkRental Line";
    Caption = 'Rental Line Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Nr; Rec.Nr)
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field(HeaderNo; Rec.HeaderNo)
                {
                    ApplicationArea = All;
                }

                field(Car; Rec.Car)
                {
                    ApplicationArea = All;
                }

                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                }

                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }

                field("Driven Km"; Rec."Driven Km")
                {
                    ApplicationArea = All;
                }

                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
