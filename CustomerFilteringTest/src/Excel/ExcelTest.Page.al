page 60156 "Excel Test Page"
{
    PageType = NavigatePage;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Excel Test";
    
    layout
    {
        area(Content)
        {
            repeater(rep){
                field(Primary;Rec.Primary){
                    ApplicationArea = All;
                }
                field("Text Data"; Rec."Text Data"){
                    ApplicationArea = All;
                }
                field("Date Data"; Rec."Date Data"){
                    ApplicationArea = All;
                }
                field("Decimal Data"; Rec."Decimal Data"){
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(test)
            {
                Caption = 'Import';
                Image = TestDatabase;
                InFooterBar = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    x : Codeunit "Excel Tools";
                    Buffer: Record "Excel Buffer" temporary;
                    Data : Record "Excel Test";
                    Ins : InStream;
                    FileName : Text;
                    row : Integer;
                    LastRow : Integer;
                begin
                    Data.DeleteAll();
                    if UploadIntoStream('Gimme Excel','','',FileName,Ins) then begin
                       Buffer.OpenBookStream(Ins,'Sheet1'); 
                       Buffer.ReadSheet();
                       //Message('Total count %1', Buffer.Count);
                       Buffer.SetRange("Column No.",4);
                       Buffer.FindLast();
                       LastRow := Buffer."Row No.";
                       Buffer.Reset();
                       //Message(Format(Buffer));

                       for row := 9 to LastRow do begin
                        Data.Init();
                        Data.Primary := x.GetText(Buffer, 'D', row);
                        Data."Text Data" := X.GetText(Buffer,'E',row);
                        Data."Date Data" := X.GetDate(Buffer,'F',row);
                        Data."Decimal Data" := X.GetDecimal(Buffer,'G',row);
                        Data.Insert();
                       end;
                    end;
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}