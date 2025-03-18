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
            group(GroupContent){
                field(Primary;Rec.Primary){
                    ToolTip = 'Shows the primary key';
                    ApplicationArea = All;
                }
                field("Text Data"; Rec."Text Data"){
                    ToolTip = 'Shows the text data';
                    ApplicationArea = All;
                }
                field("Date Data"; Rec."Date Data"){
                    ToolTip = 'Shows the date data';
                    ApplicationArea = All;
                }
                field("Decimal Data"; Rec."Decimal Data"){
                    ToolTip = 'Shows the decimal data';
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
                    Data: Record "Excel Test";
                    TempBuffer: Record "Excel Buffer" temporary;
                    x: Codeunit "Excel Tools";
                    Ins: InStream;
                    FileName: Text;
                    row: Integer;
                    LastRow: Integer;
                begin
                    Data.DeleteAll();
                    if UploadIntoStream('Gimme Excel','','',FileName,Ins) then begin
                       TempBuffer.OpenBookStream(Ins,'Sheet1'); 
                       TempBuffer.ReadSheet();
                       //Message('Total count %1', TempBuffer.Count);
                       TempBuffer.SetRange("Column No.",4);
                       TempBuffer.FindLast();
                       LastRow := TempBuffer."Row No.";
                       TempBuffer.Reset();
                       //Message(Format(TempBuffer));

                       for row := 9 to LastRow do begin
                        Data.Init();
                        Data.Primary := CopyStr(x.GetText(TempBuffer, 'D', row), 1, 20);
                        Data."Text Data" := CopyStr(X.GetText(TempBuffer,'E',row), 1, 100);
                        Data."Date Data" := X.GetDate(TempBuffer,'F',row);
                        Data."Decimal Data" := X.GetDecimal(TempBuffer,'G',row);
                        Data.Insert();
                       end;
                    end;
                end;
            }
        }
    }
}