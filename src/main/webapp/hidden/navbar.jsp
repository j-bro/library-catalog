<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
    <div class="nav-wrapper">
        <c:url value="/" var="mainUrl" />
        <a href="${mainUrl}" class="brand-logo center">Library Catalog</a>
        <% if (request.getSession().getAttribute("sessionUser") != null) { %>
        <ul id="nav-mobile" class="right">
            <c:url value="/logout" var="logoutUrl" />
            <li><a href="${logoutUrl}">Logout</a></li>
        </ul>
        <% } %>
    </div>
</nav>
