pageextension 65400 "MNB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1){
            field("MNB No. of Bonuses"; Rec."MNB Bonuses"){
                    ApplicationArea = All;
                    ToolTip = 'Shows the number of bonuses assigned to the customer';
            }
        }
    }
    actions
    {
        addlast(navigation){
            action(MNBBonus){
                Caption = 'Bonuses';
                ToolTip = 'Shows the bonuses assigned to the customer';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "MNB Bonus List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
}