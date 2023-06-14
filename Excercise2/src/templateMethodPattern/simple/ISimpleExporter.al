interface ISimpleExporter
{
    procedure CheckData(): Boolean;
    procedure CheckLineToExport(): Boolean;
    procedure GetLines(): Boolean;
    procedure GetCurrentLine(var rec: Variant);
    procedure ProcessLine();
    procedure MoveNext(): Integer;
    procedure ExportData();
}


