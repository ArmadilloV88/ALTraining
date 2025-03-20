permissionset 60164 "Training Permissions"
{
    Assignable = true;
    //IncludedPermissionSets = SomePermissionSet;
    Permissions = 
        tabledata "Customer Blob Storage Table" = RMID,
        tabledata "Excel Test" = RMID,
        tabledata "RegEx Pattern" = RMID,
        tabledata "Number Series Table" = RMID,
        tabledata "FlowField Test Table" = RMID;
}