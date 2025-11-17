page 70027 "Car List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Car;
    Editable = false;
    Caption = 'Car List';
    CardPageId = 70028;

    layout
    {
        area(Content)
        {
            repeater(Group)
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