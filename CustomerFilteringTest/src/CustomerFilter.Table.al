table 60150 "FlowField Test Table"
{
    fields
    {
        field(601061; "Customer No"; Code[20])
        {
            TableRelation = Customer."No.";
            ToolTip = 'Contains a customer unique number.';
        }
        field(601062; "Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No")));
            ToolTip = 'Contains a customer name.';
        }
        field(601063; "Has Invoices"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Sales Invoice Header" where("Sell-to Customer No." = field("Customer No")));
            ToolTip = 'Indicates if the customer has invoices.';
        }
        field(601064; "Invoice Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Cust. Ledger Entry"."Closed by Amount (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("Customer No")));
            ToolTip = 'Contains the total amount of all invoices.';
        }
        field(601065; "Invoice Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Cust. Ledger Entry" where("Document Type" = const(Invoice), "Customer No." = field("Customer No")));
            ToolTip = 'Contains the total number of invoices';
        }
        field(601066; "Average Invoice Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = average("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("Customer No")));
            ToolTip = 'Contains the average amount of all invoices.';
        }
        field(601067; "Max Invoice Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = max("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("Customer No")));
            ToolTip = 'Contains the maximum amount of all invoices.';
        }
        field(601068; "Min Invoice Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = min("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("Customer No")));
            ToolTip = 'Contains the minimum amount of all invoices.';
        }
        field(601509; "Last Invoice Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = max("Cust. Ledger Entry"."Posting Date" where("Document Type" = const(Invoice), "Customer No." = field("Customer No")));
            ToolTip = 'Contains the date of the last invoice.';
        }
    }
}