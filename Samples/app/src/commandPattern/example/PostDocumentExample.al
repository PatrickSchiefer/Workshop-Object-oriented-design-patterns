codeunit 50108 PostDocumentExample
{
    procedure Post(rec: Record "Sales Header";
                   afterCheckCommand: Interface ICommand)
    begin
        Check(rec);
        afterCheckCommand.Execute();
        doPost(rec);
    end;

    local procedure Check(rec: Record "Sales Header")
    begin
        // Todo Implement Check
    end;

    local procedure doPost(rec: Record "Sales Header")
    begin

    end;
}