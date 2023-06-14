interface ISimpleExporter
{
    procedure CheckData(): Boolean;
    procedure CheckLineToExport(): Boolean;
    procedure GetLines(): Boolean;
    procedure ProcessLine();
    procedure MoveNext(): Integer;
    procedure ExportData();
}


