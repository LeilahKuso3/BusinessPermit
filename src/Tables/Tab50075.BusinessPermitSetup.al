table 50075 "Business Permit Setup"
{
    Caption = 'Business Permit Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = toBeClassified;
        }

        field(2; "Application Nos."; Code[20])
        {
            Caption = 'Application Nos.';
            TableRelation = "No. Series";
            DataClassification = toBeClassified;
        }
        field(3; "Permit Nos."; Code[20])
        {
            Caption = 'Permit Nos.';
            TableRelation = "No. Series";
            DataClassification = toBeClassified;
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}