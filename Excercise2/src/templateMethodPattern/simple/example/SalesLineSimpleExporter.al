codeunit 50109 SalesLineSimpleExporter implements ISimpleExporter
{

    procedure SetDocumentFilter(DocumentNo: Code[20])
    begin
        salesLine.SetRange("Document No.", DocumentNo);
    end;

    procedure CheckData(): Boolean;
    begin
        exit(true);
    end;

    procedure CheckLineToExport(): Boolean;
    begin
        Exit(salesLine.Quantity > 0)
    end;

    procedure GetLines(): Boolean;
    begin
        salesLine.FindSet(false);
        exit(salesLine.Count > 0);
    end;

    procedure ProcessLine();
    var
        cr: Char;
        lf: Char;
    begin
        cr := 13;
        lf := 10;
        exportDataText := exportDataText + StrSubstNo('%1;%2', salesLine."No.", salesLine.Quantity) + Format(cr) + Format(lf);
    end;

    procedure MoveNext(): Integer;
    begin
        exit(salesLine.Next());
    end;

    procedure ExportData();
    begin
        Message(exportDataText);
    end;

    procedure GetCurrentLine(var rec: Variant);
    begin
        rec := salesLine;
    end;


    var
        salesLine: Record "Sales Line";
        exportDataText: Text;
}