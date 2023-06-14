table 50300 MyEmployee
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Name; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(2; IBAN; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'IBAN';
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

}