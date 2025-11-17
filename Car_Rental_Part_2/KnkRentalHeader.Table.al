table 50003 "KnkRental Header"
{

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
                KundeRec: Record Customer;
            begin
                if KundeRec.Get(Customer) then begin
                    Customername := KundeRec.Name;
                end
                else begin
                    Error('Die Kundennummer konnte nicht gefunden werden');
                end;
            end;
        }

        field(4; Customername; Text[50])
        {
            Caption = 'Customername';
            Editable = false;
            TableRelation = Customer.Name;
        }

        field(5; Startdate; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            begin
                DatumCheck();
                RecalculateLines(Rec);
            end;
        }

        field(6; Enddate; Date)
        {
            Caption = 'Enddate';
            trigger OnValidate()
            begin
                DatumCheck();
                RecalculateLines(Rec);
            end;
        }

        field(7; Comment; Integer)
        {
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("KnkComment" where(Headnr = field(Nr)));
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
        fieldgroup(DropDown; Nr, Customername, Startdate, Enddate) { }
    }

    local procedure DatumCheck()
    var
        myInt: Integer;
    begin
        if (rec.Startdate <> 0D) and (rec.Enddate <> 0D) then begin
            if rec.Enddate < rec.Startdate then begin
                Error('Das Enddatum kann nicht vor dem Startdatum liegen');
            end;
        end;
    end;

    local procedure RecalculateLines(RentalHeaderRec: Record "KnkRental Header")
    var
        RentalLine: Record "KnkRental Line";
    begin
        RentalLine.SetRange(HeaderNo, Nr);
        if RentalLine.FindSet(false) then
            repeat
                RentalLine.Price := RentalLine.Verrechnen(RentalHeaderRec, RentalLine);
                RentalLine.Modify(false);
            until RentalLine.Next() = 0;
    end;
}
