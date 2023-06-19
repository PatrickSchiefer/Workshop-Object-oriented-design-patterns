interface IComplexExporterDataCheck
{
    procedure CheckLineToExport(rec: variant): Boolean;

}

interface IComplexExporterGetLines
{
    procedure GetLines(var rec: Variant): Boolean;
    procedure MoveNext(): Integer;
}


interface IComplexExporterProcessData
{
    procedure ProcessLine(var rec: Variant);
    procedure GetExportData(): text;
}

interface IComplexExporter
{
    procedure ExportData(dataProcessor: interface IComplexExporterProcessData);
}