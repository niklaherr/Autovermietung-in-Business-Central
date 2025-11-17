page 70025 Model
{
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = Model;
    Caption = 'Modelcard';

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

                field(Manufactor; Rec.Manufactor)
                {
                    ApplicationArea = All;
                }

                field("Manufactoring Start"; Rec."Manufactoring Start")
                {
                    ApplicationArea = All;
                }

                field("Manufactoring Stop"; Rec."Manufactoring Stop")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}