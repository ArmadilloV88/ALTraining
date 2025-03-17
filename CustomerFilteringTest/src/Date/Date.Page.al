page 60154 "Date Virtual"
{
    PageType = List;
    SourceTable = Date;
    SourceTableView = where("Period Type" = const(Month));
    layout
    {
        area(Content)
        {
           repeater(Rep){
            field("Period Type"; Rec."Period Type")
            {
                Caption = 'Type';
                ApplicationArea = All;
            }
            field("Period Start"; Rec."Period Start")
            {
                Caption = 'Start';
                ApplicationArea = All;
            }
            field("Period End"; Rec."Period End"){
                Caption = 'End';
                ApplicationArea = All;
            }
            field("Period Name"; Rec."Period Name"){
                Caption = 'Name';
                ApplicationArea = All;
            }
           } 
        }
    }
}