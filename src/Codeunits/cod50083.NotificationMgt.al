codeunit 50083 "Email Notification Management"
{

    procedure SendApplicationReceivedEmail(Permit: Record "Business Permit Application")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create(
            Permit."Email Address",
            'Business Permit Application Received',
            StrSubstNo(
                'Dear %1,<br><br>Your business permit application <b>%2</b> has been received successfully.<br><br>Status: Pending.<br><br>Thank you.',
                Permit."First Name",
                Permit."Application No"),
            true);

        Email.Send(EmailMessage);
    end;

    procedure SubmitApplication(var Permit: Record "Business Permit Application")
    var
        EmailMgt: Codeunit "Email Notification Management";
    begin
        Permit.Status := Permit.Status::Pending;
        Permit.Modify(true);

        EmailMgt.SendApplicationReceivedEmail(Permit);
    end;

    procedure ApproveApplication(var Permit: Record "Business Permit Application")
    begin
        Permit.Status := Permit.Status::Approved;
        Permit.Modify(true);

        SendApprovalEmail(Permit);
    end;

    procedure SendApprovalEmail(Permit: Record "Business Permit Application")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create(
            Permit."Email Address",
            'Business Permit Application Approved',
            StrSubstNo(
                'Dear %1,<br><br>Your business permit application <b>%2</b> has been approved.<br><br>Status: Approved.<br><br>Thank you.',
                Permit."First Name",
                Permit."Application No"),
            true);

        Email.Send(EmailMessage);
    end;

    procedure RejectApplication(var Permit: Record "Business Permit Application")
    begin
        Permit.Status := Permit.Status::Approved;
        Permit.Modify(true);

        SendRejectionEmail(Permit);
    end;

    procedure SendRejectionEmail(Permit: Record "Business Permit Application")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create(
            Permit."Email Address",
            'Business Permit Application Rejected',
            StrSubstNo(
                'Dear %1,<br><br>We regret to inform you that your application <b>%2</b> has been rejected.',
                Permit."First Name",
                Permit."Application No"),
            true);

        Email.Send(EmailMessage);
    end;


    var
        myInt: Integer;
}