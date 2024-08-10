
// Global class can't be deleted once packaged.
global with sharing class DummyGlobalClass {
    global DummyGlobalClass() {

    }

    // Global class method name and type can't be modified and removed
    global Account createAccount(){
        Account acc = new Account(Name='TestAccount');
        insert acc;
        return acc;
    }
}