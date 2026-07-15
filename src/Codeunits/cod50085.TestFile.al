codeunit 50085 "Business Permit Mgmt Tests"
{
    Subtype = Test;

    var
        PermitMgt: Codeunit "Business Permit management";

    [Test]
    procedure TestApproveApplicationFromPendingSucceeds()
    var
        Permit: Record "Business Permit Application";
    begin
        // [GIVEN] a pending application
        Permit.Init();
        Permit."Application No" := 'TEST-APR-001';
        Permit.Status := Permit.Status::Pending;
        Permit.Insert(true);

        // [WHEN] approving it
        PermitMgt.ApproveApplication(Permit);

        // [THEN] status should be Approved
        if Permit.Status <> Permit.Status::Approved then
            Error('Status should be Approved after approval, but was %1.', Permit.Status);
    end;

    [Test]
    procedure TestApproveApplicationFromNonPendingFails()
    var
        Permit: Record "Business Permit Application";
        ErrorOccurred: Boolean;
    begin
        // [GIVEN] an application that's already approved
        Permit.Init();
        Permit."Application No" := 'TEST-APR-002';
        Permit.Status := Permit.Status::Approved;
        Permit.Insert(true);

        // [WHEN] trying to approve it again
        ErrorOccurred := false;
        if not TryApprove(Permit) then
            ErrorOccurred := true;

        // [THEN] it should have errored
        if not ErrorOccurred then
            Error('Expected an error when approving a non-pending application, but none occurred.');
    end;

    [Test]
    procedure TestRejectApplicationFromPendingSucceeds()
    var
        Permit: Record "Business Permit Application";
    begin
        // [GIVEN] a pending application
        Permit.Init();
        Permit."Application No" := 'TEST-REJ-001';
        Permit.Status := Permit.Status::Pending;
        Permit.Insert(true);

        // [WHEN] rejecting it
        PermitMgt.RejectApplication(Permit);

        // [THEN] status should be Rejected
        if Permit.Status <> Permit.Status::Rejected then
            Error('Status should be Rejected after rejection, but was %1.', Permit.Status);
    end;

    [Test]
    procedure TestRejectApplicationFromNonPendingFails()
    var
        Permit: Record "Business Permit Application";
        ErrorOccurred: Boolean;
    begin
        // [GIVEN] an application that's already rejected
        Permit.Init();
        Permit."Application No" := 'TEST-REJ-002';
        Permit.Status := Permit.Status::Rejected;
        Permit.Insert(true);

        // [WHEN] trying to reject it again
        ErrorOccurred := false;
        if not TryReject(Permit) then
            ErrorOccurred := true;

        // [THEN] it should have errored
        if not ErrorOccurred then
            Error('Expected an error when rejecting a non-pending application, but none occurred.');
    end;

    [TryFunction]
    local procedure TryApprove(var Permit: Record "Business Permit Application")
    begin
        PermitMgt.ApproveApplication(Permit);
    end;

    [TryFunction]
    local procedure TryReject(var Permit: Record "Business Permit Application")
    begin
        PermitMgt.RejectApplication(Permit);
    end;
}