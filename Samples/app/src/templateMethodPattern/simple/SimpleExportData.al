codeunit 50100 SimpleExportData
{
    procedure Export(exporter: Interface ISimpleExporter)
    begin
        if not exporter.CheckData() then
            exit;
        if not exporter.GetLines() then
            exit;
        repeat
            if exporter.CheckLineToExport() then begin
                exporter.ProcessLine();
            end;
        until exporter.MoveNext() = 0;
        exporter.ExportData();
    end;
}