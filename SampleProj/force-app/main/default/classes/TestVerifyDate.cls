@isTest
public class TestVerifyDate {
    @isTest
    public static void dateMethodTest1(){
        Date date1 = date.today();
        Date date2 = date.today().addDays(2);
         Date date3 = date.today().addDays(32);
        VerifyDate.CheckDates(date1,date2);
         VerifyDate.CheckDates(date1,date3);
        //System.assertEquals(true,testDate);
    }

}