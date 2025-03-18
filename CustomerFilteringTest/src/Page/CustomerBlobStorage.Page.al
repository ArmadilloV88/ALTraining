page 60152 "Customer Blob Storage Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Customer Blob Storage Table";
    
    layout
    {
        area(Content)
        {
                field(PKEY; Rec.PKEY)
                {
                    ApplicationArea = All;
            
                }
                field(B; Rec.BLOB){

                    ApplicationArea = All;
                }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Import){
                Caption = 'Import';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Import;
                trigger OnAction()
                var
                    InS: InStream;
                    OutS: OutStream;
                    FileName: Text;
                begin
                   if UploadIntoStream('Select File','','',FileName,InS) then begin
                        TempBlob.CreateOutStream(OutS);
                        CopyStream(OutS,InS);
                        Rec.CalcFields(BLOB);
                        Rec.BLOB.CreateOutStream(OutS);
                        TempBlob.CreateInStream(InS);
                        CopyStream(OutS,InS);
                   end;
                end;
            }
            action(Import2){
                Caption = 'Import into Persistent';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Import;
                trigger OnAction()
                var
                    InS: InStream;
                    OutS: OutStream;
                    FileName: Text;
                    PNo : BigInteger;
                begin
                   if UploadIntoStream('Select File','','',FileName,InS) then begin
                        PNo := Persistant.Create();
                        Persistant.CopyFromInStream(PNo,InS);
                        Message('P Number = %1',PNo);
                        
                   end;
                end;
            }
            action(Import3){
                Caption = 'From Persistent';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Outs: OutStream;
                begin
                    Rec.CalcFields(BLOB);
                    Rec.BLOB.CreateOutStream(Outs);
                    Persistant.CopyToOutStream(1,Outs);
                end;

            }
        }
    }

    Trigger OnOpenPage()
    begin
       if Rec.IsEmpty then
        Rec.Insert();
    end;
    var
        TempBlob: Codeunit "Temp Blob";
        TempBlob2: Codeunit "Temp Blob List";
        BlobList: Codeunit "Temp Blob List";
        Persistant: Codeunit "Persistent Blob";
}