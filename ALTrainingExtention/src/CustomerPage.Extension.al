pageextension 60104 "NVR Customer Page Extension" extends "Customer List"
{
    trigger OnOpenPage()
    var
        TypeHelper : Codeunit "Type Helper";
        Input : Text;
        Output : Text;
        I : Integer;
        b : Integer;
    Begin
        Input := 'Navertica';
        for I := 1 to StrLen(Input) do begin
            b := Input[I];
            if b < 16 then
                Output := Output + '0';

            Output := Output + TypeHelper.IntToHex(b);
        end;
        //Message('Input = %1, Output = %2', Input, Output);
        //Commented out this due to to much messages popping up in the BC system
    End;
}