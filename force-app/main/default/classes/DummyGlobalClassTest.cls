@IsTest
private with sharing class DummyGlobalClassTest {
    @IsTest
	static void creatAccountTest() {
		new DummyGlobalClass().createAccount();
	}
}