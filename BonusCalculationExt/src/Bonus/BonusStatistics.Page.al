page 65413 "MNB Bonus Statistics"
{
    PageType = CardPart;
    UsageCategory = None;
    SourceTable = "MNB Bonus Header";
    Caption = 'Statistics';
    Editable = false;
    
    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the Bonus Number';
            }
            field("Bonus Amount"; Rec."Bonus Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the Bonus Amount';
            }
        }
    }
}