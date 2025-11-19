codeunit 60003 "KnkPosting Rental"
{
    procedure TransferHead(RentalHeader: Record "KnkRental Header"): Integer
    var
        PostedRentalHeader: Record "KnkPosted Rental Header";
    begin
        PostedRentalHeader.Init();
        PostedRentalHeader.Customer := RentalHeader.Customer;
        PostedRentalHeader.CustomerName := RentalHeader.CustomerName;
        PostedRentalHeader."Booking Date" := Today;
        PostedRentalHeader.Insert(true);

        TransferComments(RentalHeader.Nr, PostedRentalHeader.Nr);
        exit(PostedRentalHeader.Nr);
    end;

    procedure TransferRow(PostedHeaderNo: Integer; RentalLine: Record "KnkRental Line")
    var
        PostedRentalLine: Record "KnkPosted Rental Line";
    begin
        PostedRentalLine.Init();
        PostedRentalLine.HeaderNo := PostedHeaderNo;
        PostedRentalLine.Car := RentalLine.Car;
        PostedRentalLine.Manufacturer := RentalLine.Manufacturer;
        PostedRentalLine.Model := RentalLine.Model;
        PostedRentalLine."Driven Km" := RentalLine."Driven Km";
        PostedRentalLine.Price := RentalLine.Price;
        PostedRentalLine."Pickup DateTime" := RentalLine."Pickup DateTime";
        PostedRentalLine."Return DateTime" := RentalLine."Return DateTime";
        PostedRentalLine.Insert(true);

        RentalLine.Delete();
    end;

    procedure ClearHead(RentalHeaderNo: Integer)
    var
        RentalHeader: Record "KnkRental Header";
    begin
        if RentalHeader.Get(RentalHeaderNo) then begin
            RentalHeader.Delete();
            Message('Rental successfully posted.');
        end;
    end;

    local procedure TransferComments(SourceHeaderNo: Integer; TargetHeaderNo: Integer)
    var
        CommentRec: Record "KnkComment";
    begin
        CommentRec.SetRange(HeaderNo, SourceHeaderNo);
        CommentRec.SetRange(Posted, false);
        while CommentRec.FindFirst() do begin
            CommentRec.Posted := true;
            CommentRec.Modify();
            if CommentRec.HeaderNo <> TargetHeaderNo then
                CommentRec.Rename(CommentRec.Nr, TargetHeaderNo);
        end;
    end;
}
