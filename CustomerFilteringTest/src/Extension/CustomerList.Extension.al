pageextension 60156 "CustomerListExt" extends "Customer List"
{
    //there is a new action under the actions drop down list called my batch, run that function to test this code
    actions{
        addfirst(processing){
            action(MyBatch){
                Caption = 'My Batch';
                ApplicationArea = All;
                RunObject = Report "My Batch";
            }
        }
    }


    trigger OnOpenPage() 
    var
        Company: Record Company;
        Customer: Record Customer;
        Customer2 : Record Customer;
    begin
        if Company.FindSet() then
            repeat
            Customer.ChangeCompany(Company.Name);
            Customer.FindFirst();
            Customer.Validate("Customer Posting Group");
            //Message('%1', Customer.Name);
            until Company.Next() = 0;
    end;
}