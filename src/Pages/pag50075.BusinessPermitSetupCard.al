page 50075 "Permit Setup Card"
{
    Caption = 'Business Permit Setup';
    PageType = Card;
    SourceTable = "Business Permit Setup";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Application Nos."; Rec."Application Nos.")
                {
                    ApplicationArea = All;
                }
                field("Permit Nos."; Rec."Permit Nos.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get('SETUP') then begin
            Rec.Init();
            Rec."Primary Key" := 'SETUP';
            Rec.Insert();
        end;
    end;
}