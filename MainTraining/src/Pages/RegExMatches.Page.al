page 60159 "RegEx Matches"
{
    //Code has been extracted from Erik Hougaard : https://github.com/hougaard/Youtube-Video-Sources/tree/master/Regex
    PageType = ListPart;
    SourceTable = Matches;
    SourceTableTemporary = true;
    Editable = false;
    layout
    {
        area(Content)
        {

            repeater(rep)
            {
                field(Index; Rec.Index)
                {
                    ToolTip = 'Shows the indexs';
                    ApplicationArea = All;
                }
                field(MatchIndex; Rec.MatchIndex)
                {
                    ToolTip = 'Shows the matching indexes';
                    ApplicationArea = All;
                }
                field(Success; Rec.Success)
                {
                    ToolTip = 'Shows the success boolean';
                    ApplicationArea = All;
                }
                field(Length; Rec.Length)
                {
                    ToolTip = 'Shows the length';
                    ApplicationArea = All;
                }
                field(Data; GetData(Rec))
                {
                    ToolTip = 'Shows the data';
                    ApplicationArea = all;
                    Caption = 'Match';
                }
            }
        }
    }
    procedure GetData(m: Record Matches): Text
    begin
        exit(copystr(InputData, m.Index + 1, m.Length));
    end;

    procedure Fill(_InputData: Text; var m2: Record Matches)
    begin
        InputData := _InputData;
        rec.deleteall();
        if m2.findset() then
            repeat
                rec.copy(m2);
                rec.insert();
            until m2.next() = 0;
    end;

    var
        InputData: Text;
}