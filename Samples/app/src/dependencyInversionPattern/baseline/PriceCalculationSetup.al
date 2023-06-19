table 50100 PriceCalculationSetup
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Code[1])
        {
            DataClassification = ToBeClassified;
        }
        field(2; PriceCalculator; Enum PriceCalculatorEnum)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; PK)
        {
            Clustered = true;
        }
    }

    procedure InitSetup()
    begin
        if not rec.Get() then
            rec.Insert();
    end;

}