page 50071 "Permit application List"
{
    ApplicationArea = All;
    Caption = 'Permit application List';
    PageType = list;
    SourceTable = "Business Permit Application";
    UsageCategory = Lists;
    SourceTableView = sorting("Application no") order(Descending);

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Application no"; Rec."Application no")
                {
                    ToolTip = 'Specifies the value of the Application no field.', Comment = '%';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field(Surname; Rec.Surname)
                {
                    ToolTip = 'Specifies the value of the Surname field.', Comment = '%';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }

                field("Email Address"; Rec."Email Address")
                {
                    ToolTip = 'Specifies the value of the Email Address field.', Comment = '%';
                }

                field("ID/Passport "; Rec."ID/Passport ")
                {
                    ToolTip = 'Specifies the value of the ID/Passport field.', Comment = '%';
                }
                field("KRA Pin "; Rec."KRA Pin ")
                {
                    ToolTip = 'Specifies the value of the KRA Pin field.', Comment = '%';
                }

                field("Phone No"; Rec."Phone No")
                {
                    ToolTip = 'Specifies the value of the Phone No field.', Comment = '%';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ToolTip = 'Specifies the value of the Application Date field.', Comment = '%';
                }
                field("Permit Fee"; Rec."Permit Fee")
                {
                    ToolTip = 'Specifies the value of the Permit Fee field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current application status.';
                }


            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Approve)
            {
                Caption = 'Approve';
                Image = Approve;
                ApplicationArea = All;
                // Promoted = true;
                // PromotedCategory = Process;

                trigger OnAction()
                var
                    EmailMgt: Codeunit "Email Notification Management";
                begin
                    EmailMgt.ApproveApplication(Rec);

                    Message('Application %1 has been approved.', Rec."Application no");
                end;
            }
            action(Reject)
            {
                Caption = 'Reject';
                Image = Reject;
                ApplicationArea = All;
                // Promoted = true;
                // PromotedCategory = Process;

                trigger OnAction()
                var
                    EmailMgt: Codeunit "Email Notification Management";
                begin
                    EmailMgt.RejectApplication(Rec);

                    Message('Application %1 has been rejected.', Rec."Application no");
                end;
            }
        }
        area(Promoted)
        {
            actionref(Approval; Approve) { }
            actionref(Rejection; Reject) { }

            group(Applications)
            {
                actionref(ApplicationCardref; ApplicationCard) { }
            }
            group("Business Information")
            {
                actionref(BusinessInfoListref; BusinessInfoList) { }
                actionref(BusinessInfoCardref; BusinessInfoCard) { }
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
            }

            action(BusinessInfoList)
            {
                Caption = 'Business Info List';
                RunObject = Page "Business Info List";
                Image = List;

            }

            action(BusinessInfoCard)
            {
                Caption = 'Business Info Card';
                RunObject = Page "Business Info Card";
                Image = Card;

            }
        }
    }
}
