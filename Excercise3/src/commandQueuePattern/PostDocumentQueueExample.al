codeunit 50112 PostDocumentQueueExample
{
    procedure Post(rec: Record "Sales Header";
                   afterCheckCommandQueue: Codeunit CommandQueue)
    begin
        Check(rec);
        afterCheckCommandQueue.ProcessQueue();
        doPost(rec);
    end;

    local procedure Check(rec: Record "Sales Header")
    begin
        // Tode Implement Check
    end;

    local procedure doPost(rec: Record "Sales Header")
    begin

    end;
}