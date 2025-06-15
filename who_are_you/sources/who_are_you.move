module who_are_you::user;

use std::string::String;

public struct User {
    username: String,
    email: String,
    password: String,
}

public fun register_user(username: String, email: String, password: String): User {
    User { username, email, password }
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
