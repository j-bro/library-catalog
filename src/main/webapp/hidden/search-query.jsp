<form id="search-form" method="get" action="../catalog/search.jsp">
    <input type="text" name="query" />
    <input type="radio" name="queryType" value="name">Name</input>
    <input type="radio" name="queryType" value="author">Author</input>
    <input type="radio" name="queryType" value="subject">Subject</input>
    <input type="radio" name="queryType" value="publisher">Publisher</input>
    <input type="radio" name="queryType" value="publishingYear">Publishing Year</input>
    <input type="submit" value="Search" />
</form>