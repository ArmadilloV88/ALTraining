codeunit 60170 "Overloading"
{
    procedure CreateCustomer(var C : Record Customer)
    begin
        C.Init();
        C.Insert(true);
    end;

    procedure CreateCustomer(Name : Text; var C : Record Customer)
    begin
            CreateCustomer(Name,'','',C);
    end;
    procedure CreateCustomer(Name : Text; PostingGroup : Code[20]; PhoneNum : Text; var C : Record Customer)
    begin
        C.Init();
        C.Insert(true);
        C.Validate(Name , Name);
        C.Validate("Phone No.", PhoneNum);
        if PostingGroup <> '' then
            C.Validate("Customer Posting Group", PostingGroup);
        C.Modify(true);
    end;
}