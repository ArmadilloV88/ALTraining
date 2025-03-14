page 60106 "FlowField Filtering Test"
{
    PageType = List;
    SourceTable = "NVR Customer Filtering";

    layout{
        area(content)
        {
            repeater(Rep)
            {
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
}