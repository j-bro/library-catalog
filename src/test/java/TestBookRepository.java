import models.Book;
import models.BookRepository;
import org.junit.Test;

import java.util.List;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;

/**
 * Created by jeremybrown on 2016-10-01.
 */
public class TestBookRepository {

    @Test
    public void testGetBooksByName() {
        String name = "Hard Choices";
        List<Book> result = BookRepository.getBooksByName(name);

        assertEquals(1, result.size());
        result.forEach(b -> assertEquals(name, b.getName()));
    }

    @Test
    public void testGetBooksByAuthor() {
        String author = "Isaacson";
        List<Book> result = BookRepository.getBooksByAuthor(author);

        assertEquals(2, result.size());
        result.forEach(b -> assertEquals("Walter Isaacson", b.getAuthor()));
    }

    @Test
    public void testGetBooksBySubject() {
        String subject = "United States of America";
        List<Book> result = BookRepository.getBooksBySubject(subject);

        assertEquals(2, result.size());
        result.forEach(b -> assertTrue(b.getSubjects().stream().anyMatch(s -> s.equalsIgnoreCase(subject))));
    }

    @Test
    public void testGetBooksByPublishedYear() {
        String year = "2011";
        List<Book> result = BookRepository.getBooksByPublishedYear(year);

        assertEquals(2, result.size());
        result.forEach(b -> assertEquals(year, b.getPublishingYear()));
    }

    @Test
    public void testGetBooksByPublisher() {
        String publisher = "Simon";
        List<Book> result = BookRepository.getBooksByPublisher(publisher);

        assertEquals(3, result.size());
        result.forEach(b -> assertEquals("Simon & Schuster", b.getPublisher()));
    }
}
