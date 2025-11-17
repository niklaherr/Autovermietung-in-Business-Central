page 60002 RentrowRented
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = RentrowRented;
    Editable = false;
    Caption = 'Rentedcarslist';

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