page 50070 "Permit Application Card"
{
    ApplicationArea = All;
    Caption = 'Permit Application Card';
    PageType = Card;
    SourceTable = "Business Permit Application";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(ApplicantInformation)
            {
                Caption = 'Applicant Information';

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
                field("ID/Passport "; Rec."ID/Passport ")
                {
                    ToolTip = 'Specifies the value of the ID/Passport field.', Comment = '%';
                }
                field("KRA Pin "; Rec."KRA Pin ")
                {
                    ToolTip = 'Specifies the value of the KRA Pin field.', Comment = '%';
                }
                group(ContactInformation)
                {
                    field("Application Date"; Rec."Application Date")
                    {
                        ToolTip = 'Specifies the value of the Application Date field.', Comment = '%';
                    }
                    field("Phone No"; Rec."Phone No")
                    {
                        ToolTip = 'Specifies the value of the Phone No field.', Comment = '%';
                    }
                    field("Email Address"; Rec."Email Address")
                    {
                        ToolTip = 'Specifies the value of the Email Address field.', Comment = '%';
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
    }
    actions
    {
        area(Promoted)
        {
            group(Applications)
            {
                actionref(ApplicationCardref; ApplicationList) { }
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

            action(BusinessInfoCard)
            {
                Caption = 'Business Info Card';
                RunObject = Page "Business Info Card";
                Image = Card;

            }
        }
    }
}