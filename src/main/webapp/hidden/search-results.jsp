<%@ page import="models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="models.BookRepository" %>

<h3>Results</h3>
<%
    String queryType = request.getParameter("queryType");
    String queryString = request.getParameter("query");
    List<Book> books = null;
    if (queryType.equals("name")) {
        books = BookRepository.getBooksByName(queryString);
    } else if (queryType.equals("author")) {
        books = BookRepository.getBooksByAuthor(queryString);
    }
%>
<h4>Query: "<%= queryString %>" in <%= queryType %></h4>

<ul>
    <% for (Book book : books) { %>
    <li>
        <a href="book.jsp?bookId=<%=book.getId()%>">
            <%= book.getName() %> (<%= book.getPublishingYear()%>)
        </a>
        <ul>
            <li>Author: <%= book.getAuthor() %>
            </li>
            <li>Available: <%= book.isAvailable() %>
            </li>
        </ul>
    </li>
    <% } %>
</ul>