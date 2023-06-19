codeunit 50198 ComplexExporterTests
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit Assert;

    [Test]
    procedure TestComplexExporter();
    var
        getter: Codeunit MockSalesLineComplexGetter;
        dataCheck: Codeunit SalesLineComplexDataCheck;
        processor: Codeunit SalesLineComplexProcessData;
        exporter: Codeunit ComplexExportToMessage;
        //exporter: Codeunit MockComplexExportNoExport;
        complexExport: Codeunit ComplexExportData;
        cr: Char;
        lf: Char;
    begin
        cr := 13;
        lf := 10;
        complexExport.Export(getter, dataCheck, processor, exporter);
        Assert.AreEqual(processor.GetExportData(), 'TEST;2' + Format(cr) + Format(lf), 'Export Data does not equal the correct format');
    end;



}
