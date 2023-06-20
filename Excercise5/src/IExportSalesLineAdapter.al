interface IExportSalesLineAdapter
{
    procedure generateExportLine(var salesLine: Record "Sales Line"): Text

}