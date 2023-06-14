codeunit 50300 NoSalary implements ISalary
{

    procedure SendSalary(IBAN: Text[50]; amount: Decimal);
    begin
        Error('No salary implemented');
    end;

    procedure SalaryEnabled(): Boolean;
    begin
        exit(false);
    end;
}