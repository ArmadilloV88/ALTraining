table 65402 "MNB Bonus Header"
{
    Caption = 'Bonus';
    DataClassification = CustomerContent;
    DrillDownPageId = "MNB Bonus List";
    LookupPageId = "MNB Bonus List";
    
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
            trigger OnValidate()
            begin
                TestStatus();
                CalcFields("Customer Name");
            end;
            
        }
        field(3; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Start Date';
            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                   "Ending Date" := "Starting Date";
            end;
        }
        field(4; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'End Date';
            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                   "Starting Date" := "Ending Date";
            end;
        }
        field(5; "Status"; Enum "MNB Bonus Header Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            trigger OnValidate()
            begin
                TestOnRelease();
            end;
        }
        field(6; "Last Released Date"; DateTime)
        {
            DataClassification = SystemMetadata;
            Caption = 'Last Released Date';
            Editable = false;
        }
        field(7; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where ("No." = field("Customer No.")));
            Editable = false;
        }
        field(8; "Bonus Amount";Decimal){
            Caption = 'Bonus Amount';
            FieldClass = FlowField;
            CalcFormula = sum("MNB Bonus Entry"."Bonus Amount" where("Bonus No." = field("No.")));
            Editable = false;
        }
    }
    
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("MNB Bonus Nos.");
            NoSeriesManagement.InitSeries(SalesSetup."MNB Bonus Nos.", SalesSetup."MNB Bonus Nos.", WorkDate(), "No.", SalesSetup."MNB Bonus Nos.");
        end;
    end;
    trigger OnModify()
    begin
        
    end;
    trigger OnDelete()
    begin
        TestStatus();
        DeleteLines();
    end;
    trigger OnRename()
    begin
        
    end;
    var
        StatusCannotBeReleasedErr: Label 'Status cannot be %1', Comment = '%1 Status field value';
    local procedure TestStatus()
    begin
        if Status = status :: Released then
            Error(StatusCannotBeReleasedErr, Status);

    end;
    local procedure DeleteLines()
    var BonusLines : Record "MNB Bonus Line";
    begin
        BonusLines.SetRange("Document No.", "No.");
        BonusLines.DeleteAll();
    end;
    local procedure TestNoSeries()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." <> xRec."No." then begin
            SalesSetup.Get();
            NoSeriesManagement.TestManual(SalesSetup."MNB Bonus Nos.");
        end;
    end;
    local procedure TestOnRelease()
    begin
        if Status <> status :: Released then
            exit;
            TestField("Customer No.");
            "Last Released Date" := CurrentDateTime;
    end;
}