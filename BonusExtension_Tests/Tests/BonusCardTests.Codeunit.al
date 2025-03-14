codeunit 50100 "MNB Bonus Card Tests"
{
    TestPermissions = Disabled;
    Subtype = Test;
    Permissions = TableData "MNB Bonus Header" = RMID;

    var
        //Making a variable instance of the Random library
        LibraryRandom: Codeunit "Library - Random";
        //Making a variable instance of the Utility library
        LibraryUtility: Codeunit "Library - Utility";
        //Making a variable instance of the Assert library
        Assert: Codeunit Assert;

    [Test]
    procedure CheckIfNotPossibleToChangeStartingDateInReleasedStatus()
    var
        //Making a variable instance of the Record "MNB Bonus Header"
        BonusHeader: Record "MNB Bonus Header";
        //Making a variable instance of the Label "Status cannot be Released"
        StatusCannotBeReleasedErr: Label 'Status cannot be Released';
    begin
        // [SCENARIO] Check If Not Possible To Change Starting Date In Released Status
        // [GIVEN] Bouns Header exists in status Released
        //Initialization of the Record instance
        BonusHeader.Init();
        //Setting the value of the field "No." to the value of the function "GetGlobalNoSeriesCode" from the Utility library
        BonusHeader."No." := LibraryUtility.GetGlobalNoSeriesCode();
        //Setting the value of the field "Status" to the value of the field "Released" from the Option "Status" of the Record "MNB Bonus Header"
        BonusHeader.Status := BonusHeader.Status::Released;
        //Inserting the Record instance
        BonusHeader.Insert();
        // [WHEN] Validate the Starting Date directly in the code
        //Calling the function "Validate" of the Record instance with the parameters "Starting Date" and the value of the function "RandDate" from the Random library with the parameter 10
        asserterror BonusHeader.Validate("Starting Date", LibraryRandom.RandDate(10));
        // [THEN] Error is shown that you cannot change the Starting Date in Released status 
        //Checking if the error message is shown
        Assert.ExpectedError(StatusCannotBeReleasedErr);
    end;

    [Test]
    procedure TestIfCustomerNoHaveValueBeforeRelease()
    var
        BonusHeader: Record "MNB Bonus Header";
        CustomerNoIsEmptyErr: Label 'Customer No. must have a value in Bonus: No.';
    begin
        // [SCENARIO] Test If Customer No. Have Value Before Release
        // [GIVEN] Bouns Header exists in status Open 
        BonusHeader.Init();
        BonusHeader."No." := LibraryUtility.GetGlobalNoSeriesCode();
        BonusHeader.Status := BonusHeader.Status::Open;
        BonusHeader.Insert();
        // [WHEN] Change status to Released
        asserterror BonusHeader.Validate(Status, BonusHeader.Status::Released);
        // [THEN] Error is shown that Customer No. does not have value
        Assert.ExpectedError(CustomerNoIsEmptyErr);
    end;


}