table 50082 "Permit Fee Setup"
{
    Caption = 'Permit Fee Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Permit/License Type"; Enum "Permit/License Type")
        {
            Caption = 'Permit/License Type';
        }

        field(2; "Permit Fee"; Decimal)
        {
            Caption = 'Permit Fee';
            DecimalPlaces = 2 : 2;
        }
    }

    keys
    {
        key(PK; "Permit/License Type")
        {
            Clustered = true;
        }
    }
}