pageextension 60171 "Cust List" extends "Customer List"
{
    actions{
        addfirst(processing){
            action(TestOverload){
                ToolTip = 'Overloading function that allows customer cration';
                Image = SalesPerson;
                Caption = 'Create Customer Overload';
                ApplicationArea = All;
                trigger OnAction()
                var
                    CS : Codeunit Overloading;
                    Base64 : Codeunit "Base64 Convert";
                begin
                    cs.CreateCustomer(Rec);
                    Base64.ToBase64(Rec.Name);
                end;
            }
        }
    }
}