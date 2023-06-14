codeunit 50117 SalesOrderSimpleExporter implements ISimpleExporter
{
    procedure CheckData(): Boolean;
    var
        salesSetup: Record "Sales & Receivables Setup";
    begin
        exit(salesSetup.Get());
    end;

    procedure CheckLineToExport(): Boolean;
    begin
        Exit(salesOrder.Status = salesOrder.Status::Released);
    end;

    procedure GetLines(): Boolean;
    begin
        salesOrder.SetRange("Document Type", salesOrder."Document Type"::Order);
        salesOrder.FindSet(false);
        exit(salesOrder.Count > 0);
    end;

    procedure ProcessLine();
    begin
        exportDataText := exportDataText + salesOrder."No." + ';'
    end;

    procedure MoveNext(): Integer;
    begin
        exit(salesOrder.Next());
    end;

    procedure ExportData();
    begin
        Message(exportDataText);
    end;


    var
        salesOrder: Record "Sales Header";
        exportDataText: Text;
}