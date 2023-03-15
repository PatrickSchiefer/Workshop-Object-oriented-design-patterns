codeunit 50116 OnInstallBaseLine
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        priceSetup: Record PriceCalculationSetup;
    begin
        priceSetup.InitSetup();
    end;
}