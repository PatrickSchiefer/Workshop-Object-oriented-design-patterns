codeunit 50113 PostingCommand implements ICommand
{
    procedure GetHeader(DocumentType: Enum "Sales Document Type"; DocumentNo: Code[20])
    begin
        rec.Get(DocumentType, DocumentNo);
    end;

    procedure Execute();
    var
        salesPost: Codeunit "Sales-Post";
    begin
        salesPost.Run(rec)
    end;

    var
        rec: Record "Sales Header";

}