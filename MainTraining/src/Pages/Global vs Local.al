page 60170 "Global vs Local"
{
    //Always make sure to use local rather then global, use encapsulation or overloading to ensure correct passing of data
    Caption = 'Clobal vs Local Variabls';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    
    layout
    {
        area(Content)
        {
            repeater(Rep){
                field("No."; Rec."No.")
                {
                    ToolTip = 'Shows the customer number';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name){
                    ToolTip = 'Shows the customer name';
                    ApplicationArea = All;
                }
                /*field("Name 2";Rec."Name 2"){
                    ToolTip = 'Shows the customer surname';
                    ApplicationArea = All;
                }*///Doesnt display anything
                field(Address;Rec.Address){
                    ToolTip = 'Shows the customer address';
                    ApplicationArea = All;
                }
                field(City;Rec.City){
                    ToolTip = 'Shows the customer city';
                    ApplicationArea = All;
                }
                field(Contact;Rec.Contact){
                    ToolTip = 'Shows the customer contact';
                    ApplicationArea = All;
                }
                /*field("Phone No.";Rec."Phone No.")
                {
                    ToolTip = 'Shows the customer phone number';
                    ApplicationArea = All;
                }*///This doesnt show anything on the test server
                field(test;GlobalTextFunction(Rec)){
                    Caption = 'Global text';
                    ToolTip = 'Global text field';
                    ApplicationArea = All;

                }
            }
        }
    }
    //Functional Programming, this has been fully encapsulated.
    local procedure GlobalTextFunction(Customer : Record Customer) : Text
    begin
        Test2(Customer);
        exit(Customer.Name + ' : ' + Format(Random(10000)));
    end;

    //this procedure attached the 'local' string to the customer name
    procedure Test2(var Customer : Record Customer)
    begin
        Customer.Name := CopyStr(Customer.Name + ' Local ', 1, MaxStrLen(Customer.Name));
    end;

    procedure Test3()
    var
        //sh : Record "Sales Header";
        sl : Record "Sales Line";
    begin
        repeat
        Test4(sl);
        until true;
    end;

    procedure Test4(var SalesLine : Record "Sales Line")
    begin
        SalesLine."Document Type" := SalesLine."Document Type" :: Invoice;
        SalesLine.Insert();

        /*if 4 > 6 then
            SalesLine.Quantity := 10;
        SalesLine.Modify();*/
    end;
}