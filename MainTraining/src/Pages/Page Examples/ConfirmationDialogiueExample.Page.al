page 60178 "Confirmation Page Example"
{
    PageType = ConfirmationDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Cust. Ledger Entry";
    
    layout
    {
        area(Content)
        { 
            //repeater(rep){
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Ledger Entry Number';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Customer ID Number';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Customer Name';
                    ApplicationArea = All;
                }
                field("Doc No."; Rec."Document No.")
                {
                    ToolTip = 'Document Number';
                    ApplicationArea = All;
                }
                field("Doc Type."; Rec."Document Type")
                {
                    ToolTip = 'Document Type';
                    ApplicationArea = All;
                }
                field("Amount"; Rec.Amount)
                {
                    ToolTip = 'Total Amount';
                    ApplicationArea = All;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ToolTip = 'Remaining Amount';
                    ApplicationArea = All;
                }
            //} not advised to have a repeater in the page if its a confirmdialogue page
        }
        /*area(FactBoxes)
        {
            part(Stat; "Customer Details FactBox")
            {
                SubPageLink = "No." = field("Customer No.");
                ApplicationArea = All;
            }
        }*///This wont work as there is no space for BC to process the Fact Box
    }
}