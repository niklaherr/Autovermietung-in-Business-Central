page 70022 "KnkManufacturer Card"
{
    PageType = Card;
    UsageCategory = Tasks;
    SourceTable = "KnkManufacturer";
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
