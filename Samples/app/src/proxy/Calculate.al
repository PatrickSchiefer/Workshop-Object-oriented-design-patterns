codeunit 50118 Calculate implements ICalculate
{
    procedure Add(a: Integer; b: Integer): Integer;
    begin
        exit(a + b);
    end;
}