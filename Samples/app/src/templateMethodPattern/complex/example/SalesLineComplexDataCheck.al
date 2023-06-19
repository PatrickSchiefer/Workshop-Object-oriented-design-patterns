codeunit 50103 SalesLineComplexDataCheck implements IComplexExporterDataCheck
{
    procedure CheckLineToExport(rec: Variant): Boolean;
    var
        salesLine: Record "Sales Line";
    begin
        salesLine := rec;
        exit(salesLine.Quantity > 0);
    end;
}