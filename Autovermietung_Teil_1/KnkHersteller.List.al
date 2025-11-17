page 70021 Manufacturers
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Manufacturer;
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