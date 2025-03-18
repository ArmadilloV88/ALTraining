codeunit 60151 "Customer Finder"
{
    procedure FindTest()
    var
        Customer: Record Customer;
    begin
        Customer.SetFilter(Name, 'Test');
        //
        //Filter the table by the Name field
        //This is recommended to use when you want to filter the table by a specific field
        //This helps in mitigating the risk of filtering the table by the wrong field
        //This also helps in speeding up the process of filtering the table thus using less system recources
        //
        Customer.SetCurrentKey(Name);
        //
        //Set the current key to the Name field
        //This is reccomeneded to use to help pinpoint an exact record you wish to access
        //
        if Customer.FindSet() then
        //
        //Find parameter + means the last record
        //Find Parameter - means the first record
        //Find Parameter = means the exact record (Same as the Get method where a primary key is used)
        //Find Parameter < means the previous record
        //Find Parameter > means the next record
        //Find Parameter <> means not equal
        //Find Parameter >= means the next or equal record
        //Find Parameter <= means the previous or equal record
        //Find Parameter ~ means the current record
        //
        repeat
        //
        // logic for itteration loop
        //
        until Customer.Next(1) = 0;
        //
        //Uses the n+1 formula itteration through the table records
        //The (1) means that the table itterates every next record
        //if you set it to (2) it will skip every other record and only itterate through every second record
        //
    end;
}