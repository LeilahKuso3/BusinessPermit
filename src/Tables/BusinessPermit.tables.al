table 50100 "Business Permit"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Permit No."; Code[20])
        {
        }

        field(2; "Business Name"; Text[100])
        {
        }

        field(3; "Owner Name"; Text[100])
        {
        }

        field(4; Phone; Text[20])
        {
        }

        field(5; Email; Text[100])
        {
        }

        field(6; Category; Text[50])
        {
        }

        field(7; Location; Text[100])
        {
        }

        field(8; Status; Enum "Permit Status")
        {
        }
    }

    keys
    {
        key(PK; "Permit No.")
        {
            Clustered = true;
        }
    }
}