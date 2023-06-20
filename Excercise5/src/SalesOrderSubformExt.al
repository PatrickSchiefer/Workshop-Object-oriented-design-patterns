pageextension 50500 SalesOrderSubformExt extends "Sales Order Subform"
{

    actions
    {
        addlast(processing)
        {
            action(ExportSalesLineWithoutAdapter)
            {
                trigger OnAction()
                var
                    ExportSalesLine: Codeunit "ExportSalesLines";
                begin
                    ExportSalesLine.ExportSalesLines(rec);
                end;
            }
            action(ExportSalesLineWithAdapter)
            {
                trigger OnAction()
                var
                    ExportSalesLine: Codeunit "ExportSalesLines";
                    adapter: Codeunit ExportSalesLineAdapter;
                begin
                    ExportSalesLine.SetGenerateExportLineAdapter(adapter);
                    ExportSalesLine.ExportSalesLines(rec);
                end;
            }
        }
    }
}