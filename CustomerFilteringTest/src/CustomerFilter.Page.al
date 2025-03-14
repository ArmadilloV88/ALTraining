page 60150 "FlowField Testing"
{
    PageType = List;
    SourceTable = "FlowField Test Table";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout{
        area(content)
        {
            repeater(Rep)
            {
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contains a customer unique number.';
                    
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contains a customer name.';
                }
                field("Has Invoices"; Rec."Has Invoices")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates if the customer has invoices.';
                }
                field("Invoice Total"; Rec."Invoice Total")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contains the total amount of all invoices.';
                }
                field("Invoice Count"; Rec."Invoice Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contains the total number of invoices';
                }   
                field("Average Invoice Amount"; Rec."Average Invoice Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contains the average amount of all invoices.';
                }
                field("Max Invoice Amount"; Rec."Max Invoice Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contains the maximum amount of all invoices.';
                }
                field("Min Invoice Amount"; Rec."Min Invoice Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contains the minimum amount of all invoices.';
                }
                field("Last Invoice Date"; Rec."Last Invoice Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Contains the date of the last invoice.';
                }
            }
        }
    }
}