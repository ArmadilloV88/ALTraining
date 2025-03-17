pageextension 60155 "JSON" extends "Sales Order"
{
    // This page extension adds a custom action button to the Sales Order page.
    actions {
        addfirst(processing) {
            action(ShowJson) {
                // Button caption shown in UI
                Caption = 'Show JSON'; // The label text that appears on the button

                Promoted = true; // Makes the action appear on the page ribbon (toolbar) so users can access it quickly without digging through menus

                PromotedCategory = Process; // Places the button inside the "Process" section of the ribbon, grouping it with other process-related actions

                PromotedIsBig = true; // Displays the button as a large icon (big button), making it more prominent and easier to notice

                PromotedOnly = true; // Ensures the action only appears on the ribbon and not inside dropdown menus (keeps UI clean)

                ApplicationArea = All; // Makes the action available in all parts of the application (Sales, Purchase, Finance, etc.)

                Image = Document; // Sets the icon to a document symbol
                
                trigger OnAction()
                var
                    // JSON object to represent key-value pairs (acts like a dictionary/map)
                    obj : JsonObject;
                    // Used to represent individual items that will be added to an array
                    item : JsonObject; 
                    // Temporary JSON object used when iterating through JSON array
                    O2 : JsonObject; 
                    // JSON tokens are used to extract elements (can be objects, arrays, or values)
                    Token : JsonToken;
                    T2 : JsonToken;
                    T3 : JsonToken;
                    // JSON array to hold multiple items (works like a list/array)
                    ja : JsonArray; 
                    // Text variable to hold the JSON as a string for display
                    txt : Text; 
                    // JSON value used to handle primitive data types like numbers
                    V : JsonValue; 
                begin
                    // Add simple key-value pairs to the main JSON object
                    obj.Add('field','Video');
                    
                    // Adding a decimal value to JSON with a specific key
                    V.SetValue(123.456);
                    obj.Add('Price', V);

                    // Adding another simple key-value pair
                    obj.Add('Version :','0.2.0');

                    // Creating JSON objects to simulate items and adding them to a JSON array
                    item.Add('No',20250317D); // Date field as integer (for demo purposes)
                    ja.Add(item); // Add item to JSON array
                    
                    clear(item); // Clear item to reuse it
                    item.Add('No',20250318D); // Add a new "No" value to item
                    ja.Add(item); // Add second item to array
                    
                    // Adding additional integers directly into the array
                    ja.Add(100);
                    ja.Add(200);
                    
                    // Add the entire array to the main JSON object under the key "Items"
                    obj.Add('Items',ja);

                    // Write the JSON object to a text variable so it can be shown as a string
                    obj.WriteTo(txt);

                    // Check if the JSON object contains the "Items" array
                    if obj.Contains('Items') then begin
                        obj.Get('Items',Token); // Get the "Items" array as a token

                        // Loop through each element in the "Items" array
                        foreach T2 in Token.AsArray() do begin
                            // Check if the current element is an object
                            if T2.IsObject() then begin
                                O2 := T2.AsObject(); // Cast token to object
                                O2.Get('No',T3); // Get the "No" field inside the object
                                
                                if T3.IsValue() then
                                    V := T3.AsValue(); // Cast to JSON value

                                // Display a message showing the "No" value + 5 days (date calculation)
                                Message('Value as Code %1',CalcDate('+5D', V.AsDate()));
                            end;
                        end;
                    end;

                    // Finally, show the entire JSON structure as a message pop-up
                    Message(txt);
                end;
            }
        }
    }
}