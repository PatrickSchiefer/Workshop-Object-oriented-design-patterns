codeunit 50303 SalaryAppHandler implements ISalary
{
    procedure SendSalary(IBAN: Text[50]; amount: Decimal);
    begin
        Message(StrSubstNo('%1-%2', IBAN, amount));
    end;

    procedure SalaryEnabled(): Boolean;
    begin
        exit(true);
    end;
}