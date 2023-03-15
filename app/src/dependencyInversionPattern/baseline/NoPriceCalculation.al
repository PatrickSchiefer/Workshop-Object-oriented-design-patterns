codeunit 50115 NoPriceCalculation implements IPriceCalculator
{
    procedure GetPrice(Item: Code[20]; Quantity: Integer): Decimal;
    begin
        ERROR('No Price Calculation implemented');
    end;

    procedure PriceCalculationEnabled(): Boolean;
    begin
        exit(false);
    end;
}