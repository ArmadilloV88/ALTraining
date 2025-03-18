pageextension 60169 ItemListExt extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(setfilter){
                Image = Filter;
                caption = 'Get Selection filter';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Set a filter for the items.';
                trigger OnAction()
                var 
                    Item2 : Record Item;
                    item3 : Record Item;
                begin
                    CurrPage.SetSelectionFilter(Item2);
                    Message('Filter=%1, Count=%2', Item2.GetFilters(),Item2.Count());

                    item3.FindFirst();
                    Item3.Mark(true);
                    Item3.Next();
                    Item3.Mark(true);
                    Item3.MarkedOnly(true);
                end;

            }
            action(set2filters){
                Image = Filter;
                caption = 'Set two filters';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Set a filter for the items.';
                trigger OnAction()
                var
                    //grp: Integer;
                    //item2 : Record Item;
                begin
                    rec.FilterGroup(-1);
                    rec.SetCurrentKey("Vendor No.");
                    rec.SetFilter(Description,'*@chair');
                    rec.SetFilter("Description 2", '*@chair');
                    rec.FilterGroup(0);
                    //grp := Rec.FilterGroup;
                    //rec.FilterGroup(10);
                    //rec.SetRange("Unit Price",80,300);
                    //rec.FilterGroup(11);
                    //rec.SetRange("Unit Price",100,400);
                    //rec.FilterGroup(grp);

                end;

            }
        }
    }
    
}