page 70062 RentalLinesCard
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = RentalLines;
    Caption = 'Vermietungszeilen';

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

                field(Manufactor; Rec.Manufactor)
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