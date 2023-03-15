codeunit 50111 CommandQueue
{
    procedure Push(value: Interface ICommand)
    var
        Entry: Codeunit QueueEntry;
    begin
        Entry.SetValue(value);
        if count = 0 then begin
            first := Entry;
            last := Entry;
        end
        else begin
            last.SetNextEntry(Entry);
            last := Entry;
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
        object: Interface ICommand;
    begin
        while GetSize() > 0 do begin
            object := Pop();
            object.Execute();
        end;
    end;

    var
        first: Codeunit QueueEntry;
        last: Codeunit QueueEntry;
        count: Integer;
}