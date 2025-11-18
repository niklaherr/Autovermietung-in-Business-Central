page 70025 "KnkModel Card"
{
    PageType = Card;
    UsageCategory = Tasks;
    SourceTable = "KnkModel";
    Caption = 'Model Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }

                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                }

                field("Manufacturing Start"; Rec."Manufacturing Start")
                {
                    ApplicationArea = All;
                }

                field("Manufacturing Stop"; Rec."Manufacturing Stop")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
