codeunit 50105 ComplexExportToMessage implements IComplexExporter
{
    procedure ExportData(dataProcessor: Interface IComplexExporterProcessData);
    begin
        Message(dataProcessor.GetExportData());
    end;
}