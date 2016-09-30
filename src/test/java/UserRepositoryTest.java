import models.User;
import models.UserRepository;
import org.junit.Test;

import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/**
 * Created by jeremybrown on 2016-09-30.
 */
public class UserRepositoryTest {

    @Test
    public void testGetValidUser() {
        String username = "admin";
        String password = "adminadmin";

        Optional<User> userOptional = UserRepository.getValidUser(username, password);

        assertTrue(userOptional.isPresent());
        User user = userOptional.get();
        assertEquals(username, user.getUsername());
        assertEquals(password, user.getPassword());
    }

}
