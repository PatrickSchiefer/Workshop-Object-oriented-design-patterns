codeunit 50100 MyElectronicDevice
{

    procedure SetPowerAdapter(PowerAdapater: Interface IPowerAdapter);
    begin
        customPowerAdapter := PowerAdapater;
        customPowerAdapterUsed := true;
    end;

    procedure PlugIn()
    begin
        if customPowerAdapterUsed then
            PlugIn230Volt();

        powerConnected := true;

    end;

    procedure PlugIn230Volt()
    begin
        // Do PlugIn
    end;

    var
        powerConnected: Boolean;
        customPowerAdapterUsed: Boolean;
        customPowerAdapter: Interface IPowerAdapter;

}