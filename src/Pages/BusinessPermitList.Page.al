page 50101 "Business Permit List"
{
    PageType = List;
    SourceTable = "Business Permit";
    CardPageId = "Business Permit Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Permit No."; Rec."Permit No.")
                {
                    ApplicationArea = All;
                }

                field("Business Name"; Rec."Business Name")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}