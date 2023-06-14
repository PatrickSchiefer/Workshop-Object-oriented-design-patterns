table 50301 SalarySetup
{

    fields
    {
        field(1; PK; code[1])
        {
            DataClassification = ToBeClassified;

        }
        field(2; SalaryHandler; Enum SalaryHandlerEnum)
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