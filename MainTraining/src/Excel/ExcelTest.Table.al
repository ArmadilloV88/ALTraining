table 60156 "Excel Test"
{
    
    
    fields
    {
        field(1;"Primary"; Code[20])
        {
            Caption = 'Primary';
            DataClassification = SystemMetadata;
            
        }
        field(2;"Text Data"; Text[100])
        {
            Caption = 'Text Data';
            DataClassification = SystemMetadata;
        }
        field(3;"Date Data";Date)
        {
            Caption = 'Date Data';
            DataClassification = SystemMetadata;
        }
        field(4; "Decimal Data"; Decimal)
        {
            Caption = 'Decimal Data';
            DataClassification = SystemMetadata;
        }

    }
    
    keys
    {
        key(PK; Primary)
        {
            Clustered = true;
        }
    }
}