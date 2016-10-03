# Library Catalog
Submission for SOEN 387 - Fall 2016, Assignment #1

This assignment comprises a searchable library catalog. 
For the purposes of this assignment all the user & book data are read-only and kept in the application resources.

## Data

### Users
List of users present in the system to log in with (username : password).

 - admin : adminadmin
 - userA : userAuserA
 - userB : userBuserB
 
### Books
List of books searchable in the system [Book Title (Author Name)].
 
 - To Kill a Mockingbird (Harper Lee)
 - 1984 (George Orwell)
 - Steve Jobs (Walter Isaacsson)
 - Animal Farm (George Orwell)
 - Silent Spring (Rachel Carson)
 - The Diary of a Young Girl (Anne Frank)
 - Hard Choices (Hillary Rodham Clinton)
 - Einstein: His Life and Universe (Walter Isaacsson)

## How to run

### Package

On Linux / macOS: ```./gradlew build```.

On Windows: ```gradlew.bat build```.

### Run

Copy the generated .war file to the appropriate directory of the Java server container of your choice (Tomcat, GlassFish, JBoss, etc.).




&copy; 2016 Jeremy Brown