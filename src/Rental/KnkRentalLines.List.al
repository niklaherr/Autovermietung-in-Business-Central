page 70061 "KnkRental Lines"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "KnkRental Line";
    Editable = true;
    Caption = 'Rental Lines';
    CardPageId = 70062;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Nr; Rec.Nr)
                {
                    ApplicationArea = All;
                }

                field(Car; Rec.Car)
                {
                    ApplicationArea = All;
                }

                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                }

                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }

                field("Pickup DateTime"; Rec."Pickup DateTime")
                {
                    ApplicationArea = All;
                    StyleExpr = PickupStyle;
                }

                field("Return DateTime"; Rec."Return DateTime")
                {
                    ApplicationArea = All;
                    StyleExpr = ReturnStyle;
                }

                field("Driven Km"; Rec."Driven Km")
                {
                    ApplicationArea = All;
                }

                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CheckAvailability)
            {
                Caption = 'Check Car Availability';
                ApplicationArea = All;
                Image = DateFormula;

                trigger OnAction()
                var
                    ConflictChecker: Codeunit "KnkReservation Conflict Check";
                    AvailableCars: List of [Code[20]];
                    PickupDT: DateTime;
                    ReturnDT: DateTime;
                    CarText: Text;
                    CarCode: Code[20];
                begin
                    PickupDT := Rec."Pickup DateTime";
                    ReturnDT := Rec."Return DateTime";

                    if (PickupDT = 0DT) or (ReturnDT = 0DT) then begin
                        Message('Please set Pickup and Return Date/Time first.');
                        exit;
                    end;

                    AvailableCars := ConflictChecker.GetAvailableCars(PickupDT, ReturnDT);

                    if AvailableCars.Count > 0 then begin
                        CarText := 'Available cars:\';
                        foreach CarCode in AvailableCars do
                            CarText += CarCode + '\';
                        Message(CarText);
                    end else
                        Message('No cars available in this time period.');
                end;
            }

            action(SetCurrentDateTime)
            {
                Caption = 'Set Current Date/Time';
                ApplicationArea = All;
                Image = Clock;

                trigger OnAction()
                begin
                    Rec.Validate("Pickup DateTime", CurrentDateTime);
                    Rec.Modify(true);
                end;
            }
        }
    }

    var
        PickupStyle: Text;
        ReturnStyle: Text;

    trigger OnAfterGetRecord()
    begin
        if Rec."Pickup DateTime" = 0DT then
            PickupStyle := 'Attention'
        else
            PickupStyle := 'Standard';

        if Rec."Return DateTime" = 0DT then
            ReturnStyle := 'Attention'
        else
            ReturnStyle := 'Standard';
    end;
}
