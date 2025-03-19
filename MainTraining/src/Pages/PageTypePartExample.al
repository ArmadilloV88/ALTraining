page 60176 "Page Type Part Example"
{
    PageType = CardPart;
    SourceTable = Customer;
    layout{
        area(Content)
        {
            group(Customer){
                Caption = 'Customer Details';
                field(Name;Rec.Name){
                ApplicationArea = All;
                ToolTip = 'Shows customer name';
            }
            field(Contact;Rec.Contact){
                ApplicationArea = All;
                ToolTip = 'Shows customer contact';
            }
            field(Address;Rec.Address){
                ApplicationArea = All;
                ToolTip = 'Shows customer address';
            }
            field(City;Rec.City){
                ApplicationArea = All;
                ToolTip = 'Shows customer address';
            }
            }
        }
    }
}