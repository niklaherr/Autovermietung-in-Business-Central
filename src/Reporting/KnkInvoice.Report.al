report 60050 Invoice
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/Reporting/KnkCarRentalInvoice.rdlc';
    Caption = 'Invoice';
    UsageCategory = Documents;
    ApplicationArea = All;


    dataset
    {
        dataitem(Rentedhead; "KnkPosted Rental Header")
        {
            RequestFilterFields = Nr;

            column(Nr; Nr)
            {
            }

            column(Customer; Customer)
            {
            }

            column(CustomerName; CustomerName)
            {
            }

            column(Booking_Date; "Booking Date")
            {
            }

            column(Demo; Demo)
            {
            }

            column(CompanyName; CompanyInfoRec.Name)
            {
            }

            column(CompanyAddress; CompanyInfoRec.Address)
            {
            }

            column(CompanyCity; CompanyInfoRec.City)
            {
            }

            column(CompanyPost_Code; CompanyInfoRec."Post Code")
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

            column(Color; CarTable.Color)
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

            column(TotalPrice; TotalPrice)
            {
            }

            column(TotalKm; TotalKm)
            {
            }

            // column(Comment; CommentRec.Comment)
            // {
            // }

            // column(Commentdate; CommentRec.Date)
            // {
            // }

            dataitem(RentrowRented; "KnkPosted Rental Line")
            {
                DataItemLink = "HeaderNo" = field(Nr);

                column(Manufacturer; Manufacturer)
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
                    if CarTable.Get(RentrowRented.Car) then begin
                        TotalPrice += Price;
                        TotalKm += "Driven Km";
                    end;
                    FullCar := Manufacturer + ' ' + Model;
                end;
            }


            dataitem(Commentdata; "KnkComment")
            {
                DataItemLink = "HeaderNo" = field(Nr);
                column(Comment; Comment)
                {
                }

                column(CommentDate; Date)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CustomerRec.Get(Rentedhead.Customer);
                CompanyBlock := CompanyInfoRec.Name + GetCRLF() +
                                CompanyInfoRec.Address + GetCRLF() +
                                CompanyInfoRec."Post Code" + ' ' + CompanyInfoRec.City;

                CustomerBlock := CustomerName + GetCRLF() +
                                 CustomerRec.Address + GetCRLF() +
                                 CustomerRec."Post Code" + ' ' + CustomerRec.City;

                CustomerPreInfo := 'Customer No.:      ' + GetCRLF() +
                                   'Booking Date:      ' + GetCRLF() +
                                   'Invoice No.:      ' + GetCRLF() + GetCRLF() +
                                   'Start Date:       ' + GetCRLF() +
                                   'End Date:         ';

                CustomerInfo := Customer + GetCRLF() +
                                Format("Booking Date") + GetCRLF() +
                                Format(Nr) + GetCRLF() + GetCRLF()
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfoRec.Get();
            end;
        }
    }


    var
        Demo: Label 'Bameninghong';
        TotalPrice: Decimal;
        TotalKm: Decimal;
        CompanyInfoRec: Record "Company Information";
        CustomerRec: Record Customer;
        CarTable: Record "KnkCar";
        CompanyBlock: Text[200];
        CustomerBlock: Text[200];
        CustomerPreInfo: Text[200];
        CustomerInfo: Text[200];
        FullCar: Text[200];
        CommentRec: Record "KnkComment";

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



