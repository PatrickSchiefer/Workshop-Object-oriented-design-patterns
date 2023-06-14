codeunit 50107 ExportEDIOrderConfCommand implements ICommand
{
    procedure SetSalesOrder(pDocumentNo: Code[20])
    begin
        DocumentNo := pDocumentNo;
    end;

    procedure Execute();
    begin
        Message('TODO Implement');
    end;

    var
        DocumentNo: Code[20];
}

