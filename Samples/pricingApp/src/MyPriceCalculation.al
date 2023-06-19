codeunit 50200 MyPriceCalculation implements IPriceCalculator
{
    procedure GetPrice(Item: Code[20]; Quantity: Integer): Decimal;
    begin
        Message('Price Calculated');
        exit(0);
    end;

    procedure PriceCalculationEnabled(): Boolean;
    begin
        exit(true);
    end;
}
