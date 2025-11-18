codeunit 60003 "KnkPosting Rental"
{
    procedure TransferHead(RentalHeader: Record "KnkRental Header"): Integer
    var
        PostedRentalHeader: Record "KnkPosted Rental Header";
    begin
        PostedRentalHeader.Init();
        PostedRentalHeader.Customer := RentalHeader.Customer;
        PostedRentalHeader.CustomerName := RentalHeader.CustomerName;
        PostedRentalHeader.StartDate := RentalHeader.StartDate;
        PostedRentalHeader.EndDate := RentalHeader.EndDate;
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
        SourceCommentRec: Record "KnkComment";
        TargetCommentRec: Record "KnkComment";
    begin
        SourceCommentRec.Reset();
        SourceCommentRec.SetRange(HeaderNo, SourceHeaderNo);
        if SourceCommentRec.FindSet(false) then
            repeat
                TargetCommentRec.Init();
                TargetCommentRec.HeaderNo := TargetHeaderNo;
                TargetCommentRec.Comment := SourceCommentRec.Comment;
                TargetCommentRec.Posted := true;
                TargetCommentRec.Date := SourceCommentRec.Date;
                TargetCommentRec.Insert(true);
                SourceCommentRec.Delete();
            until SourceCommentRec.Next() = 0;
    end;
}
