codeunit 50304 OnInstallSalary
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        salarySetup: Record SalarySetup;
    begin
        salarySetup.Get();
        salarySetup.SalaryHandler := Enum::SalaryHandlerEnum::SalaryApp;
        salarySetup.Modify();
    end;
}