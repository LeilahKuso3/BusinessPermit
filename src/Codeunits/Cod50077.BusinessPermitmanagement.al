codeunit 50077 "Business Permit management"
{
    procedure GenerateApplicationNo(var Permit: Record "Business Permit Application")
    var
        PermitSetup: Record "Business Permit Setup";
        NoSeries: Codeunit "No. Series";
    begin

        PermitSetup.Get('SETUP');
        PermitSetup.TestField("Application Nos.");
        Permit."Application No" :=
            NoSeries.GetNextNo(PermitSetup."Application Nos.");

    end;

    procedure ApproveApplication(var Permit: Record "Business Permit Application")
    begin
        // Only pending applications can be approved
        if Permit.Status <> Permit.Status::Pending then
            Error('Only pending applications can be approved.');

        Permit.Status := Permit.Status::Approved;
        Permit.Modify(true);
    end;

    procedure RejectApplication(var Permit: Record "Business Permit Application")
    begin
        if Permit.Status <> Permit.Status::Pending then
            Error('Only pending applications can be rejected.');

        Permit.Status := Permit.Status::Rejected;
        Permit.Modify(true);
    end;

    trigger OnRun()
    begin

    end;

}
