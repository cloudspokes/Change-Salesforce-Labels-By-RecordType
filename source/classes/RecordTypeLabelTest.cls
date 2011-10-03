@isTest
private class RecordTypeLabelTest
{
    static testmethod void RecordTypeTestPositive1()
    {
        Label_By_RecordType__c lbr=new Label_By_RecordType__c();
        lbr.Name='AccountUnique';
        lbr.New_Label__c='Phone';
        lbr.Old_Label__c='Mobile';
        lbr.Record_Type_Id__c='012U0000000TiE7';
        lbr.Object_API_Name__c='Account';
        insert lbr;
        Account acc=new Account(name='test_account__1');
        insert acc;
        string acc15digit=acc.id;
        acc15digit=acc15digit.substring(0,15);
        list<string> strlist=RecordTypeLabel.convertString('https://na12.salesforce.com/'+acc15digit);
        boolean stringFound=false;
        for(integer i=0;i<strlist.size();i++)
        {
        if(strlist[i]=='Mobile:Phone')
        stringFound=true;
        }
        system.assertEquals(stringFound,true);
    }
    static testmethod void RecordTypeTestPositive2()
    {
        Label_By_RecordType__c lbr=new Label_By_RecordType__c();
        lbr.Name='AccountUnique';
        lbr.New_Label__c='Phone';
        lbr.Old_Label__c='Mobile';
        lbr.Record_Type_Id__c='012U0000000TiE7';
        lbr.Object_API_Name__c='Account';
        insert lbr;
        Account acc=new Account(name='test_account__1');
        insert acc;
        string acc3digit=acc.id;
        acc3digit=acc3digit.substring(0,3);
        list<string> strlist=RecordTypeLabel.convertString('https://na12.salesforce.com/'+acc3digit+'?retURL=%2F001%2Fo&RecordType=012U0000000TiE7&ent=Account');
        boolean stringFound=false;
        for(integer i=0;i<strlist.size();i++)
        {
        if(strlist[i]=='Mobile:Phone')
        stringFound=true;
        }
        system.assertEquals(stringFound,true);
    }
    static testmethod void RecordTypeTestNegative()
    {
        Label_By_RecordType__c lbr=new Label_By_RecordType__c();
        lbr.Name='AccountUnique';
        lbr.New_Label__c='Phone';
        lbr.Old_Label__c='Mobile';
        lbr.Record_Type_Id__c='012U0000000TiE7';
        lbr.Object_API_Name__c='Account';
        insert lbr;
        Account acc=new Account(name='test_account__1');
        insert acc;
        string acc3digit=acc.id;
        acc3digit=acc3digit.substring(0,3);
        list<string> strlist=RecordTypeLabel.convertString('https://na12.salesforce.com/apex/SomeDummyPAge');
        boolean stringFound=false;
        for(integer i=0;i<strlist.size();i++)
        {
        if(strlist[i]=='Mobile:Phone')
        stringFound=true;
        }
        system.assertEquals(stringFound,false);
    }
}