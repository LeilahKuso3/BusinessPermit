page 50072 "Business Info Card"
{
    ApplicationArea = All;
    Caption = 'Business Info Card';
    PageType = Card;
    SourceTable = "Business Information Table";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Application No"; Rec."Application No")
                {
                    ToolTip = 'Specifies the value of the Application No field.', Comment = '%';
                }
                field("Location/address"; Rec."Location/address")
                {
                    ToolTip = 'Specifies the value of the Location/address field.', Comment = '%';
                }
                field("Name Of Business"; Rec."Name Of Business")
                {
                    ToolTip = 'Specifies the value of the Name Of Business field.', Comment = '%';
                }
                field("No. of Employees"; Rec."No. of Employees")
                {
                    ToolTip = 'Specifies the value of the No. of Employees field.', Comment = '%';
                }
                field("Permit/License Type"; Rec."Permit/License Type")
                {
                    ToolTip = 'Specifies the value of the Permit/License Type field.', Comment = '%';
                }
                field("Size Of Business"; Rec."Size Of Business")
                {
                    ToolTip = 'Specifies the value of the Size Of Business field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SubmitApplication)
            {
                Caption = 'Submit';
                Image = SendApprovalRequest;
                ApplicationArea = All;
                //omoted = true;
                //omotedCategory = Process;

                trigger OnAction()
                var
                    PermitApplication: Record "Business Permit Application";
                    EmailMgt: Codeunit "Email Notification Management";
                begin
                    if PermitApplication.Get(Rec."Application No") then begin
                        EmailMgt.SubmitApplication(PermitApplication);

                        Message('Application submitted successfully.');
                    end;
                end;
            }
        }
        area(Promoted)
        {
            actionref(Submission; SubmitApplication) { }
            group(Applications)
            {
                actionref(ApplicationCardref; ApplicationCard) { }
                actionref(ApplicationListref; ApplicationList) { }
            }
            group("Business Information")
            {
                actionref(BusinessInfoListref; BusinessInfoList) { }
            }
        }
        area(navigation)
        {
            group(Application)
            {
                Caption = 'Application';
                image = Apply;

                action(ApplicationCard)
                {
                    Caption = 'Application Card';
                    RunObject = Page "Permit Application Card";
                    Image = Card;

                }
                action(ApplicationList)
                {
                    Caption = 'Application List';
                    RunObject = Page "Permit Application List";
                    Image = List;

                }
            }
            action(BusinessInfoList)
            {
                Caption = 'Business Info List';
                RunObject = Page "Business Info List";
                Image = List;

            }

        }

    }
}
