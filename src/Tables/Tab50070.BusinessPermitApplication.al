table 50070 "Business Permit Application"
{
    Caption = 'Business Permit Application';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Application no"; code[20])
        {
            Caption = 'Application No';

        }
        field(2; "First Name"; Text[20])
        {
            Caption = 'First Name';
        }
        field(3; Surname; Text[20])
        {
            Caption = 'Surname';
        }
        field(4; "Last Name"; Text[20])
        {
            Caption = 'Last Name';
        }
        field(5; "ID/Passport "; Integer)
        {
            Caption = 'ID/Passport ';
        }
        field(6; "KRA Pin "; Code[30])
        {
            Caption = 'KRA Pin ';
        }
        field(7; "Phone No"; Code[20])
        {
            Caption = 'Phone No';
        }
        field(8; "Email Address"; Code[100])
        {
            Caption = 'Email Address';
        }
        field(9; "Application Date"; Date)
        {
            Caption = 'Application Date';
        }
        field(10; "Permit Fee"; Decimal)
        {
            Caption = 'Permit Fee';
            Editable = false;
        }
        field(11; "Status"; Enum "Application Status")
        {
            Caption = 'Status';
        }

    }
    keys
    {
        key(PK; "Application no")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        PermitMgt: Codeunit "Business Permit Management";
    begin
        if "Application No" = '' then
            PermitMgt.GenerateApplicationNo(Rec);

        Status := Status::Open;
    end;

}
