# ALTraining
AL Training source code

Training Notes :

## What is 365 Dynamics Business Central?  

Microsoft Dynamics 365 Business Central is an **Enterprise Resource Planning (ERP)** solution designed for **small to mid-sized businesses (SMBs)**.  
It helps organizations manage:  

💰 **Finance** 💰  
📦 **Supply Chain** 📦  
📊 **Sales** 📊  
⚙️ **Operations** ⚙️  
📞 **Customer Service** 📞  

All these functions are integrated into a **centralized system**, improving efficiency and streamlining business processes.

---

## Deployment of Dynamics 365 Business Central  

- Data is stored on the **Microsoft Cloud**, removing the need for local database installations.

---

## Difference Between On-Premise and Online Deployment  

### **Online Deployment (Cloud)**  
✅ Hosted on **Microsoft Azure**  
✅ No need for a **dedicated IT infrastructure**  
✅ **Automated security updates & patches**  

### **On-Premise Deployment**  
✅ Hosted on the **client’s own servers**  
✅ Best suited for businesses with a **stable IT infrastructure**  

---

## Which One Should You Choose?  

| Feature       | Online (Cloud)               | On-Premise                        |
|--------------|-----------------------------|----------------------------------|
| **Hosting**  | Microsoft Azure              | Local Servers                     |
| **Pricing**  | Monthly Subscription         | One-Time License                  |
| **Customization** | Limited, API-based      | Full Customization                |
| **Security** | Managed by Microsoft         | Fully Controlled                  |
| **Updates**  | Automatic                    | Manual                            |
| **Access**   | Anywhere (Internet required) | Local Network (No Internet needed) |
| **Scalability** | Easy to Scale             | Requires IT Upgrades              |

### **Choose Cloud If:**  
✅ Lower upfront costs with a **subscription model**  
✅ No dedicated **IT team** for server management  
✅ Need **remote access** & scalability  
✅ Prefer **Microsoft handling security & backups**  

### **Choose On-Premise If:**  
✅ Require **full control** over data, security, & customization  
✅ Have an **existing IT infrastructure** & staff  
✅ Need **direct SQL access** & deeper integrations  
✅ Prefer **manual updates** & self-hosted data  
---
## Key Features of Setup for On-Premises Deployments

With the **Business Central Setup**, you can:

- Install different components on separate computers.
- Choose from a selection of predefined installation options, or create a custom configuration tailored to your needs.
- Preconfigure components before installation to streamline the process.
- Create, save, or load setup configuration files that capture your selected components and settings.
- Use setup to install software and create custom deployments that can be distributed to multiple users within an organization.

---

## Installation Notes

Before proceeding with the installation of **Business Central**, consider the following:

- Ensure that all previous versions of Business Central are uninstalled before installing new components.
- All components must be from the same version and build of **Business Central** to ensure proper functionality.
- If **SQL Server 2000** or **Microsoft SQL Server Desktop Engine (MSDE)** is installed on the computer, remove them before beginning the installation process. These database products can cause setup errors.

---

## Development in AL (Application Language)

**AL (Application Language)** is the primary programming language used for developing extensions, customizing business logic, and integrating **Microsoft Dynamics 365 Business Central** with other applications.

- **Object-Oriented 🛠️**: AL works with various objects like tables, pages, code units, and more.
- **Event-Driven ⚡**: Event subscribers are used to modify **Business Central** without altering the core code.
- **Cloud-Ready ☁️**: AL is designed to build extensions, rather than modifying the base application.
- **Integrated with Azure 🔗**: AL supports telemetry, API integrations, and **Power Automate**.

### Key AL Objects

