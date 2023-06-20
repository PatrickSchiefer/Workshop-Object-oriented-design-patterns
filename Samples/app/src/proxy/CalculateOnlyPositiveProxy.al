codeunit 50117 CalculateOnlyPositiveProxy
{
    procedure Calculate(a: Integer; b: Integer): Integer;
    begin
        if (a < 0) or (b < 0) then
            Error('Only positive values allowed');
        exit(a + b);
    end;
}