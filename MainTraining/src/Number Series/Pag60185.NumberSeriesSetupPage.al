page 60185 NumberSeriesSetupPage
{
    ApplicationArea = All;
    Caption = 'NumberSeriesSetupPage';
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
}
