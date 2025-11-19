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
        fieldgroup(DropDown; Nr, CustomerName) { }
    }
}
