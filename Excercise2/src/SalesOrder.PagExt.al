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
        }
    }
}