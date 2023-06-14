page 50300 MyEmployeeList
{
    Caption = 'My Employee List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = true;
    SourceTable = MyEmployee;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(IBAN; Rec.IBAN)
                {
                    ToolTip = 'Specifies the value of the IBAN field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SendSalary)
            {
                ApplicationArea = All;
                Enabled = SalaryEnabled;
                trigger OnAction()
                var
                    salarySetup: Record "SalarySetup";
                    iSalaray: Interface "ISalary";
                begin
                    salarySetup.Get();
                    iSalaray := salarySetup.SalaryHandler;
                    if iSalaray.SalaryEnabled() then
                        iSalaray.SendSalary(rec.IBAN, 0.12);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        salarySetup: Record "SalarySetup";
        iSalaray: Interface "ISalary";
    begin
        salarySetup.Get();
        iSalaray := salarySetup.SalaryHandler;
        SalaryEnabled := iSalaray.SalaryEnabled();
    end;


    var
        [InDataSet]
        SalaryEnabled: Boolean;

}