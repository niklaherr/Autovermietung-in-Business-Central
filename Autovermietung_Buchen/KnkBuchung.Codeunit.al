codeunit 60003 Book
{
    procedure TransferHead(RentalHeader: Record "Rental Header")
    var
        TransferHead: Record "Posted Rental Header";
        AltCommentRec: Record Comment;
        NeuCommentRec: Record Comment;
    begin
        TransferHead.Init();
        TransferHead.Customer := RentalHeader.Customer;
        TransferHead.Customername := RentalHeader.Customername;
        TransferHead.Startdate := RentalHeader.Startdate;
        TransferHead.Enddate := RentalHeader.Enddate;
        TransferHead."Booking Date" := Today;
        TransferHead.Insert(true);
        AltCommentRec.Reset();
        AltCommentRec.SetRange(AltCommentRec.Headnr, RentalHeader.Nr);
        if AltCommentRec.FindSet(false) then
            repeat
                NeuCommentRec.Init();
                NeuCommentRec.Nr := 0;
                NeuCommentRec.Headnr := TransferHead.Nr;
                NeuCommentRec.Comment := AltCommentRec.Comment;
                NeuCommentRec.Booked := true;
                NeuCommentRec.Date := AltCommentRec.Date;
                NeuCommentRec.Insert(true);
                AltCommentRec.Delete();
            until AltCommentRec.Next() = 0;
    end;

    procedure TransferRow(RentalHeader: Record "Rental Header"; RentalLine: Record "Rental Line")
    var
        TransferRow: Record "Posted Rental Line";
        TransferHead: Record "Posted Rental Header";
    begin
        TransferRow.Init();
        if TransferHead.Find('+') then begin
            TransferRow.Headnr := TransferHead.Nr;
        end;
        TransferRow.Car := RentalLine.Car;
        TransferRow.Manufacturer := RentalLine.Manufacturer;
        TransferRow.Model := RentalLine.Model;
        TransferRow."Driven Km" := RentalLine."Driven Km";
        TransferRow.Price := RentalLine.Price;
        TransferRow.Insert(true);
        RentalLine.Delete;
    end;

    procedure ClearHead(RentalHeader: Record "Rental Header"; "Key": Integer)
    begin
        if RentalHeader.Get("Key") then begin
            RentalHeader.Delete;
            Message('Eintrag Gebucht!');
        end;
    end;
}