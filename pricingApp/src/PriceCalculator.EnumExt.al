enumextension 50200 PriceCalculatorEnumExt extends PriceCalculatorEnum
{
    value(1; MyPriceCalculator)
    {
        Implementation = IPriceCalculator = MyPriceCalculation;
    }
}