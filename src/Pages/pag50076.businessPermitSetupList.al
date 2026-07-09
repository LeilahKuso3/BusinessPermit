page 50081 " Permit Setup List"
{
    Caption = 'Business Permit Setup';
    PageType = List;
    SourceTable = "Business Permit Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    CardPageId = " Permit Setup List";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                }

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