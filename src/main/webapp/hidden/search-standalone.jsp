<div class="row">
    <div class="col s12 m10 offset-m1">
        <div class="section">
            <h2>Search</h2>
        </div>

        <div class="section">
            <form id="search-form" method="get" action="../catalog/search.jsp">
                <div class="row">
                    <div class="input-field">
                        <input id="query" type="search" name="query" required>
                        <label for="query"><i class="material-icons">search</i></label>
                        <i class="material-icons">close</i>
                    </div>
                </div>

                <div class="row">
                    <p>
                        <input type="radio" name="queryType" id="query-type-name" value="name" checked />
                        <label for="query-type-name">Name</label>&nbsp;&nbsp;

                        <input type="radio" name="queryType" id="query-type-author" value="author" />
                        <label for="query-type-author">Author</label>&nbsp;&nbsp;

                        <input type="radio" name="queryType" id="query-type-subject" value="subject" />
                        <label for="query-type-subject">Subject</label>&nbsp;&nbsp;

                        <input type="radio" name="queryType" id="query-type-isbn" value="isbn" />
                        <label for="query-type-isbn">ISBN</label>&nbsp;&nbsp;

                        <input type="radio" name="queryType" id="query-type-publisher" value="publisher" />
                        <label for="query-type-publisher">Publisher</label>&nbsp;&nbsp;

                        <input type="radio" name="queryType" id="query-type-year" value="year" />
                        <label for="query-type-year">Publishing Year</label>&nbsp;&nbsp;
                    </p>
                </div>

                <div class="row">
                    <div class="input-field">
                        <button class="btn waves-effect waves-light center" type="submit">Search
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>