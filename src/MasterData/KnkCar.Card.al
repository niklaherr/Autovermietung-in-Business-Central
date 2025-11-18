page 70028 "KnkCar Card"
{
    PageType = Card;
    UsageCategory = Tasks;
    SourceTable = "KnkCar";
    Caption = 'Car Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Number Plate"; Rec."Number Plate")
                {
                    ApplicationArea = All;
                }

                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                }

                field("Model Description"; Rec."Model Description")
                {
                    ApplicationArea = All;
                }

                field(Color; Rec.Color)
                {
                    ApplicationArea = All;
                }

                field("Year Of Construction"; Rec."Year Of Construction")
                {
                    ApplicationArea = All;
                }

                field(Rented; Rec.Rented)
                {
                    ApplicationArea = All;
                }

                field("Price Per Day"; Rec."Price Per Day")
                {
                    ApplicationArea = All;
                }

                field("Price Per 100km Over 15000km"; Rec."Price Per 100km Over 15000km")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
