page 60162 "Patterns"
{
    //Code has been extracted from Erik Hougaard : https://github.com/hougaard/Youtube-Video-Sources/tree/master/Regex
    UsageCategory = Administration;
    ApplicationArea = All;
    PageType = List;
    SourceTable = "RegEx Pattern";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(rep)
            {

                field(RegEx; Rec.RegEx)
                {
                    ToolTip = 'Shows the Regular expression formula';
                    ApplicationArea = All;
                    Width = 5;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Shows the description';
                    ApplicationArea = All;
                    //MultiLine = true;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.create();
    end;
}