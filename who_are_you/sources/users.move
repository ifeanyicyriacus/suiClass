module who_are_you::users;

use std::string::String;
use who_are_you::user::{Self, User};

public struct Users {
    users: vector<User>,
}

public fun register_user(users: &mut Users, username: String, email: String, password: String) {
    let new_user = user::new(username, email, password);
    users.users.push_back(new_user);
}

// get user by username
// get user by email
// get all users