codeunit 50111 CommandQueue
{
    procedure Push(value: Interface ICommand)
    var
        newEntry: Codeunit QueueEntry;
    begin
        newEntry.SetValue(value);
        if count = 0 then begin
            first := newEntry;
            last := newEntry;
        end
        else begin
            last.SetNextEntry(newEntry);
            last := newEntry;
        end;
        count += 1;
    end;

    procedure Pop() value: Interface ICommand;
    begin
        if count > 0 then begin
            value := first.GetValue();
            first := first.GetNextEntry();
            count -= 1;
        end
        else
            Error('The Queue is empty!');
    end;

    procedure GetSize(): Integer
    begin
        exit(count);
    end;

    procedure ProcessQueue()
    var
        entry: Interface ICommand;
    begin
        while GetSize() > 0 do begin
            entry := Pop();
            entry.Execute();
        end;
    end;

    var
        first: Codeunit QueueEntry;
        last: Codeunit QueueEntry;
        count: Integer;
}