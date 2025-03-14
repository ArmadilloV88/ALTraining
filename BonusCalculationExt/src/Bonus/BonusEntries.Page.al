page 65410 "MNB Bonus Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "MNB Bonus Entry";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Caption = 'Bonus Entries';
    
    layout
    {
        area(Content)
        {
            group(Control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posting date of the bonus entry.';
                }
                field("Bonus No."; Rec."Bonus No."){
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus number of the bonus entry.';
                }
                field("Document No."; Rec."Document No."){
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number of the bonus entry.';
                }
                field("Item No."; Rec."Item No."){
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item number of the bonus entry.';
                }
                field("Bonus Amount"; Rec."Bonus Amount"){
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus amount of the bonus entry.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number of the bonus entry.';
                }
            }
        }
    }
    
    /*actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }*/
}