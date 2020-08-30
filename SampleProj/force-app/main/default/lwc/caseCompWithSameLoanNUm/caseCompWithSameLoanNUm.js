import { LightningElement,api,wire,track } from 'lwc';
import fetchCaseWithSameLoanNum from '@salesforce/apex/caseLoanController.fetchCaseWithSameLoanNum';

import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Case from '@salesforce/schema/Case';
import Loan_Number__c from '@salesforce/schema/Case.Loan_Number__c';
import { refreshApex } from "@salesforce/apex";

import { NavigationMixin } from 'lightning/navigation';


const columns = [ 

    {
        label: 'Case Number',
        fieldName: 'CaseNumber',
        type: 'url',
        typeAttributes: {label: { fieldName: 'CaseNumber' }, 
        target: '_blank'},
        sortable: true
    },
	
    
    { label: 'Phone', fieldName: 'ContactPhone' }, 
    { label: 'Type123', fieldName: 'Type'  }, 
    { label: 'Loan Number', fieldName: 'Loan_Number__c' },
    { label: 'Last Modify By', fieldName: 'LastModifiedById' }
]; 



let i=0;
let nameUrl;
export default class RecordIdExample extends LightningElement {
@track data;
@track columns = columns;
@track sortBy;
@track sortDirection;
@track page = 1; //this is initialize for 1st page
@track items = []; //it contains all the records.
@track startingRecord = 1; //start record position per page
@track endingRecord = 0; //end record position per page
@track pageSize = 3; //default value we are assigning
@track totalRecountCount = 0; //total record count received from all retrieved records
@track totalPage = 0; //total number of page is needed to display all records
@track error;
@track opportunities = [];

     // retrieving the data using wire service
    @api recordId;
    @wire(fetchCaseWithSameLoanNum, {caseRecId:'$recordId' })
      cases; 
   

}