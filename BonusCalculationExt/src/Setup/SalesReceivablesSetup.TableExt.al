tableextension 65416 "MNB Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(65417; "MNB Bonus Nos."; Code[20])
        {
            Caption = 'Bonus Nos.';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
    }
}