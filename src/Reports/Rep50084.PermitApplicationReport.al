report 50084 "Business Permit Report"
{
    Caption = 'Business Permit Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    DefaultLayout = Excel;
    ExcelLayout = 'BusinessPermitReport.xlsx';

    dataset
    {
        dataitem(PermitApplication; "Business Permit Application")
        {
            RequestFilterFields = "Application no", Status;

            column(ApplicationNo; "Application no")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(Surname; "Surname")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(IDPassport; "ID/Passport ")
            {
            }
            column(PhoneNo; "Phone No")
            {
            }
            column(Email; "Email Address")
            {
            }
            column(ApplicationDate; "Application Date")
            {
            }
            column(Status; Status)
            {
            }
            column(PermitFee; "Permit Fee")
            {
            }

            dataitem(BusinessInfo; "Business Information Table")
            {
                DataItemLinkReference = PermitApplication;
                DataItemLink = "Application No" = FIELD("Application no");

                column(BusinessName; "Name Of Business")
                {
                }
                column(BusinessType; "Business Type")
                {
                }
                column(PermitType; "Permit/License Type")
                {
                }
                column(Location; "Location/address")
                {
                }
                column(BusinessSize; "Size Of Business")
                {
                }
                column(Employees; "No. of Employees")
                {
                }
            }
        }
    }




}
