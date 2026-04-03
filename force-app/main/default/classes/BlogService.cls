global with sharing class BlogService {
    global BlogService() {

    }

    global static List<Blog__c> getBlogs() {
        String query = 'SELECT Id, Name, Content__c, Title__c, Author__c FROM Blog__c';
        System.debug(query);
        return Database.query(query);
    }

    global static List<Contact> getContactWithBlogs() {
        String query = 'SELECT Id, Name, (SELECT Id, Name, Content__c, Title__c, Author__c FROM Blogs__r) FROM Contact';
        System.debug(query);
        return Database.query(query);
    }

    global static void displayFields() {
        String query = 'SELECT Id, Name, Content__c, Title__c, Author__c FROM Blog__c';
        System.debug(query);
        List<Blog__c> blogs = Database.query(query);
        for (Blog__c blog : blogs) {
            System.debug('Blog ID: ' + blog.get('Id'));
            System.debug('Blog Name: ' + blog.get('Name'));
            System.debug('Blog Content: ' + blog.get('Content__c'));
            System.debug('Blog Title: ' + blog.get('Title__c'));
            System.debug('Blog Author: ' + blog.get('Author__c'));
        }
    } 

    global static void createBlog(String name, String content, String title, String author) {
        Blog__c newBlog = new Blog__c();
    //    newBlog.put('Name', name);
        newBlog.put('Content__c', content);
        newBlog.put('Title__c', title);
        newBlog.put('Author__c', author);
        insert newBlog;
    } 
}