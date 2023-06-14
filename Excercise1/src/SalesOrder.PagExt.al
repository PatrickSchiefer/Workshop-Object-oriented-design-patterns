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
                begin
                    dataExporter.SetDocumentFilter(rec."No.");
                    simpleExport.Export(dataExporter);
                end;
            }

            action(SimpleExport2)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    dataExporter: Codeunit SalesOrderSimpleExporter;
                    simpleExport: Codeunit SimpleExportData;
                begin
                    simpleExport.Export(dataExporter);
                end;
            }
        }
    }
}