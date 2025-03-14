page 65407 "MNB Bonus Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "MNB Bonus Header";
    Caption = 'Bonus Card';
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Bonus Number';
                    
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Customer Number';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Customer Name';
                    DrillDown = false;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Starting Date';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Ending Date';
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Bonus Status';
                }
                field("Last Released Date"; Rec."Last Released Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Last Released Date';
                }
                
            }
            part(Lines; "MNB Bonus Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(FactBoxes){
            part(Statistics; "MNB Bonus Statistics")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea = All;
            }
            systempart(Links; Links){
                ApplicationArea = All;
            }
            systempart(Notes; Notes){
                ApplicationArea = All;
            }
        }
    }
    
    actions
    {
        area(Navigation)
        {
           action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                ToolTip = 'Opens the Customer Card for the bonus';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
            }
            action(BonusEntries){
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                ToolTip = 'Opens the Bonus Entries for the bonus';
                Image = Entry;
                RunObject = page "MNB Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
            }
        }
        area(Reporting){
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';
                ToolTip = 'Prints the Bonus Card';
                Image = Print;
                RunObject = report "MNB Bonus Printout";
            }
        }
    }
}