page 60161 "RegEx Workbench"
{
    //Code has been extracted from Erik Hougaard : https://github.com/hougaard/Youtube-Video-Sources/tree/master/Regex
    PageType = Card;
    Caption = 'RegEx Workbench';
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(Content)
        {
            field(InputData; InputData)
            {
                ToolTip = 'Shows the input data value';
                Caption = 'Input';
                ApplicationArea = all;
                MultiLine = true;
            }
            field(Pattern; Pattern)
            {
                ToolTip = 'Shows the pattern';
                Caption = 'Pattern';
                ApplicationArea = All;
                trigger OnAssistEdit()
                var
                    PatRec: REcord "RegEx Pattern";
                begin
                    if page.RunModal(Page::Patterns, PatRec) = action::LookupOK then
                        Pattern := PatRec.RegEx;
                end;
            }
            part(Matchpart; "RegEx Matches")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(MatchAction)
            {
                image = MachineCenterLoad;
                ToolTip = 'Shows the match action';
                caption = 'Match';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    RegEx: Codeunit Regex;
                begin
                    RegEx.Match(InputData, Pattern, Matches);
                    CurrPage.Matchpart.Page.Fill(InputData, Matches);
                end;
            }
        }
    }

    var
        Matches: Record Matches;
        InputData: Text;
        Pattern: Text;
}