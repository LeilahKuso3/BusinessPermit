table 50072 "Business Information Table"
{
    Caption = 'Business Information Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Application No"; code[20])
        {
            Caption = 'Application No';
            TableRelation = "Business Permit Application"."Application no";
        }
        field(2; "Name Of Business"; Code[100])
        {
            Caption = 'Name Of Business';
        }
        field(3; "Business Type"; Enum "Business Type")
        {
            Caption = 'Business Type';
        }
        field(4; "Location/address"; Code[100])
        {
            Caption = 'Location/address';
        }
        field(5; "Size Of Business"; Enum "Business Size")
        {
            Caption = 'Size Of Business';
        }
        field(6; "No. of Employees"; Integer)
        {
            Caption = 'No. of Employees';
        }
        field(7; "Permit/License Type"; enum "Permit/License Type")
        {
            Caption = 'Permit/License Type';
            trigger OnValidate()
            var
                PaymentMgt: Codeunit "Payment Management";
            begin
                "Permit Fee" :=
                    PaymentMgt.CalculatePermitFee("Permit/License Type");

                PaymentMgt.UpdatePermitApplicationFee(Rec);
            end;
        }
        field(30; "Permit Fee"; Decimal)
        {
            Caption = 'Permit Fee';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Application No")
        {
            Clustered = true;
        }
    }
}
