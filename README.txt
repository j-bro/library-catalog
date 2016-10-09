# Library Catalog
Submission for SOEN 387 - Fall 2016, Assignment #1
Jeremy Brown ID 27515421

This assignment comprises a searchable library catalog.
For the purposes of this assignment all the user & book data are read-only and kept in the application resources.


## Usage

### Authentication
The user must first authenticate with the system to be able to search for books. See the credentials under the 'Users' heading.
Once logged in, the user can log out from any page by clicking on the 'Logout' button at the top right side of the page.

### Search
To search, the user enters their query in the search box presented to them after login.
Books are searchable by Name, Author, Subject, ISBN, Publisher, and Publishing Year.
For the Name, Author, and Publisher queries, search term matching is done by case-insensitive checking if the query is contained in the specified data field.
For Subject and Publishing Year queries, search term matching is done by case-insensitive exact matching on the specified data field.
For ISBN searches, dashes (-) are ignored and the query is matched against both ISBN10 and ISBN13 data fields.

### Search Results
The results page displays a list of all books matching the specified search query.
If no query is specified, all books in the system are shown to the user.
The results page URL contains the search parameters and can therefore be copied and revisited at a later time, with the results remaining intact.
The author, publishing year, and library availability are also shown for each book in the search results.

### Book Detail
By clicking on a book's title or on the 'More Info' button, users are brought to that book's description page.
This page contains a description of the text as well as all the information for a book listed in its search results entry.
Also, the page includes the book's publisher, ISBNs, and subjects.
Each of these are hyperlinks to search results for these items, allowing easy access to related books.


## Data

### Users
List of users present in the system to log in with (username : password).
** The user data are stored under 'src/main/resources/storage/users-jaxb.xml'

 - admin : adminadmin
 - userA : userAuserA
 - userB : userBuserB

### Books
List of books searchable in the system [Book Title (Author Name)].
** The book data are stored under 'src/main/resources/storage/books-jaxb.xml'

 - To Kill a Mockingbird (Harper Lee)
 - 1984 (George Orwell)
 - Steve Jobs (Walter Isaacsson)
 - Animal Farm (George Orwell)
 - Silent Spring (Rachel Carson)
 - The Diary of a Young Girl (Anne Frank)
 - Hard Choices (Hillary Rodham Clinton)
 - Einstein: His Life and Universe (Walter Isaacsson)

### Authors with multiple results
 - Walter Isaacsson
 - George Orwell

### Subjects with multiple results
 - Fiction
 - Biography
 - United States of America


## How to run

### War

The project can be easily deployed on any container web server using the provided 'library-catalog.war' archive.
For example, using Tomcat simply upload the WAR file from the admin server manager page.

The service will be available at 'http://<your-server-ip>/library-catalog/'.


(c) 2016 Jeremy Brown