codeunit 50501 ExportSalesLineAdapter implements IExportSalesLineAdapter
{
    procedure generateExportLine(var salesLine: Record "Sales Line"): Text;
    begin
        Exit(StrSubstNo('%1;%3', salesLine."No.", salesLine."Quantity"));
    end;
}