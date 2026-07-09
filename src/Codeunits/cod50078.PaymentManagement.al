codeunit 50078 "Payment Management"
{
    procedure CalculatePermitFee(PermitType: Enum "Permit/License Type"): Decimal
    var
        FeeSetup: Record "Permit Fee Setup";
    begin
        if not FeeSetup.Get(PermitType) then
            Error('No fee has been configured for permit type %1.', PermitType);

        exit(FeeSetup."Permit Fee");
    end;

    procedure UpdatePermitApplicationFee(var BusinessInfo: Record "Business Information Table")
    var
        PermitApplication: Record "Business Permit Application";
    begin
        if PermitApplication.Get(BusinessInfo."Application No") then begin
            PermitApplication."Permit Fee" := BusinessInfo."Permit Fee";
            PermitApplication.Modify(true);
        end;
    end;
}