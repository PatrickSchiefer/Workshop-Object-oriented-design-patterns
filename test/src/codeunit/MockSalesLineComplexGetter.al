codeunit 50190 MockSalesLineComplexGetter implements IComplexExporterGetLines
{

    procedure GetLines(var rec: Variant): Boolean;
    begin
        salesLine."No." := 'Test';
        salesLine.Quantity := 2;
        rec := salesLine;
        exit(true);
    end;

    procedure MoveNext(): Integer;
    begin
        exit(0);
    end;

    var
        salesLine: Record "Sales Line";


}