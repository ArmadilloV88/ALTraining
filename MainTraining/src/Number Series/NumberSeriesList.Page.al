page 60186 "Number Series List"
{
    Caption = 'Number Series List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Number Series Table";
    CardPageId = "Number Series Card Page";
    
    layout
    {
        area(Content)
        {
            repeater(General){
                field(No;Rec.No)
                {
                    ToolTip = 'Shows the No.';
                    ApplicationArea = All;
                }
                field(Name;Rec.Name)
                {
                    ToolTip = 'Shows the Name.';
                    ApplicationArea = All;
                }
                field(city;Rec.city)
                {
                    ToolTip = 'Shows the City.';
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action("Setup")
            {
                Image = NumberSetup;
                Caption = 'Setup page';
                ApplicationArea = All;
                ToolTip = 'Runs the Number Series Setup Page.';
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Number Series Setup Page");
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
    end;
}