codeunit 50301 OnInstallSalaryBaseLine
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        salarySetup: Record SalarySetup;
    begin
        salarySetup.InitSetup();
    end;
}