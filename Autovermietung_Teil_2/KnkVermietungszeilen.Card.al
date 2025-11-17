page 70062 "Rental Line Card"
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = "Rental Line";
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

                field(Headnr; Rec.Headnr)
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