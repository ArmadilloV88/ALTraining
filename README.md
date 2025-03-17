# ALTraining
AL Training source code

Training Notes :

## What is 365 Dynamics Business Central?  

Microsoft Dynamics 365 Business Central is an **Enterprise Resource Planning (ERP)** solution designed for **small to mid-sized businesses (SMBs)**.  
It helps organizations manage:  

- **Finance** 💰  
- **Supply Chain** 📦  
- **Sales** 📊  
- **Operations** ⚙️  
- **Customer Service** 📞  

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
✔️ Lower upfront costs with a **subscription model**  
✔️ No dedicated **IT team** for server management  
✔️ Need **remote access** & scalability  
✔️ Prefer **Microsoft handling security & backups**  

### **Choose On-Premise If:**  
✔️ Require **full control** over data, security, & customization  
✔️ Have an **existing IT infrastructure** & staff  
✔️ Need **direct SQL access** & deeper integrations  
✔️ Prefer **manual updates** & self-hosted data  
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
