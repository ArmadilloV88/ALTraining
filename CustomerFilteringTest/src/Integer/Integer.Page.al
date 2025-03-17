page 60153 "Integer Page"
{
    PageType = List;
    SourceTable = Integer;
    SourceTableView = where(Number = filter('-5..16'));
    layout{
        area(Content){
            repeater(Rep){
                field(Number; GetValue(Rec.Number)){
                    Caption = 'Integer Caption';
                    ApplicationArea = All;
                }
            }
        }
    }
    procedure GetValue(i : Integer) : Text
    begin
        if Dict.ContainsKey(i) then
        exit(Dict.Get(i));

    end;
    trigger OnOpenPage()
    begin
        Dict.Add(1,'W');
        Dict.Add(2,'Wi');
        Dict.Add(3,'Wia');
        Dict.Add(4,'Wian');
        Dict.Add(5,'Wian V');
        Dict.Add(6,'Wian Ve');
        Dict.Add(7,'Wian Ver');
        Dict.Add(8,'Wian Vers');
        Dict.Add(9,'Wian Versf');
        Dict.Add(10,'Wian Versfe');
        Dict.Add(11,'Wian Versfel');
        Dict.Add(12,'Wian Versfeld');
    end;

    var
        Dict: Dictionary of [Integer, Text];
}