| Object Type  | Purpose                                               |
|--------------|-------------------------------------------------------|
| **Table**    | Stores data in the database.                          |
| **Page**     | Represents UI elements like lists, cards, and role centers. |
| **Code Unit**| Contains business logic (similar to C# classes).      |
| **Report**   | Generates printed reports or PDFs.                    |
| **Query**    | Fetches and filters data from multiple tables.        |
| **Enum**     | Defines a set of fixed values (e.g., Status: Open, Closed). |
| **Interface**| Defines common methods for different objects.         |
| **XMLPort**  | Imports or exports data in XML format.                |

### AL Object Breakdown

- **Table Objects**: Define the schema for tables that hold your data.
- **Page Objects**: Represent the pages and interfaces seen by users.
- **Code Units**: Contain the business logic and behavior of the application.
- **Report Objects**: Define the layout and data used to generate reports.
---
## Code Analytics Used

Several code analyzers help ensure the quality and adherence to best practices in your **AL** code:

- **CodeCop**: Provides a set of guidelines (mostly as warnings) related to the code, such as unused variables. It is highly recommended to always enable this set.
  
- **AppSourceCop**: Offers guidelines (mostly as errors) related to your extension if it were to be published on **AppSource** for general download by any company using **Business Central**.

- **UICop**: Focuses on guidelines for the user interface, ensuring consistency and usability.

- **PerTenantExtensionCop**: Provides guidelines for extensions developed for a particular customer, ensuring the extension is tailored to their needs.

---

## File Naming Convention

Follow the naming convention to keep your project files organized and consistent:

| Type of the Object     | Object Type in File Name |
|------------------------|--------------------------|
| **Table**              | Table                    |
| **Table Extension**    | TableExt                 |
| **Page**               | Page                     |
| **Page Extension**     | PageExt                  |
| **Codeunit**           | Codeunit                 |
| **Report**             | Report                   |
| **Report Extension**   | ReportExt                |
| **Enum**               | Enum                     |
| **Enum Extension**     | EnumExt                  |
| **Permission Set**     | PermissionSet            |

**Format**: `<Object Name Excluding Prefix>.<Object Type>.al`

---

## Affixes and Suffixes

An affix or suffix should contain at least 3 characters to ensure unique code signatures within **AppSource**. For example:

{
  "mandatoryAffixes": ["NAV"]
}

This ensures that there are unique code signatures in the Microsoft AppSource as it is mandatory that there must be no conflicts between apps, pages, or even tables.
---

## Project Folder Structure

There are no mandatory practices or strict rules to follow when structuring your project folders. However, it's good practice to keep them organized and neat to ensure effective finding of certain files within a project:

- **src**: Known as the source folder, which contains all files related to the functionality of the extension.
- **res**: Known as the resources folder, which contains the logo of the extension or any other externally used resource files.

---

## AL Object Range

- Each (or most) objects in the database must have a unique ID number. While a table and a page can share the same ID, all other objects must have distinct IDs.
  
- The object range is controlled in the `app.json` file in the `idRanges` section.

- The available ID range is from **50000 - 99999**.

- **AppSource** range starts from **70 million**.

---

# AL (Application Language) Syntax

## ttable - Table Object Structure

Defines a database table in Business Central. Tables store data records.

### It contains the following:
- ✅ Table properties  
- ✅ Set of fields  
- ✅ Keys  
- ✅ Global variables  
- ✅ Table triggers  

> **Note:** Each table must have a unique number that obeys the object ID range.

---

## The table has 4 main properties consisting of:

- **DataClassification** - Responsible for the classification of the table in terms of GDPR.

- **Caption** - Caption of the table which should not contain the prefix or suffix.

- **DrillDownPageId** - The name of the page shown when the user uses the DrillDown function on the page.

- **LookupPageId** - The name of the page shown when the user uses the Lookup function on the page.

---

## Table Triggers

Allows you to add code directly to the table. There are 4 main triggers:

- **OnInsert()** - Used for inserting data into the table.
- **OnModify()** - Used to modify existing data and save it to the table.
- **OnDelete()** - Used to remove/delete a record/data from the table.
- **OnRename()** - Used when changing primary key attributes in the table.

---

## Table Fields

- **Editable** - Determines if a field is editable or not.

- **Code** - An alphanumeric field used mostly for storing unique values, automatically converts to uppercase. Using the `NotBlank` property forces input.

- **Text** - String-based attribute used to store descriptions or addresses, typically with a length of 100 to 2048 characters. Using the `TableRelation` property allows lookup of values outside the current table.

- **Date** - Attribute used to store date-like formats.

- **Integer** - Numerical field that stores whole numbers.  
  - Using the `BlankZero` property will show an empty value instead of zero.  
  - You can also use `MinValue` and `MaxValue` properties to set ranges.

- **Decimal** - Numerical field that stores decimal numbers.  
  - Using the `DecimalPlaces` property will set the minimum and maximum number of decimal places.

- **Enum** - Shows a list of options defined in a separate object. Ensure you specify which Enum you would like to use.

---

## Field Triggers

- **OnLookup()** - Allows you to add code when a user clicks on the page lookup function.
- **OnValidate()** - This triggers when a user inputs a value in the field.

---

## Flow Fields

- These are a special class of fields that can be set with the `FieldClass` property, allowing mathematical operations such as `Count`, `Sum`, `Max`, `Min`. They also allow you to:
  - Show values from a different table
  - Check if a record exists (similar to a Boolean return)

- Use the `CalcFormula` property to specify what the FlowField should display.

> **Note:** These fields must always have the `Editable = false` property set.

---

## Table Keys

- Each table must have at least **one primary key** defined, but you can define more if needed.  
  (Make sure to include **'PK'** in the name, e.g., `PK_Customer_ID`)

- Use the `Get()` method to retrieve specific data.

---

## Permission Sets

- Special object type that defines which permissions are included in the set.
- `Assignable` property specifies whether the permission set can be assigned directly to users.
- Controls whether users can **read**, **write**, **edit**, or **delete** the object.

---

## Table Example

```al
table 50100 MyTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer) { PrimaryKey = true; }
        field(2; Name; Text[50]) { }
        field(3; CreatedAt; DateTime) { }
    }
}
```
---

## Enums

- Enums are an object type that allows specifying static options.
- To extend an Enum, you must use the `Extensible = true` property.
- Each Enum value has a **number** and **name**, which should each have an assigned **caption**.
- Enum values start from `0`.
- If you want an empty Enum value, name it and set `Caption = ' '` (include the space).
- Remember to add an affix to the Enum.

---

## Page Overview

Pages allow users to interact with data by inserting, modifying, deleting data, and running custom actions.

### Pages contain:
- ✅ Page properties  
- ✅ Set of controls  
- ✅ Set of actions  
- ✅ Global variables  
- ✅ Page triggers  

### Business Central contains different types of pages:

- **List Page**:  
  Used when more than one record needs to be shown on the page. They are non-editable by default and commonly used in purchase orders, customers, vendors, and employees.  
  (Directories are editable though.)

- **Card Page**:  
  Used when only one record needs to be shown. Commonly used for master data like a single customer, single record, item, or vendor.  
  These are typically editable but do not allow new inserts or deletions. They are accessible from menus or the "Tell Me" functionality.

- **Document Page**:  
  Used when both a header and lines are needed (e.g., orders, invoices, posted invoices).  
  Typically created using two separate pages:
  - One for the **header** (main table).
  - One for the **lines** (via `ListPart` added as a document part).

---

## Page Properties

Each page has its own set of properties, many of which are shared across all page types, but some are specific to certain types.

- **PageType**: Defines the type of page.
- **Caption**: Caption for the page (no prefix/suffix).
- **SourceTable**: Indicates which table’s data is presented on the page (only one table allowed).
- **UsageCategory**: Mandatory if the page should be visible from "Tell Me" functionality.
- **ApplicationArea**: Defines which areas of the system the page is visible in (used with `UsageCategory`).
- **Editable**: Specifies if the page is editable. Defaults to `true`.
- **DeleteAllowed**, **InsertAllowed**, **ModifyAllowed**: Control whether delete, insert, or modify actions are allowed. Defaults to `true`.
- **CardPageId**: Only for list pages. Specifies which page will open as a card page for the list.

---

## Page Triggers

Like tables, Pages also have triggers, but not all are commonly used.  
You can add code to these triggers to execute when the trigger is fired.

- **OnOpenPage()**: Runs when the page is opened.
- **OnAfterGetCurrRecord()**: Retrieves the current record from the database.

> 💡 It’s uncommon to put insert/modify/delete logic directly in the page triggers—better to handle that in the table layer.

---

## Page Controls

Controls are placed in one of two areas: **Content** or **FactBox**.

- In the **Content Area**, you place fields that are shown on the page:
  - These fields are grouped using:
    - **FastTabs** (for Card and Document pages)
    - **Repeater** (for List pages)

- You can't precisely control field placement on the screen—only in which **group** and **order** they appear.

- If a caption is defined on the respective table, it will be shown automatically on the pages.

> ⚠️ **Best practice:** Place triggers like `OnValidate()` and `OnLookup()` inside the **table**, not the **page**.

### Key Control Properties:
- **ApplicationArea**: Specifies in which part of the system the control should appear.
- **ToolTip**: Provides users with basic help text for a field.

### Additional Notes:
- You can add **part controls** to link two pages (e.g., via Document No./ID).
- **FactBoxes**:  
  - You can't adjust FactBox width or size.
  - FactBoxes can show in Details or Attachments sections automatically.
  - You can add **multiple FactBoxes** to a single page.

---

## Page Actions

You can code special actions to perform operations such as opening a new page, running a report, or executing code when an action button is clicked.

### Common Action Properties:

- **ApplicationArea**: Mandatory; defines where the action will be available.
- **Caption**: Specifies the label for the action.
- **Image**: Specifies the icon/image for the action.
- **Promoted**: Sets whether this action appears on the home page.
  - Use `PromotedOnly = true` if you want it to only appear on the home page.
  - `PromotedCategory`: Groups the promoted action into a category.
- **RunObject**: Defines an object (Page/Enum/etc.) to run when the action is selected.
  - If `RunObject` is used, **do not** add code to `OnAction()`.
  - Use `RunPageLink` to link a page to the object.
- **ToolTip**: Mandatory if publishing to AppSource. Gives users a quick description of what the action does.

---

## Table Extension Overview

A **Table Extension** allows you to modify a standard table. It can include:

- ✅ Properties  
- ✅ Fields  
- ✅ Keys  
- ✅ Global variables  
- ✅ Table extension triggers  

### Table Extension Properties:
- Use `Ctrl + Space` to view available properties for the standard table.

### Table Extension Fields:
- Add fields to expand the existing table.
- You can use:
  - `OnBeforeValidate()`: Trigger code before standard validation.
  - `OnAfterValidate()`: Trigger code after standard validation.
- Make sure:
  - Each new field has a correct **ID/Number** according to your `app.json` range.
  - Include the appropriate **affix**.
- ⚠️ Some standard tables mirror data to other tables—ensure you also update related tables accordingly.

### Table Extension Keys:
- You can add new keys, but **cannot** mix standard fields with custom fields in keys.

### Table Extension Triggers:
- Standard code cannot be modified, but you can add logic before or after using:
  - `OnBeforeDelete()`
  - `OnAfterDelete()`
  - and similar triggers.

---

## Page Extension Overview

A **Page Extension** allows you to modify a standard page. It can include:

- ✅ Properties  
- ✅ Controls  
- ✅ Actions  
- ✅ Global variables  
- ✅ Page extension triggers  

### Page Extension Properties:
- Use `Ctrl + Space` to view available properties for the standard page.

---

## Page Extension Controls

- You can add new fields created via **table extensions** or use existing standard fields.
- Adding controls works similarly to standard pages, but you must specify **where** the control should be added.
- Only certain properties of existing controls can be changed.
- All new controls **must have the affix**.

---

## Page Extension Actions

- Like controls, you can modify existing actions or create new ones.
- Actions can be triggered **before** or **after** the standard code execution.

---

## Page Extension Triggers

- You **cannot** modify standard page triggers directly.
- However, you can add code to run **before** or **after** the standard trigger logic.

---

## Flow Fields – A Special Class of Fields

- FlowFields are a special type of field set using the **FieldClass** property.
- ⚠️ **DataClassification** cannot be set for FlowFields.
- They allow simple calculations like **sum**, **count**, **min**, **max**, etc.
- Can use **lookup** to display data from other tables or check if a record exists.
- Use the **CalcFormula** property to define what the FlowField will show.
- Always set **Editable = false** for FlowFields.

---

## Procedures

A **procedure** is like a function – it holds reusable blocks of code to make your AL code more modular, readable, and easier to maintain.

### Types of Procedures:

- **Global**: Can be called from any extension and object.
- **Local**: Can only be called within the same object.
- **Internal**: Can be called from any object, but **not** from different extensions.

---

## Procedure Syntax

```al
<Access Modifier> procedure <procedure name>()
begin

end;
```

```al
local procedure MyLocalProcedure()
begin

end;
```

```al
procedure MyGlobalProcedure()
begin

end;
```

```al
procedure MyInternalProcedure()
begin

end;
```

- A procedure can also have **parameters**.

```al
local procedure MyLocalProcedure(Customer: Record Customer)
begin

end;
```

```al
procedure MyGlobalProcedure(Customer: Record Customer; var SalesHeader: Record "Sales Header")
begin

end;
```

- **Overloading** is possible, meaning you can have the same procedure name but with **different** **parameters**.
- Procedures can also **return a value**

```al
local procedure MyLocalProcedure(): Integer
begin
    exit(10);
end;
```

- This returns an integer of value 10.

--- 
## Variables

In AL, variables help store data that you can use later in your code. They come with **access modifiers** which determine their scope:

### Types of Variable Scopes:
- **Global**:  
  Declared at the object level and accessible throughout the entire object.
- **Local**:  
  Declared inside a procedure or trigger and only available during that procedure or trigger’s execution.

---

### Common Variable Types:

| **Type**  | **Purpose**                                                 |
|-----------|--------------------------------------------------------------|
| **Label** | Stores static text like questions, prompts, or messages.     |
| **Record**| Used to retrieve or manipulate data from database tables.    |
| **Page**  | Used to open and interact with specific pages.               |
| **Report**| Used to open and interact with reports.                      |

---

### Declaring Variables:

- Always include the scope (global or local) when declaring a variable.
- **Global variables** go under the object’s main `var` section.
- **Local variables** go inside the procedure’s `var` block.

```al
// Global variables example
var
    SalesHeader: Record "Sales Header";
    NoOfCustomers, NoOfSalesOrders: Integer;
```

```al
local procedure MyLocalProcedure()
var
    Customer: Record Customer; // Local variable
begin
end;
```

---

### Assigning Variables:

- Use the `:=` to assign a variable a value.

```al
local procedure MyLocalProcedure()
var
    NoOfCustomers: Integer;
begin
    NoOfCustomers := 1;
end;
```

---

### Best Practices:

- Keep **All global Variables** grouped together in one place. Avoid spreading multiple var sections around.

- When variables are of same type, you can declare them on the same line to keep the code clean.

```al
var
    TotalOrders, TotalInvoices: Integer;
```
---

## Rec - Special Variable on Page and Tables

- The `Rec` keyword is a special variable used to reference the current record in both **Page** and **Table** objects.
- You can access specific fields/attributes of a record using `Rec.` followed by the field name.

### Example:
```al
local procedure MyLocalProcedure()
begin
    if Rec."No." = '10000' then begin
        // Your code here
    end;
end;
```

---

## 🧠 If...Else Statement (Control Flow)

The `if...else` statement allows you to execute code based on conditions.

---

### 🔵 **Basic `if...else`**

```al
if Amount > 1000 then
    Message('💰 Amount is greater than 1000')
else
    Message('💸 Amount is 1000 or less');
```

### 🔵 **Basic `Begin...end`**

```al
if Amount > 1000 then
begin
    Message('✅ Amount is high');
    Discount := 10; // 🎯 Apply a 10% discount
end
else
begin
    Message('⚠️ Amount is low');
    Discount := 5;  // 🎯 Apply a 5% discount
end;
```

---

### 🔵 **Using elseif for multiple selections**

```al
if Amount > 5000 then
    Message('🔥 Amount is greater than 5000')
elseif Amount > 1000 then
    Message('📊 Amount is between 1001 and 5000')
else
    Message('💼 Amount is 1000 or less');
```

---

## 📝 Pro Tips

- ✅ **`else` is optional**:
  
  When there's only a single line of code to run for the `if` condition, you can skip the `else` part if not needed.

  ```al
  if Amount > 1000 then
      Message('✔️ Condition met');
  ```
- ✅ **negate conditions with `not`**:

