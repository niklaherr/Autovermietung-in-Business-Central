page 70024 "Model List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Model;
    Editable = false;
    Caption = 'Model List';
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