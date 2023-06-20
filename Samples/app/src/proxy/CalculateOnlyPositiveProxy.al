codeunit 50117 CalculateOnlyPositiveProxy implements ICalculate
{
    procedure Add(a: Integer; b: Integer): Integer;
    var
        calc: Codeunit Calculate;
    begin
        if (a < 0) or (b < 0) then
            Error('Only positive values allowed');
        calc.Add(a, b);
    end;
}