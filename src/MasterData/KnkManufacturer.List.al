page 70021 "KnkManufacturer List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "KnkManufacturer";
    Editable = false;
    Caption = 'Manufacturer List';
    CardPageId = 70022;

    layout
    {
        area(Content)
        {
            repeater(Group)
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
