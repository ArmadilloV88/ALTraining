tableextension 60102 "NVR Item Table Extension" extends Item
{
    // purpose of this extension is to extend the Item table with additional fields
    fields
    {
        // Add changes to table fields here
        field(601021; "Last Counted"; Date)
        {
            Caption = 'Last Counted';
            DataClassification = ToBeClassified;
        }
    }
    //Next is to create a new page extension to show the new field in the Item List page
    //ItemPage.Extension.al will be created in the same folder as this file
    
    keys
    {
        // Add changes to keys here
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
}