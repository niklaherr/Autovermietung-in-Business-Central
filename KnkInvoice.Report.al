report 60050 Invoice
{
    DefaultLayout = RDLC;
    RDLCLayout = './KnkCarRentalInvoice.rdlc';
    Caption = 'Invoice';
    UsageCategory = Documents;
    ApplicationArea = All;


    dataset
    {
        dataitem(Rentedhead; RentheadRented)
        {
            RequestFilterFields = Nr;

            column(Nr; Nr)
            {
            }

            column(Customer; Customer)
            {
            }

            column(Customername; Customername)
            {
            }

            column(Startdate; Startdate)
            {
            }

            column(Enddate; Enddate)
            {
            }

            column(Booking_Date; "Booking Date")
            {
            }

            column(Demo; Demo)
            {
            }

            column(CompanyName; Firmendaten.Name)
            {
            }

            column(CompanyAddress; Firmendaten.Address)
            {
            }

            column(CompanyCity; Firmendaten.City)
            {
            }

            column(CompanyPost_Code; Firmendaten."Post Code")
            {
            }


            column(Address; CustomerRec.Address)
            {
            }

            column(Post_Code; CustomerRec."Post Code")
            {
            }

            column(City; CustomerRec.City)
            {
            }

            column(CompanyBlock; CompanyBlock)
            {
            }

            column(CustomerBlock; CustomerBlock)
            {
            }

            column(CustomerPreInfo; CustomerPreInfo)
            {
            }

            column(CustomerInfo; CustomerInfo)
            {
            }

            column(FullCar; FullCar)
            {
            }

            column(Color; CarTable.color)
            {
            }

            column(Year_Of_Construction; CarTable."Year Of Construction")
            {
            }

            column(Price_Per_Day; CarTable."Price Per Day")
            {
            }

            column(Price_Per_100km_Over_15000km; CarTable."Price Per 100km Over 15000km")
            {
            }

            column(NumberPlate; CarTable."Number Plate")
            {
            }

            column(Gesamtpreis; Gesamtpreis)
            {
            }

            column(Gesamtkm; Gesamtkm)
            {
            }

            // column(Comment; CommentRec.Comment)
            // {
            // }

            // column(Commentdate; CommentRec.Date)
            // {
            // }

            dataitem(RentrowRented; RentrowRented)
            {
                DataItemLink = "Headnr" = field(Nr);

                column(Manufactor; Manufactor)
                {
                }

                column(Model; Model)
                {
                }

                column(Driven_Km; "Driven Km")
                {
                }

                column(Price; Price)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if CarTable.get(RentrowRented.Car) then begin
                        Gesamtpreis += Price;
                        Gesamtkm += "Driven Km";
                    end;
                    FullCar := Manufactor + ' ' + Model;
                end;
            }


            dataitem(Commentdata; Comment)
            {
                DataItemLink = "Headnr" = field(Nr);
                column(Comment; Comment)
                {
                }

                column(CommentDate; Date)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CustomerRec.get(Rentedhead.Customer);
                // CommentRec.get(Rentedhead.Nr);
                CompanyBlock := Firmendaten.Name + GetCRLF() +
                                Firmendaten.Address + GetCRLF() +
                                Firmendaten."Post Code" + ' ' + Firmendaten.City;

                CustomerBlock := Customername + GetCRLF() +
                                 CustomerRec.Address + GetCRLF() +
                                 CustomerRec."Post Code" + ' ' + CustomerRec.City;

                CustomerPreInfo := 'Ihre Kundennummer: ' + GetCRLF() +
                                'Belegsdatum:       ' + GetCRLF() +
                                'Rechnungsnummer:   ' + GetCRLF() + GetCRLF() +
                                'Startdatum:        ' + GetCRLF() +
                                'Enddatum:          ';

                CustomerInfo := Customer + GetCRLF() +
                                Format("Booking Date") + GetCRLF() +
                                Format(Nr) + GetCRLF() + GetCRLF() +
                                Format(Startdate) + GetCRLF() +
                                Format(Enddate);
            end;

            trigger OnPreDataItem()
            begin
                Firmendaten.get();
            end;
        }
    }


    var
        Demo: Label 'Bameninghong';
        Gesamtpreis: Decimal;
        Gesamtkm: Decimal;
        Heute: Date;
        Firmendaten: Record "Company Information";
        CustomerRec: Record Customer;
        CarTable: Record Car;
        CompanyBlock: Text[200];
        CustomerBlock: Text[200];
        CustomerPreInfo: Text[200];
        CustomerInfo: Text[200];
        FullCar: Text[200];
        CommentRec: Record Comment;

    local procedure GetCRLF(): Text
    var
        CRLF: Text[2];
    begin
        if CRLF[1] <> 13 then begin
            CRLF[1] := 13;
            CRLF[2] := 10;
        end;
        exit(CRLF);
    end;
}



