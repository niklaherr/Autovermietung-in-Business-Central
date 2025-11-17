page 70022 Manufactor
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = Manufactor;
    Caption = 'Manufactorcard';

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