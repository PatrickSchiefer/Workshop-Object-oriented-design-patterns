codeunit 50104 SalesLineComplexProcessData implements IComplexExporterProcessData
{
    procedure ProcessLine(var rec: Variant);
    var
        salesLine: Record "Sales Line";
        cr: Char;
        lf: Char;
    begin
        cr := 13;
        lf := 10;
        salesLine := rec;
        exportData := exportData + StrSubstNo('%1;%2', salesLine."No.", salesLine.Quantity) + Format(cr) + Format(lf);
    end;

    procedure GetExportData(): Text;
    begin
        exit(exportData);
    end;

    var
        exportData: Text;
}