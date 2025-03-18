pageextension 60169 ItemListExt extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(setfilter){
                Image = Filter;
                caption = 'set filter';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Set a filter for the items.';
                trigger OnAction()
                begin
                    //Rec.SetFilter("Unit Price", '600..660');
                    Rec.SetRange("Unit Price", 600,660);
                end;

            }
        }
    }
    
}