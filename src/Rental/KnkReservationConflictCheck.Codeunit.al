codeunit 50010 "KnkReservation Conflict Check"
{
    procedure CheckForConflicts(CurrentRentalLine: Record "KnkRental Line")
    var
        ExistingLine: Record "KnkRental Line";
        ConflictMsg: Label 'The vehicle %1 is already reserved from %2 to %3.\\ \Please choose a different time period or vehicle.';
    begin
        // Nur prüfen wenn alle relevanten Felder gesetzt sind
        if (CurrentRentalLine.Car = '') or
           (CurrentRentalLine."Pickup DateTime" = 0DT) or
           (CurrentRentalLine."Return DateTime" = 0DT) then
            exit;

        // Suche nach anderen Vermietungszeilen für dasselbe Fahrzeug
        ExistingLine.SetRange(Car, CurrentRentalLine.Car);
        ExistingLine.SetFilter(Nr, '<>%1', CurrentRentalLine.Nr);
        ExistingLine.SetFilter("Pickup DateTime", '<>%1', 0DT);
        ExistingLine.SetFilter("Return DateTime", '<>%1', 0DT);

        if ExistingLine.FindSet() then
            repeat
                // Prüfe auf Überschneidung
                if HasOverlap(
                    CurrentRentalLine."Pickup DateTime",
                    CurrentRentalLine."Return DateTime",
                    ExistingLine."Pickup DateTime",
                    ExistingLine."Return DateTime")
                then
                    Error(
                        ConflictMsg,
                        CurrentRentalLine.Car,
                        ExistingLine."Pickup DateTime",
                        ExistingLine."Return DateTime"
                    );
            until ExistingLine.Next() = 0;
    end;

    local procedure HasOverlap(Start1: DateTime; End1: DateTime; Start2: DateTime; End2: DateTime): Boolean
    begin
        // Keine Überschneidung wenn:
        // - Periode 1 endet bevor Periode 2 startet, ODER
        // - Periode 2 endet bevor Periode 1 startet

        if (End1 <= Start2) or (End2 <= Start1) then
            exit(false);

        // Sonst gibt es eine Überschneidung
        exit(true);
    end;

    procedure GetAvailableCars(PickupDateTime: DateTime; ReturnDateTime: DateTime): List of [Code[20]]
    var
        AllCars: Record "KnkCar";
        RentalLine: Record "KnkRental Line";
        AvailableCars: List of [Code[20]];
        IsAvailable: Boolean;
    begin
        if AllCars.FindSet() then
            repeat
                IsAvailable := true;

                // Prüfe ob Auto in diesem Zeitraum bereits gebucht ist
                RentalLine.SetRange(Car, AllCars."Number Plate");
                RentalLine.SetFilter("Pickup DateTime", '<>%1', 0DT);
                RentalLine.SetFilter("Return DateTime", '<>%1', 0DT);

                if RentalLine.FindSet() then
                    repeat
                        if HasOverlap(PickupDateTime, ReturnDateTime,
                            RentalLine."Pickup DateTime", RentalLine."Return DateTime") then
                            IsAvailable := false;
                    until (RentalLine.Next() = 0) or (not IsAvailable);

                if IsAvailable then
                    AvailableCars.Add(AllCars."Number Plate");
            until AllCars.Next() = 0;

        exit(AvailableCars);
    end;
}
