
/*page 50084 "Business Permit Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Business Permit Dashboard';
    UsageCategory = Administration;

    layout
    {
        area(RoleCenter)
        {
            part(Activities; "Permit application List")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(Applications)
            {
                Caption = 'Applications';

                action(ApplicationList)
                {
                    Caption = 'Application List';
                    RunObject = page "Permit application List";
                }

                action(ApplicationCard)
                {
                    Caption = 'Application Card';
                    RunObject = page "Permit Application Card";
                }
            }

            group("Business Information")
            {
                Caption = 'Business Information';

                action(BusinessInfoList)
                {
                    Caption = 'Business Information List';
                    RunObject = page "Business Info List";
                }

                action(BusinessInfoCard)
                {
                    Caption = 'Business Information Card';
                    RunObject = page "Business Info Card";
                }
            }

            group(Reports)
            {
                Caption = 'Reports';

                action(PermitReport)
                {
                    Caption = 'Permit Report';
                    RunObject = report "Business Permit Report";
                }
            }

            group(Setup)
            {
                Caption = 'Setup';

                action(PermitSetup)
                {
                    Caption = 'Permit Setup';
                    RunObject = page "Permit Setup Card";
                }
            }
        }
    }
}*/