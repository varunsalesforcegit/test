@isTest
public class TestRestrictContactByName {

    @isTest
    public static void testTrigTest(){
        Contact conObj = new Contact();
        conObj.LastName = 'INVALIDNAME';
        insert conObj;
    }
}