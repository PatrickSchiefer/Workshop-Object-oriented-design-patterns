codeunit 50201 OnInstallPricingApp
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        priceSetup: Record PriceCalculationSetup;
    begin
        priceSetup.Get();
        priceSetup.PriceCalculator := Enum::PriceCalculatorEnum::MyPriceCalculator;
        priceSetup.Modify();
    end;
}