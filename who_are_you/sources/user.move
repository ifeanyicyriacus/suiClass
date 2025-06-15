module who_are_you::user;

use std::string::String;

public struct User {
    username: String,
    email: String,
    password: String,
}

// // Constructor for User
public fun new(username: String, email: String, password: String): User {
    User { username, email, password }
}

public fun get_username(user: &User): String { user.username }

public fun get_email(user: &User): String { user.email }

public fun set_username(user: &mut User, new_username: String) {
    user.username = new_username;
}

public fun set_email(user: &mut User, new_email: String) {
    user.email = new_email;
}

fun set_password(user: &mut User, new_password: String) {
    // In a real application, you would hash the password before storing it
    // For simplicity, we are storing it as plain text here
    // Note: This is not secure and should not be used in production code
    // In a real application, you would use a secure hashing algorithm
    // like bcrypt or Argon2 to hash the password before storing it
    // For example: user.password = hash(new_password);
    // Here we are just setting the password directly

    user.password = new_password;
}

fun hash(password: String): String {
    // Placeholder for a hashing function
    // In a real application, you would implement a secure hashing algorithm
    password // For simplicity, we return the password as is
}

public fun verify_password(user: &User, password: String): bool {
    user.password == password
}

public fun change_password(user: &mut User, old_password: String, new_password: String): bool {
    if (user.verify_password(old_password)) {
        user.set_password(new_password);
        true
    } else {
        false
    }
}

// getters and setters
// change_password
// verify_password

// Sui Task From the move book,
// chapter 5(Hello sui) Follow the code in the chapter
// create a user module that contain a user struct that has:
// 	- user register
// 	- user login
// 	- authenticate user
// 	- change password
// 	- TDD should be tested
