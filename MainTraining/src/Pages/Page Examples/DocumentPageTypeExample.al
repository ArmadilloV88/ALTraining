page 60174 "Document Page Type"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    layout
    {
        area(Content)
        {
            group(Group1)
            {
                Caption = 'Details';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Customer ID Number';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Customer Name';
                    ApplicationArea = All;
                }
                field("Contact Name";Rec.Contact)
                {
                    ToolTip = 'Customer Contact Name';
                    ApplicationArea = All;
                }
            }
            group(Group2){
                Caption = 'Location';
                field(Address;Rec.Address)
                {
                    ToolTip = 'Customer Address';
                    ApplicationArea = All;
                }
                field("Post Code";Rec."Post Code")
                {
                    ToolTip = 'Customer Postal Code';
                    ApplicationArea = All;
                }
                field(City;Rec.City)
                {
                    ToolTip = 'Customer City';
                    ApplicationArea = All;
                }
            }
            part(SalesLines; "Sales Order Subform"){
                ApplicationArea = Basic,Suite;
            }
        }
    }
}