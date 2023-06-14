interface ISalary
{
    procedure SendSalary(IBAN: text[50]; amount: Decimal);
    procedure SalaryEnabled(): Boolean;
}