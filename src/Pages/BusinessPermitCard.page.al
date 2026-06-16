page 50100 "Business Permit Card"
{
    PageType = Card;
    SourceTable = "Business Permit";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Permit No."; Rec."Permit No.")
                {
                    ApplicationArea = All;
                }

                field("Business Name"; Rec."Business Name")
                {
                    ApplicationArea = All;
                }

                field("Owner Name"; Rec."Owner Name")
                {
                    ApplicationArea = All;
                }

                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                }

                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }

                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                }

                field(Location; Rec.Location)
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