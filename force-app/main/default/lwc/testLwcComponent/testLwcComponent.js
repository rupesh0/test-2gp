import { LightningElement } from 'lwc';
import createRecord from '@salesforce/apex/ApexDummyController.createRecord';

export default class TestLwcComponent extends LightningElement {
    handleCancel() {
	}

	async handleConfirm() {
		await createRecord();
	}
}