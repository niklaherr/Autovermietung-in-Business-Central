page 70022 "KnkManufacturer Card"
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = "KnkManufacturer";
    Caption = 'KnkManufacturer Card';

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
