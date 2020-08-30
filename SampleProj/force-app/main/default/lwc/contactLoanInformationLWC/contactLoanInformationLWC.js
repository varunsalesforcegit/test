import { LightningElement,api,wire,track } from 'lwc';
import fetchCaseWithSameLoanNum from '@salesforce/apex/caseLoanController.fetchCaseWithSameLoanNum';

import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Case from '@salesforce/schema/Case';
import Loan_Number__c from '@salesforce/schema/Case.Loan_Number__c';
import { refreshApex } from "@salesforce/apex";

import { NavigationMixin } from 'lightning/navigation';

const fields = [
    'Case.CaseNumber',
    'Case.ContactPhone',
    'Case.Type',
];


export default class RecordIdExample extends LightningElement {
    @track data;
    @api recordId;
    @track typeValue;
    @track CaseNumberValue;
    @track ContactPhone;

    @wire(fetchCaseWithSameLoanNum, {caseRecId:'$recordId' })
    cases(result) {
        console.log('I am here result',result);
        if (result.data) {
            this.data = result.data;
               
         }

        
        

       
         
    }

   

   

}