page 70024 Models
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Model;
    Editable = false;
    Caption = 'Modelllist';
    CardPageId = 70025;

    layout
    {
        area(Content)
        {
            repeater(Group)
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