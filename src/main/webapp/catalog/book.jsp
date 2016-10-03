<%@ page import="models.Book" %>
<%@ page import="models.BookRepository" %>
<%@ page import="java.util.Optional" %>
<%--
  Created by IntelliJ IDEA.
  models.User: jeremybrown
  Date: 2016-09-30
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if (request.getSession().getAttribute("sessionUser") == null) {
    response.sendRedirect("../login.jsp");
}%>
<html>
<head>
    <title>Book</title>
    <%@include file="../hidden/header-imports.jsp"%>

</head>
<body>
    <%@include file="../hidden/navbar.jsp"%>
    <div class="container">

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

        <div class="row">
            <div class="col s12 m10 offset-m1">
                <div class="section">
                    <div class="row">
                        <h2><%= book.getName()%></h2>
                        <div class="left">
                            <h5>by <%= book.getAuthor() %></h5>
                        </div>
                        <div class="right">
                            <% if (book.isAvailable()) { %>
                            <h5 class="green-text">Available in the library</h5>
                            <% } else { %>
                            <h5 class="red-text">Not Available in the library</h5>
                            <% } %>
                        </div>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="section">
                    <p class="flow-text">
                        <%= book.getDescription() %>
                    </p>
                </div>

                <div class="divider"></div>

                <div class="section">
                    <c:url value="search.jsp" var="publisherUrl">
                        <c:param name="query" value="<%= book.getPublisher() %>" />
                        <c:param name="queryType" value="publisher" />
                    </c:url>
                    <h6>Publisher: <a href="${publisherUrl}"><%= book.getPublisher() %></a></h6>

                    <c:url value="search.jsp" var="publishingYearUrl">
                        <c:param name="query" value="<%= book.getPublishingYear() %>" />
                        <c:param name="queryType" value="year" />
                    </c:url>
                    <h6>
                        Publishing Year: <a href="${publisherUrl}"><%= book.getPublishingYear() %></a>
                    </h6>

                    <c:url value="search.jsp" var="isbn10Url">
                        <c:param name="query" value="<%= book.getIsbn10() %>" />
                        <c:param name="queryType" value="isbn" />
                    </c:url>
                    <h6>
                        ISBN10: <a href="${isbn10Url}"><%= book.getIsbn10() %></a>
                    </h6>

                    <c:url value="search.jsp" var="isbn13Url">
                        <c:param name="query" value="<%= book.getIsbn13() %>" />
                        <c:param name="queryType" value="isbn" />
                    </c:url>
                    <h6>
                        ISBN13: <a href="${isbn13Url}"><%= book.getIsbn13() %></a>
                    </h6>

                    <br>
                    <h6>
                        Subjects: &nbsp;
                        <% for (String subject : book.getSubjects()) { %>
                        <c:url value="search.jsp" var="subjectUrl">
                            <c:param name="query" value="<%= subject %>" />
                            <c:param name="queryType" value="subject" />
                        </c:url>
                        <div class="chip"><a href="${subjectUrl}"><%= subject %></a></div>
                        <% } %>
                    </h6>
                </div>
            </div>
        </div>

        <% } else {
        %>
        <div class="row">
            <div class="col s12 m10 offset-m1">
                <div class="section">
                    <h2>Book not found...</h2>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <%@include file="../hidden/footer.jsp"%>
</body>
</html>
