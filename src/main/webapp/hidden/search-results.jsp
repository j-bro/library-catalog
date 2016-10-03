<%@ page import="models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="models.BookRepository" %>

<div class="row">
    <div class="col s12 m10 offset-m1">
        <%
            String queryType = request.getParameter("queryType");
            String queryString = request.getParameter("query");
            List<Book> books = null;
            if (queryString.isEmpty()) {
                books = BookRepository.getBookList();
            } else if (queryType.equals("name")) {
                books = BookRepository.getBooksByName(queryString);
            } else if (queryType.equals("author")) {
                books = BookRepository.getBooksByAuthor(queryString);
            } else if (queryType.equals("subject")) {
                books = BookRepository.getBooksBySubject(queryString);
            } else if (queryType.equals("publisher")) {
                books = BookRepository.getBooksByPublisher(queryString);
            } else if (queryType.equals("year")) {
                books = BookRepository.getBooksByPublishedYear(queryString);
            } else if (queryType.equals("isbn")) {
                books = BookRepository.getBooksByIsbn(queryString);
            }
        %>
        <div class="section">
            <h2>Search Results</h2>
            <% if (queryString.isEmpty()) { %>
                <h5>Empty query, showing all results.</h5>
            <% } else { %>
                <h5><%= queryType.toUpperCase() %> matching '<%= queryString %>'</h5>
            <% } %>
        </div>

        <div class="section">
            <% for (Book book : books) { %>
            <div class="card grey lighten-2">
                <div class="card-content">
                    <span class="card-title">
                        <span class="left">
                            <a href="book.jsp?bookId=<%=book.getId()%>"><%= book.getName() %></a>
                            by <a href="search.jsp?query=<%= book.getAuthor() %>&queryType=author"><%= book.getAuthor() %></a>
                            (<a href="search.jsp?query=<%= book.getPublishingYear() %>&queryType=year"><%= book.getPublishingYear()%></a>)
                        </span>

                        <span class="right">
                            <% if (book.isAvailable()) { %>
                            <span class="green-text">Available</span>
                            <% } else { %>
                            <span class="red-text">Not Available</span>
                            <% } %>
                        </span>
                    </span>
                    <p>&nbsp;<br>&nbsp;</p>
                </div>

                <div class="card-action">
                    <a href="book.jsp?bookId=<%=book.getId()%>">More Info</a>
                </div>
            </div>
            <br>
            <% } %>

        </div>
    </div>
</div>