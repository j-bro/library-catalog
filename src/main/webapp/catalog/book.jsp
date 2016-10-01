<%@ page import="models.Book" %>
<%@ page import="models.BookRepository" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  models.User: jeremybrown
  Date: 2016-09-30
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (request.getSession().getAttribute("sessionUser") == null) {
    response.sendRedirect("../login.jsp");
}%>
<html>
<head>
    <title>Book</title>
</head>
<body>
    <%
        long bookId = 0;
        try {
            bookId = Long.valueOf(request.getParameter("bookId"));
        } catch (NumberFormatException e) {

        }

        Optional<Book> bookOptional = BookRepository.getBookById(bookId);

        if (bookOptional.isPresent()) {
            Book book = bookOptional.get();
    %>
    <h1><%= book.getName() %></h1>
    <h3>Author: <%= book.getAuthor() %></h3>
    <h4>Available: <%= book.isAvailable() %></h4>
    <ul>
        <li>Publisher: <%= book.getPublisher() %></li>
        <li>Publishing Year: <%= book.getPublishingYear() %></li>
    </ul>
    <% } else {
    %>
    <h1>Book not found...</h1>
    <% } %>

</body>
</html>
