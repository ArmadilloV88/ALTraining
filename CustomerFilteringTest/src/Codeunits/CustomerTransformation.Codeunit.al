codeunit 60158 "Custom Transformation"
{
    //Search for Transformation Rules in BC and Test this codeunit there

    //Rule 1 : Dont expect your code to run alone, expect that there are other events and subscribers that run before or even after your code.
    //Rule 2 : Ensure your code doesnt throw an error and is resiliant with defensive code.
    //Rule 3 : Throw an error if its it definetly needed, dont throw errors from the blue.
    [EventSubscriber(ObjectType::Table, Database::"Transformation Rule", OnTransformation, '', false, false)]
    local procedure "Transformation Rule_OnTransformation"(TransformationCode: Code[20]; InputText: Text; var OutputText: Text)
    var 
        i : Integer;
    begin
        case TransformationCode of
        'AAA' :
            begin 
                OutputText := '';
                for i := 1 to StrLen(InputText)do
                        OutputText += InputText[StrLen(InputText)-i + 1];
            end;
        end;
    end;
}
