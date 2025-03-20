page 60185 "Number Series Setup Page"
{
    ApplicationArea = All;
    Caption = 'Number Series Setup Page';
    PageType = Card;
    SourceTable = NumberSeriesSetup;
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("No.Series"; Rec."No.Series")
                {
                    ToolTip = 'Specifies the value of the No.Series field.', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
    end;
}
