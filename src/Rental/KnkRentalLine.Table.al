table 50004 "KnkRental Line"
{
    Caption = 'Rental Line';

    fields
    {
        field(1; "Nr"; Integer)
        {
            Caption = 'Nr';
            Editable = false;
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

        field(2; HeaderNo; Integer)
        {
            Caption = 'Header No.';
            TableRelation = "KnkRental Header";
            Editable = false;
        }

        field(3; Car; Code[20])
        {
            Caption = 'Car';
            TableRelation = "KnkCar"."Number Plate";
            trigger OnValidate()
            begin
                PopulateCarDetails();
            end;
        }

        field(4; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            Editable = false;
            TableRelation = "KnkCar".Manufacturer;
        }

        field(5; Model; Code[20])
        {
            Caption = 'Model';
            Editable = false;
            TableRelation = "KnkCar"."Model Description";
        }

        field(6; "Driven Km"; Integer)
        {
            Caption = 'Driven Km';
            trigger OnValidate()
            begin
                UpdatePriceFromDates();
            end;
        }

        field(7; Price; Decimal)
        {
            Caption = 'Price';
            Editable = false;
        }

        field(10; "Pickup DateTime"; DateTime)
        {
            Caption = 'Pickup Date/Time';

            trigger OnValidate()
            var
                ConflictChecker: Codeunit "KnkReservation Conflict Check";
            begin
                if ("Pickup DateTime" <> 0DT) and ("Return DateTime" <> 0DT) then begin
                    // Prüfe ob Return nach Pickup liegt
                    if "Return DateTime" < "Pickup DateTime" then
                        Error('The return date/time cannot be before the pickup date/time.');

                    // Prüfe auf Konflikte mit anderen Reservierungen
                    ConflictChecker.CheckForConflicts(Rec);

                    // Preis neu berechnen
                    UpdatePriceFromDates();
                end;
            end;
        }

        field(11; "Return DateTime"; DateTime)
        {
            Caption = 'Return Date/Time';

            trigger OnValidate()
            var
                ConflictChecker: Codeunit "KnkReservation Conflict Check";
            begin
                if ("Pickup DateTime" <> 0DT) and ("Return DateTime" <> 0DT) then begin
                    // Prüfe ob Return nach Pickup liegt
                    if "Return DateTime" < "Pickup DateTime" then
                        Error('The return date/time cannot be before the pickup date/time.');

                    // Prüfe auf Konflikte mit anderen Reservierungen
                    ConflictChecker.CheckForConflicts(Rec);

                    // Preis neu berechnen
                    UpdatePriceFromDates();
                end;
            end;
        }
    }


    keys
    {
        key(PrimaryKey;
        Nr, HeaderNo)
        {
            Clustered = true;
        }
    }

    procedure CalculatePrice(RentLine: Record "KnkRental Line"): Decimal
    var
        CarRecord: Record "KnkCar";
        BasePrice: Decimal;
        AdditionalPrice: Decimal;
        DurationInMilliseconds: BigInteger;
        RentalHours: Decimal;
        RentalDays: Decimal;
    begin
        if RentLine.Car = '' then
            exit(0);

        if not CarRecord.Get(RentLine.Car) then
            Error('The selected car could not be found.');

        // Prüfe ob DateTime-Felder gesetzt sind
        if (RentLine."Pickup DateTime" = 0DT) or (RentLine."Return DateTime" = 0DT) then
            exit(0);

        // Berechne Dauer in Millisekunden
        DurationInMilliseconds := RentLine."Return DateTime" - RentLine."Pickup DateTime";

        if DurationInMilliseconds < 0 then
            Error('The return date/time must be after the pickup date/time.');

        // Konvertiere Millisekunden in Stunden (3.600.000 ms = 1h)
        RentalHours := DurationInMilliseconds / 3600000;

        // Konvertiere Stunden in Tage
        RentalDays := RentalHours / 24;

        // Runde auf halbe Tage, min. 0.5
        if RentalDays <= 0.5 then
            RentalDays := 0.5 // Minimum Halbtagesbuchung
        else if RentalDays < 1 then
            RentalDays := 1 // Werte zwischen 0.5 und 1 Tag = voller Tag
        else
            RentalDays := Round(RentalDays, 0.5, '>'); // Auf halbe Tage aufrunden

        BasePrice := RentalDays * CarRecord."Price Per Day";

        if RentLine."Driven Km" > 15000 then begin
            AdditionalPrice := CarRecord."Price Per 100km Over 15000km" * ((RentLine."Driven Km" - 15000) / 100);
            BasePrice := BasePrice + AdditionalPrice;
        end;

        exit(BasePrice);
    end;

    local procedure UpdatePriceFromDates()
    begin
        if (Rec."Pickup DateTime" <> 0DT) and (Rec."Return DateTime" <> 0DT) then
            Price := CalculatePrice(Rec);
    end;

    local procedure PopulateCarDetails()
    var
        CarRecord: Record "KnkCar";
    begin
        if not CarRecord.Get(Car) then
            Error('The selected car could not be found.');

        Manufacturer := CarRecord.Manufacturer;
        Model := CarRecord."Model Description";

        // Berechne Preis nur wenn DateTime-Felder gesetzt sind
        if ("Pickup DateTime" <> 0DT) and ("Return DateTime" <> 0DT) then
            Price := CalculatePrice(Rec);
    end;
}
