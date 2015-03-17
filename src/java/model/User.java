package model;

/**
 *
 * @author Daniel
 */
public class User {
    private int userId;
    private String firstName;
    private String lastName;
    private String username;
    private String password;

    public int getUserId() {
        return this.userId;
    }
    public void setUserId(int userId){
        this.userId = userId;
    }
    
    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
