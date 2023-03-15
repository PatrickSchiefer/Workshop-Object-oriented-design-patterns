codeunit 50102 SalesLineComplexGetter implements IComplexExporterGetLines
{
    procedure SetDocumentFilter(DocumentNo: Code[20])
    begin
        salesLine.SetRange("Document No.", DocumentNo);
    end;

    procedure GetLines(var rec: Variant): Boolean;
    begin
        salesLine.FindSet(false);
        rec := salesLine;
        exit(salesLine.Count > 0);
    end;

    procedure MoveNext(): Integer;
    begin
        exit(salesLine.Next());
    end;

    var
        salesLine: Record "Sales Line";


}