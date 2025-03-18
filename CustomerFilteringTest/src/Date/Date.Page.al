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
                ToolTip = 'Shows the period Type';
                Caption = 'Type';
                ApplicationArea = All;
            }
            field("Period Start"; Rec."Period Start")
            {
                ToolTip = 'Shows the period start date';
                Caption = 'Start';
                ApplicationArea = All;
            }
            field("Period End"; Rec."Period End"){
                ToolTip = 'Shows the period end date';
                Caption = 'End';
                ApplicationArea = All;
            }
            field("Period Name"; Rec."Period Name"){
                ToolTip = 'Shows the period name';
                Caption = 'Name';
                ApplicationArea = All;
            }
           } 
        }
    }
}