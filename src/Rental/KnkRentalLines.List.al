page 70061 "KnkRental Lines"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "KnkRental Line";
    Editable = true;
    Caption = 'Rental Lines';
    CardPageId = 70062;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
