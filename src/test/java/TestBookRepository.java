import models.Book;
import models.BookRepository;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * Created by jeremybrown on 2016-10-01.
 */
public class TestBookRepository {

    @Test
    public void testGetBooksByName() {
        String name = "book";
        List<Book> result = BookRepository.getBooksByName(name);

        assertEquals(3, result.size());
    }
}
