import { LightningElement,api,wire,track } from 'lwc';
import fetchCaseWithSameLoanNum from '@salesforce/apex/caseLoanController.fetchCaseWithSameLoanNum';

import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Case from '@salesforce/schema/Case';
import Loan_Number__c from '@salesforce/schema/Case.Loan_Number__c';
import { refreshApex } from "@salesforce/apex";

import { NavigationMixin } from 'lightning/navigation';

export default class RecordIdExample extends LightningElement {
    @api recordId;   
    @track error;    
    @track viewAllFlag = false;
    @track cases;
    @track totalRecountCount=''; 
    @track data =[]; 
    @track Newtab='';

    
    @track bears;
    @track ranger;
    @track left;
    @track top;
    @track viewVarId;
    @track parentHoverStr='';
    @track hoverCmpId;
    @track hoverCmpstr ='';
    @track hoverhoverCmpstr ='';
   

    @track openmodel = false;
    openmodal(event) {
        console.log('Current Target'+event.currentTarget.id);
        console.log('Current Targe Value'+event.currentTarget.value);
        this.viewVarId = event.currentTarget.value;
        this.openmodel = true;
    }
    closeModal() {
        this.openmodel = false;
    } 
    saveMethod() {
        alert('save method invoked');
        this.closeModal();
    }

    @wire(fetchCaseWithSameLoanNum, {caseRecId:'$recordId'})
    cases;

  connectedCallback(){
    this.Newtab="/lightning/cmp/c__auraForLWCCalling?c__recordId="+ this.recordId;
    fetchCaseWithSameLoanNum({caseRecId:this.recordId})
    .then(result =>
      {
       this.totalRecountCount ='Case With Loan No:('+ result.length+')';
      })

  }

  
  showData(event){
      this.ranger = event.currentTarget.dataset.rangerid;
      this.left = event.clientX;
      this.top=event.clientY;
  }
  hideData(event){
      this.ranger = "";
  }
  get assignClass() { 
      return this.active ? '' : 'slds-hint-parent';
}


hoverparent(event){

}


    handleMouseOver(event) {
      // this.hoverparent();
        console.log('Ranger111----->'+event.currentTarget.dataset.rangerid);
        console.log('Current Targe Value'+event.currentTarget.value);
        
        this.parentHoverStr =event.currentTarget.id;
        console.log('Current111 Targe Value hoverparent--->'+this.parentHoverStr);
        this.parentHoverId = this.parentHoverStr.substring(0, 18);
        console.log('Current111 Targe Value hoverparent--->'+this.parentHoverId);
        this.hoverCmpstr = event.currentTarget.value;
        console.log('Current Target hoverCmpstr-->'+this.hoverCmpstr);
        this.hoverCmpId = this.hoverCmpstr.substring(18, 36);
        console.log('Current Target hoverCmpId-->'+this.hoverCmpId);

        this.viewVarId = event.currentTarget.value;
        this.ranger = event.currentTarget.dataset.rangerid;
        this.left = event.clientX;
        this.top=event.clientY;

        console.log('this.viewVarId=========>'+this.viewVarId);
        console.log('this.parentHoverId=========>'+this.parentHoverId);
        
         if(this.hoverCmpId === this.parentHoverId){
            console.log('True==================>');
            this.viewAllFlag = true;
         }
           
        
       
    }

    
    handleMouseDown() {
      this.viewAllFlag = false;
  }


}