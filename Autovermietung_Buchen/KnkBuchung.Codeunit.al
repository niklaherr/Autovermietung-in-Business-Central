codeunit 60003 Book
{
    procedure TransferHead(Renthead: Record Renthead)
    var
        TransferHead: Record RentheadRented;
        AltCommentRec: Record Comment;
        NeuCommentRec: Record Comment;
    begin
        TransferHead.Init();
        TransferHead.Customer := Renthead.Customer;
        TransferHead.Customername := Renthead.Customername;
        TransferHead.Startdate := Renthead.Startdate;
        TransferHead.Enddate := Renthead.Enddate;
        TransferHead."Booking Date" := Today;
        TransferHead.Insert(true);
        AltCommentRec.Reset();
        AltCommentRec.SetRange(AltCommentRec.Headnr, Renthead.Nr);
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

    procedure TransferRow(Renthead: Record Renthead; Rentrow: Record Rentrow)
    var
        TransferRow: Record RentrowRented;
        TransferHead: Record RentheadRented;
    begin
        TransferRow.Init();
        if TransferHead.Find('+') then begin
            TransferRow.Headnr := TransferHead.Nr;
        end;
        TransferRow.Car := Rentrow.Car;
        TransferRow.Manufactor := Rentrow.Manufactor;
        TransferRow.Model := Rentrow.Model;
        TransferRow."Driven Km" := Rentrow."Driven Km";
        TransferRow.Price := Rentrow.Price;
        TransferRow.Insert(true);
        Rentrow.Delete;
    end;

    procedure ClearHead(Renthead: Record Renthead; "Key": Integer)
    begin
        if Renthead.Get("Key") then begin
            Renthead.Delete;
            Message('Eintrag Gebucht!');
        end;
    end;
}