table 65405 "MNB Bonus Line"
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;"Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            Editable = false;
            TableRelation = "MNB Bonus Header";
            trigger OnValidate()
            begin
                //TestNoSeries();
                //CalcFields("Customer Name");
            end;
        }
        field(2;"Type"; Enum "MNB Bonus Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            trigger OnValidate()
            begin
                //TestNoSeries();
            end;
        }
        field(3;"Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            Editable = false;
            TableRelation = if (Type = filter(Item)) Item;
            trigger OnValidate()
            begin
                //TestNoSeries();
                //CalcFields("Customer Name");
            end;
        }
        field(4;"Bonus Perc"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Perc.';
            MinValue = 0;
            MaxValue = 100;
            trigger OnValidate()
            begin
                //TestNoSeries();
            end;
        }
        
    }
    
    keys
    {
        key(PK; "Document No.","Type", "Item No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    //var
        //myInt: Integer;
    
    trigger OnInsert()
    begin
        this.TestStatus();
    end;
    
    trigger OnModify()
    begin
        this.TestStatus();
    end;
    
    trigger OnDelete()
    begin
        this.TestStatus();
    end;
    
    trigger OnRename()
    begin
        this.TestStatus();
    end;

    var
      StatusCannotBeReleasedErr: Label 'Status cannot be %1.', Comment = '%1 status field value';

    local procedure TestStatus()
    var
        bonusheader: Record "MNB Bonus Header";
    begin
        if bonusheader.Get(Rec."Document No.") then
          if bonusheader.Status = bonusheader.Status :: Released then
            Error(this.StatusCannotBeReleasedErr, BonusHeader.Status);
    end;
    
}