page 60163 "Test Customer Card"
{
    //set "startupObjectId": 60163 in launch.json
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    Caption = 'Test Customer card';

    layout{
        area(Content){
            //repeater(Rep){
            field("No.";Rec."No." + ' Code'){
                ToolTip = 'Shows the customer primary key';
                Caption = 'Customer Code';
                ApplicationArea = All;
            }
            field("Name"; Rec.Name){
                ToolTip = 'Shows the customer name';
                Caption = 'Customer Name';
                ApplicationArea = All;
            }
            field("SmartFieldCtl"; SmartField()){
                ToolTip = 'Shows the smart field value';
                Caption = 'A smart field';
                ApplicationArea = All;
            }
            field("SmarterFieldCtl"; SmarterField(Rec)){
                ToolTip = 'Shows the smarter field value';
                Caption = 'A Smarter Field';
                ApplicationArea = All;
            }
            field("Smart Date"; SmartDate()){
                Caption = 'Smart Date';
                ApplicationArea = All;
                ToolTip = 'Displays a smart date.';
            }
            field(Alabel; LabelLbl){
                ApplicationArea = All;
                Editable = false;
                ShowCaption = false;
                trigger OnDrillDown() 
                begin
                    Message('Hello ' + SmartField());
                end;
            }
            field(bool; Random(100) > 50){
                ToolTip = 'Shows the random bool value';
                Editable = true;
                Caption = 'Bool Express';
                ApplicationArea = All;
            }
            //}
        }
    }
    procedure SmartField():Text 
    begin
        if Random(100) > 50 then
            exit('Smart Field ')
        else
            exit('Not Smart Field or smart ;)');
    end;
    Procedure SmarterField(Customer : Record Customer):Text 
    begin
        if Random(100) > 50 then
            exit('Smarter ' + Customer.Name)
        else
            exit('Smart or smarter ;)' + Customer.Name);
    end;
    procedure SmartDate() : Date
    begin
        exit(20250218D);
    end;
    var 
        LabelLbl : Label 'Press me';
}