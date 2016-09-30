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

/**
 * Created by jeremybrown on 2016-09-30.
 */
public class UserRepository {

    private static final String USERS_XML = UserRepository.class.getClassLoader().getResource("storage/users-jaxb.xml").getFile();

    private static UserList fetchUserList() throws JAXBException, FileNotFoundException {
        JAXBContext context = JAXBContext.newInstance(UserList.class);
        Unmarshaller um = context.createUnmarshaller();
        return (UserList) um.unmarshal(new FileReader(USERS_XML));
    }

    public static Optional<User> getValidUser(String username, String password) {
        List<User> users = null;
        try {
            users = fetchUserList().getUsers();
        } catch (JAXBException | FileNotFoundException e) {
            e.printStackTrace();
        }

        return users.stream()
                .filter(user -> username.equals(user.getUsername()) && password.equals(user.getPassword()))
                .findFirst();
    }

    public static void storeUser(User user) throws JAXBException, IOException {

        // create bookstore, assigning book
        UserList userList = null;
        try {
            userList = fetchUserList();
        } catch (JAXBException | IOException e) {
            userList = new UserList();
        }
        userList.addUser(user);
        storeUserList(userList);
    }

    public static void storeUserList(UserList userList) throws JAXBException, IOException {
        // create JAXB context and instantiate marshaller
        JAXBContext context = JAXBContext.newInstance(UserList.class);
        Marshaller m = context.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

        // Write to System.out
        m.marshal(userList, System.out);

        // Write to File
        m.marshal(userList, new File(USERS_XML));
    }


    @XmlRootElement(name = "users-list")
    private static class UserList {

        @XmlElement(name = "user")
        List<User> userList = new ArrayList<User>();

        public void setUsers(List<User> users) {
            this.userList = users;
        }

        public List<User> getUsers() {
            return userList;
        }

        public void addUser(User newuser) {
            userList.add(newuser);
        }
    }

}
