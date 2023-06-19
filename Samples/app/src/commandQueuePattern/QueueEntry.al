codeunit 50110 QueueEntry
{
    procedure SetValue(var v: Interface ICommand);
    begin
        value := v;
    end;

    procedure GetValue(): Interface ICommand;
    begin
        exit(value);
    end;

    procedure GetNextEntry(): Codeunit QueueEntry;
    begin
        exit(NextEntry);
    end;

    procedure SetNextEntry(var Entry: Codeunit QueueEntry);
    begin
        NextEntry := Entry;
    end;

    var
        value: Interface ICommand;
        NextEntry: Codeunit QueueEntry;
}