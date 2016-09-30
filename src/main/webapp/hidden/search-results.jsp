<%@ page import="models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="models.BookRepository" %>
<h1>Search results</h1>

<%
    String queryType = request.getParameter("queryType");
    String queryString = request.getParameter("query");
    List<Book> books = null;
    if (queryType.equals("name")) {
        books = BookRepository.getBookByName(queryString);
    } else if (queryType.equals("author")) {
        books = BookRepository.getBooksByAuthor(queryString);
    }
    // TODO for loop in books
%>

<ul>
    <li>Result 1</li>
    <li>Result 2</li>
    <li>Result 3</li>
    <li>etc...</li>
</ul>