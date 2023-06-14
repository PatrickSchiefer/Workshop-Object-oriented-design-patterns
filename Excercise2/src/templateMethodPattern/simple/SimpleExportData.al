codeunit 50100 SimpleExportData
{
    procedure Export(exporter: Interface ISimpleExporter; afterProcessCommand: Interface ICommandRecord)
    var
        currentLine: Variant;
    begin
        if not exporter.CheckData() then
            exit;
        if not exporter.GetLines() then
            exit;
        repeat
            if exporter.CheckLineToExport() then begin
                exporter.ProcessLine();
                exporter.GetCurrentLine(currentLine);
                afterProcessCommand.Execute(currentLine);
            end;
        until exporter.MoveNext() = 0;
        exporter.ExportData();
    end;
}