package models;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * Created by jeremybrown on 2016-09-30.
 */
public class BookRepository {

    private static final String BOOK_XML = UserRepository.class.getClassLoader().getResource("storage/books-jaxb.xml").getFile();

    private static BookList fetchBookList() throws JAXBException, FileNotFoundException {
        JAXBContext context = getContext();
        Unmarshaller um = context.createUnmarshaller();
        return (BookList) um.unmarshal(new FileReader(BOOK_XML));
    }

    private static List<Book> getBookList() {
        List<Book> books = null;
        try {
            books = fetchBookList().getBooks();
        } catch (JAXBException | FileNotFoundException e) {
            e.printStackTrace();
            books = new ArrayList<>();
        }
        return books;
    }

    public static List<Book> getBookByName(String name) throws BookNotFoundException {
        return getFilteredBookList(book -> name.equals(book.getName()));
        // TODO implement fuzzy search
    }

    public static List<Book> getBooksByAuthor(String author) throws BookNotFoundException {
        return getFilteredBookList(book -> author.equals(book.getAuthor()));
    }

    private static List<Book> getFilteredBookList(Predicate<Book> predicate) {
        List<Book> books = getBookList();
        return books.stream().filter(predicate).collect(Collectors.toList());
    }

    public static void storeBook(Book book) throws JAXBException, IOException {

        // create bookstore, assigning book
        BookList bookList = null;
        try {
            bookList = fetchBookList();
        } catch (JAXBException | IOException e) {
            bookList = new BookList();
        }
        bookList.addBook(book);
        storeBookList(bookList);
    }

    public static void storeBookList(BookList bookList) throws JAXBException, IOException {
        JAXBContext context = getContext();
        Marshaller m = context.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

        // Write to File
        m.marshal(bookList, new File(BOOK_XML));
    }

    private static JAXBContext getContext() throws JAXBException {
        return JAXBContext.newInstance(BookList.class);
    }


    @XmlRootElement(name = "books-list")
    private static class BookList {

        @XmlElement(name = "book")
        List<Book> booksList = new ArrayList<Book>();

        public void setBooksList(List<Book> bookList) {
            this.booksList = bookList;
        }

        public List<Book> getBooks() {
            return booksList;
        }

        public void addBook(Book book) {
            booksList.add(book);
        }
    }

}
