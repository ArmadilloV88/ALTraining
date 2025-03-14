pageextension 60102 "NVR Item Card Extension" extends "Item Card"
{
    // Purpose of this extension is to extend the Item Card page with additional fields 
    layout
    {
        // Modification will be seen in the inventory section of the Item Card page
        addfirst(InventoryGrp){
            field("Last Counted"; Rec."Last Counted")
            {
                ApplicationArea = All;
                ToolTip = 'The date when the item was last counted';
            }

        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}