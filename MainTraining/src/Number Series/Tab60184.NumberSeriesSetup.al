table 60184 NumberSeriesSetup
{
    Caption = 'NumberSeriesSetup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; PKEY; Code[10])
        {
            Caption = 'PKEY';
        }
        field(2; "No.Series"; Code[20])
        {
            Caption = 'No.Series';
        }
    }
    keys
    {
        key(PK; PKEY)
        {
            Clustered = true;
        }
    }
}
