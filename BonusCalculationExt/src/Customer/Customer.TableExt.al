tableextension 65400 "MNB Customer" extends Customer
{
    fields
    {
        field(65408; "MNB Bonuses"; Integer){
            Caption = 'MNB Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("MNB Bonus Header" where("Customer No."= field("No.")));
            Editable = false;
        }
        // Add changes to table fields here
    }
    trigger OnBeforeDelete()
    begin
        TestIfBonusExists();
    end;
    var
        AtLeastOneBonusForCustomerExistsErr: Label 'At least one bonus for customer %1 exists.', Comment = '%1 - customer name';
    local procedure TestIfBonusExists()
    var bonusheader: Record "MNB Bonus Header";
    begin
        bonusheader.SetRange("Customer No.", Rec."No.");
        if not bonusheader.IsEmpty then
            Error(AtLeastOneBonusForCustomerExistsErr, Rec.Name);
    end;
}