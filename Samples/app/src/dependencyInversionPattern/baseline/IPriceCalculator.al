interface IPriceCalculator
{
    procedure GetPrice(Item: Code[20]; Quantity: Integer): Decimal;
    procedure PriceCalculationEnabled(): Boolean;
}