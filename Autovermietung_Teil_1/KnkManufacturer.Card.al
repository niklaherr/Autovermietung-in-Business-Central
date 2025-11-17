page 70022 "Knk Manufacturer Card"
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = "Knk Manufacturer";
    Caption = 'Knk Manufacturer Card';

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