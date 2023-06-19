codeunit 50106 PrintOrderConfirmationCommand implements ICommand
{
    procedure SetSalesOrder(pDocumentNo: Code[20])
    begin
        DocumentNo := pDocumentNo;
    end;

    procedure Execute();
    var
        rec: Record "Sales Header";
        DocPrint: Codeunit "Document-Print";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
    begin
        rec.Get(Enum::"Sales Document Type"::Order, DocumentNo);
        DocPrint.PrintSalesOrder(Rec, Usage::"Order Confirmation");

    end;

    var
        DocumentNo: Code[20];
}