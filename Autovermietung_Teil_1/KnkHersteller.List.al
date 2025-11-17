page 70021 Manufactors
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Manufactor;
    Editable = false;
    Caption = 'Manufactorlist';
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