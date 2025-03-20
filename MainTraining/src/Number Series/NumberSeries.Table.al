table 60183 "Number Series Table"
{
    Caption = 'Number Series';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;No; Code[20])
        {
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; city; Text[50])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSM : Codeunit "No. Series";
    begin
        if No = '' then
            No := NoSM.GetNextNo();
    end;
}