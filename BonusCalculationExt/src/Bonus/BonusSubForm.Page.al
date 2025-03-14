page 65408 "MNB Bonus Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "MNB Bonus Line";
    Caption = 'Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Type of the bonus assigned';
                }
                field("Item.no."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Item Number for which the bonus is assigned';
                }
                field("Bonus Perc"; Rec."Bonus Perc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the Bonus Percentage';
                }

            }
        }
    }
}