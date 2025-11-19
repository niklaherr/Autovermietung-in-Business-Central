table 50003 "KnkRental Header"
{
    Caption = 'Rental Header';

    fields
    {
        field(1; "Nr"; Integer)
        {
            Caption = 'Nr';
            Editable = false;
            AutoIncrement = true;
        }

        field(3; Customer; Code[20])
        {
            Caption = 'Customer';
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
                CustomerRec: Record Customer;
            begin
                if CustomerRec.Get(Customer) then begin
                    CustomerName := CustomerRec.Name;
                end
                else begin
                    Error('The customer number could not be found.');
                end;
            end;
        }

        field(4; CustomerName; Text[50])
        {
            Caption = 'Customer Name';
            Editable = false;
            TableRelation = Customer.Name;
        }

        field(5; StartDate; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            begin
                ValidateDates();
                RecalculateLines(Rec);
            end;
        }

        field(6; EndDate; Date)
        {
            Caption = 'End Date';
            trigger OnValidate()
            begin
                ValidateDates();
                RecalculateLines(Rec);
            end;
        }

        field(7; Comment; Integer)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("KnkComment" where(HeaderNo = field(Nr), Posted = const(false)));
        }
    }

    keys
    {
        key(PrimaryKey; Nr)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Nr, CustomerName, StartDate, EndDate) { }
    }

    local procedure ValidateDates()
    begin
        if (Rec.StartDate <> 0D) and (Rec.EndDate <> 0D) then begin
            if Rec.EndDate < Rec.StartDate then begin
                Error('The end date cannot be before the start date.');
            end;
        end;
    end;

    local procedure RecalculateLines(RentalHeaderRec: Record "KnkRental Header")
    var
        RentalLine: Record "KnkRental Line";
    begin
        RentalLine.SetRange(HeaderNo, RentalHeaderRec.Nr);
        if RentalLine.FindSet(false) then
            repeat
                RentalLine.Price := RentalLine.CalculatePrice(RentalHeaderRec, RentalLine);
                RentalLine.Modify(false);
            until RentalLine.Next() = 0;
    end;
}
