page 60002 "KnkPosted Rental Lines"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "KnkPosted Rental Line";
    Editable = false;
    Caption = 'KnkPosted Rental Lines';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Nr; Rec.Nr)
                {
                    ApplicationArea = All;
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
