codeunit 60003 "KnkPosting Rental"
{
    procedure TransferHead(RentalHeader: Record "KnkRental Header")
    var
        TransferHead: Record "KnkPosted Rental Header";
        SourceCommentRec: Record "KnkComment";
        TargetCommentRec: Record "KnkComment";
    begin
        TransferHead.Init();
        TransferHead.Customer := RentalHeader.Customer;
        TransferHead.CustomerName := RentalHeader.CustomerName;
        TransferHead.StartDate := RentalHeader.StartDate;
        TransferHead.EndDate := RentalHeader.EndDate;
        TransferHead."Booking Date" := Today;
        TransferHead.Insert(true);
        SourceCommentRec.Reset();
        SourceCommentRec.SetRange(SourceCommentRec.HeaderNo, RentalHeader.Nr);
        if SourceCommentRec.FindSet(false) then
            repeat
                TargetCommentRec.Init();
                TargetCommentRec.Nr := 0;
                TargetCommentRec.HeaderNo := TransferHead.Nr;
                TargetCommentRec.Comment := SourceCommentRec.Comment;
                TargetCommentRec.Booked := true;
                TargetCommentRec.Date := SourceCommentRec.Date;
                TargetCommentRec.Insert(true);
                SourceCommentRec.Delete();
            until SourceCommentRec.Next() = 0;
    end;

    procedure TransferRow(RentalHeader: Record "KnkRental Header"; RentalLine: Record "KnkRental Line")
    var
        TransferRow: Record "KnkPosted Rental Line";
        TransferHead: Record "KnkPosted Rental Header";
    begin
        TransferRow.Init();
        if TransferHead.Find('+') then begin
            TransferRow.HeaderNo := TransferHead.Nr;
        end;
        TransferRow.Car := RentalLine.Car;
        TransferRow.Manufacturer := RentalLine.Manufacturer;
        TransferRow.Model := RentalLine.Model;
        TransferRow."Driven Km" := RentalLine."Driven Km";
        TransferRow.Price := RentalLine.Price;
        TransferRow.Insert(true);
        RentalLine.Delete;
    end;

    procedure ClearHead(RentalHeader: Record "KnkRental Header"; "Key": Integer)
    begin
        if RentalHeader.Get("Key") then begin
            RentalHeader.Delete;
            Message('Rental successfully posted.');
        end;
    end;
}
