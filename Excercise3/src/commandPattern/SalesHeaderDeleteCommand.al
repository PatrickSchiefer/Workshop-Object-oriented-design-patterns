codeunit 50118 SalesHeaderDeleteCommand implements ICommandRecord
{

    procedure Execute(var rec: Variant);
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader := rec;
        SalesHeader.Delete();
    end;
}