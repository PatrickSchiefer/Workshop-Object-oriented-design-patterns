codeunit 50500 ExportSalesLines
{

    procedure ExportSalesLines(var rec: Record "Sales Line");
    begin
        salesLines.CopyFilters(rec);
        salesLines.FindSet();
        processLines();
    end;

    procedure SetGenerateExportLineAdapter(adapter: Interface IExportSalesLineAdapter)
    begin
        exportSalesLineAdapter := adapter;
        exportSalesLineAdapterUsed := true;
    end;

    local procedure processLines()
    var
        cr: char;
        lf: char;
    begin
        cr := 13;
        lf := 10;
        exportData := '';
        salesLines.FindSet();
        repeat
            exportData += generateExportLine(salesLines) + cr + lf;
        until salesLines.Next() = 0;
    end;

    local procedure generateExportLine(var salesLine: Record "Sales Line"): Text
    begin
        if exportSalesLineAdapterUsed then
            exit(exportSalesLineAdapter.GenerateExportLine(salesLine))
        else
            Exit(StrSubstNo('%1;%2;%3', salesLine."No.", salesLine."Variant Code", salesLine."Quantity"));
    end;

    local procedure export()
    begin
        Message(exportData);
    end;


    var
        exportData: Text;
        exportSalesLineAdapter: Interface IExportSalesLineAdapter;
        exportSalesLineAdapterUsed: Boolean;

        salesLines: Record "Sales Line";
}