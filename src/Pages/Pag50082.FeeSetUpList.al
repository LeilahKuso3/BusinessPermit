page 50080 "Permit Fee Setup"
{
    PageType = List;
    SourceTable = "Permit Fee Setup";
    Caption = 'Permit Fee Setup';
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Permit/License Type"; Rec."Permit/License Type")
                {
                    ApplicationArea = All;
                }


                field("Permit Fee"; Rec."Permit Fee")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}