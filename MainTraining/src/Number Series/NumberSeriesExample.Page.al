page 60182 "Number Series Example Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Number Series Table";
    
    layout
    {
        area(Content)
        {
                field(No; Rec.No)
                {
                    ToolTip = 'No.';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Name';
                    ApplicationArea = All;
                }
                field(city;Rec.city)
                {
                    ToolTip = 'City';
                    ApplicationArea = All;
                }
        }
    }
}