codeunit 50114 PurchaseLineEvents
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'No.', true, false)]
    local procedure OnAfterModifyNo(rec: Record "Purchase Line")
    begin
        calculatePrice(rec);
    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Quantity', true, false)]
    local procedure OnAfterModifyQuantity(rec: Record "Purchase Line")
    begin
        calculatePrice(rec);
    end;


    local procedure calculatePrice(rec: record "Purchase Line")
    var
        priceSetup: Record PriceCalculationSetup;
        priceCalculator: Interface IPriceCalculator;
    begin
        priceSetup.Get();
        priceCalculator := priceSetup.PriceCalculator;
        if priceCalculator.PriceCalculationEnabled() then
            priceCalculator.GetPrice(rec."No.", rec.Quantity);
    end;
}