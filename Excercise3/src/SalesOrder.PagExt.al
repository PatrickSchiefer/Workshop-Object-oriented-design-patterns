pageextension 50100 SalesOrders extends "Sales Order List"
{

    actions
    {
        addlast("O&rder")
        {
            action(SimpleExport)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    dataExporter: Codeunit SalesLineSimpleExporter;
                    simpleExport: Codeunit SimpleExportData;
                    doNothing: Codeunit DoNothingRecordCommand;
                begin
                    dataExporter.SetDocumentFilter(rec."No.");
                    simpleExport.Export(dataExporter, doNothing);
                end;
            }

            action(SimpleExport2)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    dataExporter: Codeunit SalesOrderSimpleExporter;
                    simpleExport: Codeunit SimpleExportData;
                    doNothing: Codeunit DoNothingRecordCommand;
                begin
                    simpleExport.Export(dataExporter, doNothing);
                end;
            }
            action(SimpleExportDeleteRecord)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    dataExporter: Codeunit SalesOrderSimpleExporter;
                    simpleExport: Codeunit SimpleExportData;
                    salesHeaderDeleteCommand: Codeunit SalesHeaderDeleteCommand;
                begin
                    simpleExport.Export(dataExporter, salesHeaderDeleteCommand);
                end;
            }
            action(CommandQueueExample)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    postDocument: Codeunit PostDocumentQueueExample;
                    printCommand: Codeunit PrintOrderConfirmationCommand;
                    command: Interface ICommand;
                    queue: Codeunit CommandQueue;
                    ediCommand: Codeunit ExportEDIOrderConfCommand;
                begin
                    ediCommand.SetSalesOrder(rec."No.");
                    printCommand.SetSalesOrder(rec."No.");
                    queue.Push(ediCommand);
                    queue.Push(printCommand);
                    postDocument.Post(rec, queue);
                end;
            }

            action(CommandQueueExample2)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    postDocument: Codeunit PostDocumentQueueExample;
                    printCommand: Codeunit PrintOrderConfirmationCommand;
                    command: Interface ICommand;
                    queue: Codeunit CommandQueue;
                begin
                    printCommand.SetSalesOrder(rec."No.");
                    queue.Push(printCommand);
                    postDocument.Post(rec, queue);
                end;
            }
            action(AddToBatchPost)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    postingCommand: Codeunit PostingCommand;
                begin
                    postingCommand.GetHeader(rec."Document Type", rec."No.");
                    PostQueue.Push(postingCommand);
                end;
            }
            action(ExecuteBatchPost)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    PostQueue.ProcessQueue();
                end;
            }

        }
    }

    var
        PostQueue: Codeunit CommandQueue;

}