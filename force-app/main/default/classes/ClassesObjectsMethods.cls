/**
 * The ClassesObjectsMethods class serves as an exploration into Object Oriented Programming in Apex.
 * It covers fundamental aspects such as class instantiation, method creation, encapsulation, and object interaction.
 *
 * This class introduces developers to the concept of creating and manipulating objects in Apex. It discusses
 * how to define classes, create methods, and use objects. This class uses two example classes - Person and Book.
 * 
 * Topics covered in this class include:
 * - Understanding how to define a class in Apex.
 * - Understanding how to create methods in Apex.
 * - Understanding how to instantiate objects of a class.
 * - Understanding encapsulation and the importance of getter and setter methods.
 *
 * Users of this class can expect to gain a strong understanding of Object Oriented Programming in Apex and
 * be prepared for more advanced topics in Salesforce development.
 * 
 * The Person class is a simple representation of a person with properties like name and age, and a method
 * that allows the person to introduce themselves.
 * 
 * The Book class is a simple representation of a book with properties like title and author, and methods
 * to read and close the book.
 * 
 * Resources:
 * String class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_string.htm
 * Date class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_date.htm
 * Math class: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_math.htm
 * Classes: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_understanding.htm
 *
 * @author Your Name
 */

public with sharing class ClassesObjectsMethods {
    
    /**
     * Question 1
     * It initializes a String to "Hello, Salesforce!" and demonstrates usage of
     * the length, substring, and toLowerCase methods of the String class.
     * Example: practiceStringMethods() should return a list like ["17", "Hello", "hello, salesforce!"].
     * @return A list containing the length of the string, a substring of the string, and the string in lower case.
     */
    public static List<String> practiceStringMethods() {
        // Initialize a String with 'Hello, Salesforce!'
       List<String> result = new List<String>();
        String text = 'Hello, Salesforce!';
        // Get the length of the String    
        Integer length = text.length();
        result.add(length.toString());
        System.debug(result);    
        // Get a substring of the String of the first 5 characters
        String substr = text.substring(0,5);
        result.add(substr);
        System.debug(result);
        // Convert the String to lower case
        String lower = text.toLowerCase();
        result.add(lower);    
        // Return the list with the string data
        // In the first position add the string length
        // In the second position add the substring
        // In the third position add the string in lower case
        return result; // Replace null with the variable you used to store the result
    }

    /**
     * Question 2
     * Check if the input string starts with 'Sales', ends with 'Force', and contains 'Awesome'.
     * Example: checkStringContent('Salesforce is Awesome!') should return a list like [true, false, true].
     * @param input The input string.
     * @return A list of boolean values indicating whether the string starts with 'Sales', ends with 'Force', or contains 'Awesome'.
     */
    public static List<Boolean> checkStringContent(String input) {
        // Initialize a list to store the results
        List<Boolean> results = new List<Boolean>();        
        // Check if the string starts with 'Sales'
        Boolean startSales = input.startsWith('Sales');
        results.add(startSales);
        // Check if the string ends with 'Force'
        Boolean endsForce = input.endsWith('Force');
        results.add(endsForce);
        // Check if the string contains 'Awesome'
        Boolean containsAwesome = input.contains('Awesome');
        results.add(containsAwesome);
        return results; // Replace null with the variable you used to store the result
    }

    /**
     * Question 3
     * Take a sentence then remove any duplicate words, and return the sentence with only unique words.
     * Example: removeDuplicateWords('Hello Hello Salesforce Salesforce') should return 'Hello Salesforce'.
     * @param sentence The input sentence.
     * @return A string consisting of only unique words from the input sentence.
     */
    public static String removeDuplicateWords(String sentence) {
        // Split the sentence into words
        List<String> wordList = sentence.split(' ');
        System.debug(wordList);
        Set<String> wordSet = new Set<String>();// Create a set to store the unique words
        String finalSentence = '';
        for(String words : wordList){ // Add each word to the set
            if(wordSet.contains(words)){
                continue;
            }
            wordSet.add(words);
            System.debug(wordSet);
        }
        // Join the unique words back into a sentence
        for(String setWords : wordSet){
            finalSentence = finalSentence + setWords + ' ';
        }
        //Trim finalSentence to remove extra space
        finalSentence = finalSentence.trim();
        System.debug(finalSentence);
        // Return the sentence with unique words
        return finalSentence; // Replace null with the variable you used to store the result
    }

    /**
     * Question 4
     * This method takes a string as a parameter, and calculates the number of vowels in the string.
     * For simplicity, we will consider only five vowels: 'a', 'e', 'i', 'o', 'u', and we will ignore case.
     * Example: countVowels("Hello World!") should return 3
     * @param s The string in which to count vowels.
     * @return The number of vowels in the string.
     */
    public static Integer countVowels(String str) {
        // Initialize the result Integer
        Integer v = 0;
        Set<String> vowelList = new Set<String>();
        vowelList.add('a');
        vowelList.add('e');
        vowelList.add('i');
        vowelList.add('o');
        vowelList.add('u');
        System.debug(vowelList);
        String newstr = str.toLowerCase();
        for(Integer i = 0; i < newstr.length(); i++){
            String c = newstr.substring(i, i + 1); // get individual characters from the string - hint use substring or split
            System.debug(c);
            if(vowelList.contains(c)){ // check if the character is a vowel
                v++;  // if it is a vowel, increment the result Integer
                System.debug(v);
            }
        }
        return v; // Replace null with the variable you used to store the result
    }

    /**
     * Question 5
     * Given a list of scientist names, combine their names together with a comma if it contains the letter 'g'.
     * The final string should not end with a comma.
     * Example: findTheScientist() should return "Alan Turing,Grace Hopper,Guido van Rossum,Stephen Hawking"
     * @return A string containing the names of scientists that contain the letter 'g'.
     */
    public static String findTheScientist() {
        // The list of scientists' names
        List<String> scientistNames = new List<String>{'Tim Berners-Lee', 'Alan Turing', 'Grace Hopper', 'Donald Knuth', 'Guido van Rossum', 'Ken Thompson', 'Stephen Hawking'};

        // The variable to store the concatenated string
        String finalString = '';
        // Loop through the list of scientists' names
        for(String names : scientistNames){
            if(names.contains('g') || names.contains('G')){  // If the name doesn't contain the letter 'G', skip this iteration
                System.debug(names);
                finalString += names +',';
            }
            System.debug(finalString);
        }
          // Remove the last comma from the result string  
        finalstring = finalString.removeEnd(',');
        System.debug(finalString);          
        return finalString; // Replace null with the variable you used to store the result
    }

    /**
     * Question 6
     * This method calculates the absolute value of the difference between of two input numbers that are raised to the 2nd power.
     * Example: calculateDifferenceOfSquares(3, 4) should return 7.
     * @param a The first number.
     * @param b The second number.
     * @return The absolute value of the difference
     */
    public static Double calculateDifferenceOfSquares(Double a, Double b) {
        // Square the input numbers using the Math.pow() function
        Double asquare = Math.pow(a,2);
        Double bsquare = Math.pow(b,2);

        // Calculate the absolute difference using Math.abs() function
        Double result = Math.abs(asquare) - Math.abs(bsquare);
        // Return the result
        return result; // Replace null with the variable you used to store the result
    }

    /**
     * Question 7
     * Generate a random number between 50 and 100
     * Example: generateRandomNumber() should return a number like 75.
     * @return A integer between 50 and 100.
     */
    public static Integer generateRandomNumber() {
        // Use Math class to generate number between 50 and 100
        final Integer MIN = 50;
        final Integer MAX = 100;

        Integer result = MIN + (Integer)Math.floor(Math.random() * (MAX - MIN + 1));
        System.debug(result);

        // Return the random integer
        return result; // Replace null with the variable you used to store the result
    }

    /**
     * Question 8
     * Format the current date in the current user locale format.
     * Example: getCurrentDate() should return a string like "3/21/2001" for US locale users. Locale/String may differ depending on your location.
     * @return The current date in the current user locale format.
     */
    public static String getCurrentDate() {
        // Get the todays date
        Date today = Date.today();

        // Format the current date
        String result = today.format();
        // Return the result
        return result; // Replace null with the variable you used to store the result
    }

    /**
     * Question 9
     * Given a date time return the day of the week in number format
     * @param dt the current date and time
     * @return The number of the day of the week for the given date.
     */
    public static String getDayOfWeek(DateTime dt) {
        // Define a map of day of the week as a key and day number as the value
        // Monday = 1, Tuesday = 2, etc.
        String day = '';
        Map<String,String> weekMap = new Map<String,String>();
        weekMap.put('Monday', '1');
        weekMap.put('Tuesday', '2');
        weekMap.put('Wednesday', '3');
        weekMap.put('Thursday', '4');
        weekMap.put('Friday', '5');
        weekMap.put('Saturday', '6');
        weekMap.put('Sunday', '7');

        // Get the day name using .format('EEEE');
       day = dt.format('EEEE');
       System.debug(day);

        // Get the day number from the map using the day name
        day = weekMap.get(day);
        System.debug(day);
        // Return the result as a string
        return day; // Replace null with the variable you used to store the result
    }


    /**
     * Question 10
     * Calculate the difference between the years of two dates
     * For example, if the first date is 2023-01-01 and the second date is 2025-12-31, the method should return 2
     * If either of the dates is null, return null.
     * @param d1 The first date.
     * @param d2 The second date.
     * @return The a positive number years between the two dates, or null if either date is null.
     */
    public static Integer calculateYearDifference(Date d1, Date d2) {
        Integer difference = 0;
        if(d1 == null || d2 == null){
            return null;
        }
         // Subtract the difference in years

        difference = d2.year() - d1.year();

        return difference; // Replace null with the variable you used to store the result
    }

    /**
     * Question 11
     * The Book class represents a book in a library. 
     * Each Book object has a title and an author, and methods to return these details.
     * This class can be used in the context of a library management system, bookstore, etc.
     * where you need to manipulate and manage book information.
     */
    public class Book {
        // Declare three public instance variables - title, author, pages
        // title
       public String title;
        // author
       public String author;
        // pages
       public Integer pages;
    
        // Book constructor to initialize the title and author
        public Book(String title, String author) {
            // Initialize the title and author
            this.title = title;
            this.author = author;
        }
    
        // Method that returns the details of the book
        public String getBookDetails() {

            // return A string containing the details of the book in the format "Title: <title>, Author: <author>"
            String bookDetails = 'Title: ' + title + ', ' + 'Author: ' + author;
            return bookDetails; // Replace null with the variable you used to store the result
        }
    }
    

    /**
     * Question 12
     * Create a Book object and returns the details of the book.
     * For example, createAndGetBookDetails() should return a string like "Title: A Brief History of Time, Author: Stephen Hawking".
     * @return A string containing the details of the book.
     */
    public static String createAndGetBookDetails() {
        // Create a Book object with title "A Brief History of Time" and author "Stephen Hawking"
        Book b = new Book('A Brief History of Time','Stephen Hawking');
        
        // Call the getBookDetails method on the book object to get the details of the book
        String results = b.getBookDetails();
        System.debug(results);
        // Return the details of the book
        return results; // Replace null with the variable you used to store the result

    }

    /**
     * Question 13
     * Create and update two Book objects and returns the books.
     * For example, generateBookList(Book) should return a list like ["Title: Harry Potter and the Chamber of Secrets, Author: J.K. Rowling", "Title: A Brief History of Time, Author: Stephen Hawking"].
     * Update Book 1 values: title = "Harry Potter and the Chamber of Secrets", author = "J.K. Rowling", pages = 352
     * Book 2 values: title = "A Brief History of Time", author = "Stephen Hawking"
     * @param myBook1 The first book object.
     * @return return a list of books.
     */
    public static List<Book> generateBookList(Book myBook1) {
        // Create a list of books
        List<Book> bookList = new List<Book>();
        // Update the title and author of myBook1
        mybook1.title = 'Harry Potter and the Chamber of Secrets';
        myBook1.author = 'J.K. Rowling';
        // Update the pages for myBook1 to 352
        myBook1.pages = 352;
        booklist.add(myBook1);
        // Create a new Book object with title "A Brief History of Time" and author "Stephen Hawking"
        Book myBook2 = new Book('A Brief History of Time','Stephen Hawking');

        // Update the pages for A Brief History of Time to 256
        myBook2.pages = 256;
        // Add the book to the list
        bookList.add(myBook2);
        System.debug(bookList);
        return bookList; // Replace null with the variable you used to store the result      
    }


    /**
     * Question 14
     * The Person class represents a person.
     * Each Person object has a name and an age, and methods to return these details.
     * This class can be used in the context of a school, college, etc.
     * where you need to manipulate and manage person information.
     */
    public class Person {
        // Declare private two instance variables - (TEXT) name and (Number) age
        private String name;
        private Integer age;
        
        // Constructor to initialize the name and age
         public Person(String name, Integer age) {
            // Initialize the title and author
            this.name = name;
            this.age = age;
        }
            
        // Method introduceYourself that returns the details of the person 
        // Method that returns the details of the book
        public String introduceYourself() {

        // Return a string in the format "Hello, my name is <name> and I am <age> years old."
        // For example, introduceYourself() should return a string like "Hello, my name is John Doe and I am 28 years old."
            String intro = 'Hello, my name is ' + name + ' and I am ' + age + ' years old.';
            return intro; // Replace null with the variable you used to store the result
        }       
        
        // Getter method that returns the name of the person
        public String getName() {
            return name;
        }
        // Getter method that returns the age of the person
        public Integer getAge(){
            return age;
        }
        // Setter method that sets the name of the person
        public String setName(String name){
            this.name = name;
            return name;
        }
        // Setter method that sets the age of the person
        public Integer setAge(Integer age){
            this.age = age;
            return age;
    }
}

    /**
     * Question 15
     * Create a Person object and returns the details of the person.
     * For example, personDetails() should return a list like ["Hello, my name is John Doe and I am 28 years old.", "John Doe", "28"].
     * @return A string containing the details of the person.
     */

    public static List<String> personDetails() {
        List<String> results = new List<String>();
        // Create a new instance of Person class
        Person myPerson = new Person('John Doe',28);
        // Name the person 'John Doe' and set the age to 28
        // Add the details of the person using the introduceYourself method
        results.add(myPerson.introduceYourself());
        // Get the name of the person using the getter method and add it to the list
        String name = myPerson.getName();
        results.add(name);
        // Get the age of the person using the getter method and add it to the list
       String age = String.valueOf(myPerson.getAge());
       results.add(age);
        return results; // Replace null with the variable you used to store the result
    }

    /**
     * Question 16
     * Create a Person object with the provided name and age.
     * @param name The name of the person.
     * @param age The age of the person.
     * @return A new instance of the Person class.
     */
    public static Person createPerson(String name, Integer age) {
        // Create a new instance of the Person class using the provided name and age
        Person myPerson = new Person(name, age);
        // Return the new instance of the Person class
        return myPerson; // Replace null with the variable you used to store the result
    }

    /**
     * Question 17
     * Create a method that constructs multiple Person objects.
     * You are to create a new Person object for each name in the provided List<String> of names,
     * using the same age for all Person objects. The method should return a List<Person> of all the Person objects created. 
     * @param names A list of names.
     * @param age The age to be set for all the Person objects.
     * @return A list of new Person objects.
     */
    public static List<Person> createMultiplePersons(List<String> names, Integer age) {
        List<Person> personList = new List<Person>();
        // Loop through each name in the provided list of names
        for(String eachName : names){
            // Create a new Person object for each name
            Person eachPerson = new Person(eachName, age);
            System.debug(eachPerson);
            // Add the new Person object to the list of Person objects
            personList.add(eachPerson);
            System.debug(personList);
        }
        // Return the list of Person objects
        return personList; // Replace null with the variable you used to store the result
    }


    /**
     * Question 18
     * Compare two Person objects based on their ages.
     * If the first Person is older, the method should return the first Person. If the second Person is older, it should return the second Person.
     * If they are the same age, return either.
     *
     * @param person1 The first Person object.
     * @param person2 The second Person object.
     * @return The Person object of the older person.
     */
    public static Person getOlderPerson(Person person1, Person person2) {
        Person result;
        if(person1.getAge() > person2.getAge()){
            result = person1;
            System.debug(person1.getAge());
            System.debug(person2.getAge());
        }
        else if(person1.getAge() < person2.getAge()){
            result = person2;
            System.debug(person1.getAge());
            System.debug(person2.getAge());
        }
        else {
            result = person1;
        }
        System.debug(result);
        return result; // Replace null with the variable you used to store the result
    }
}