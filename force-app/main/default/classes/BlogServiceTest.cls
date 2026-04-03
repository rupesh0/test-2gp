@isTest
public with sharing class BlogServiceTest {

    
    @isTest
    static void testGetBlogs(){
        createBlogs();
        List<Blog__c> blogs = BlogService.getBlogs();

        System.assertEquals(blogs.size(), 2);
       
    }
    @isTest
    static void testGetContactWithBlogs(){
        createBlogs();
        List<Contact> cons = BlogService.getContactWithBlogs();


        System.assertEquals(cons.size(), 1);
         System.assertEquals(cons[0].blogs__r.size(), 2);
    }

    @isTest
    static void testDisplayFields(){
        BlogService s = new BlogService();
        createBlogs();
        BlogService.displayFields();
    }

    static void createBlogs(){
        ApexDummyController.createRecord();
        new DummyGlobalClass().createAccount();
        
        Contact c = new Contact(LastName = 'test');
        insert c;

        BlogService.createBlog('test1', 'Content', 'title', c.Id );
        BlogService.createBlog('test2', 'Content', 'title', c.Id );

    
    }
}