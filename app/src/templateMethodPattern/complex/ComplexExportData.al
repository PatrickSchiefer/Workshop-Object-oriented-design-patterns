codeunit 50101 ComplexExportData
{
    procedure Export(dataGetter: Interface IComplexExporterGetLines;
                     dataChecker: Interface IComplexExporterDataCheck;
                     dataProcessor: Interface IComplexExporterProcessData;
                     exporter: Interface IComplexExporter)
    var
        rec: Variant;
    begin
        if not dataGetter.GetLines(rec) then
            exit;
        repeat
            if dataChecker.CheckLineToExport(rec) then begin
                dataProcessor.ProcessLine(rec);
            end;
        until dataGetter.MoveNext() = 0;
        exporter.ExportData(dataProcessor);
    end;
}