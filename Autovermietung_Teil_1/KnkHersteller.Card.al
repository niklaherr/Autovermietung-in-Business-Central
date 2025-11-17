page 70022 Manufacturer
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = Manufacturer;
    Caption = 'Manufacturer Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}