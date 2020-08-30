import {
    LightningElement,
    api
} from 'lwc';
 
export default class Recordform extends LightningElement {
    @api recordId;
    handleSubmit(event) {
        console.log(event.detail);
    }
    handleSuccess(event) {
        console.log('Record iD' + event.detail.id);
 
    }
}