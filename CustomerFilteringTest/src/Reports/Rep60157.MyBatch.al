report 60157 "My Batch"
{
    ProcessingOnly = true;
    Caption = 'My Batch';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {

        dataitem(Customer; Customer)
        {
            RequestFilterFields = "Customer Posting Group", "Customer Price Group","Customer Disc. Group";
            trigger OnAfterGetRecord()
            begin
                //Customer.Name += 'Test';
                //Customer.Modify(true);
            end;
            trigger OnPreDataItem()
            var
                Fancy : Codeunit FancyCo;
            begin
                Fancy.FancyFunction(Customer);

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                field(Test;Test)
                {
                    ApplicationArea = All;
                    Caption = 'Test Thing';
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        Test : Text;
}