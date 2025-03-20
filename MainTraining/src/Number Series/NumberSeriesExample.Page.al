page 60182 "Number Series Card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Number Series Table";
    //DelayedInsert = false;
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