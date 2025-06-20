module who_are_you::user;

use std::string::String;

public struct User has copy, drop, store {
    username: String,
    email: String,
    password: String,
}

// Constructor for User
public fun new(username: String, email: String, password: String): User {
    User {
        username,
        email,
        password,
    }
}

public fun get_username(user: &User): String { user.username }

public fun get_email(user: &User): String { user.email }

public fun set_username(user: &mut User, new_username: String) {
    user.username = new_username;
}

public fun set_email(user: &mut User, new_email: String) {
    user.email = new_email;
}

fun set_password(user: &mut User, password: String) {
    user.password = hash(password);
}

fun hash(password: String): String {
    // b"hashed_password".to_string().append(password);// Simulating a hash
    // let hashed_password = password; 
    // hashed_password
    password
}

fun unhash(hashed_password: String): String {
    // let hash_character_length = b"hashed_password".to_string().length();

    // // println!("Hash character length: {}", hash_character_length);
    
    // let password = hashed_password.substring(hash_character_length, hashed_password.length()); // Simulating a unhashing
    // password
    hashed_password
}

public fun verify_password(user: &User, password: String): bool {
    password == unhash(user.password)
}

public fun change_password(user: &mut User, old_password: String, new_password: String): bool {
    if (user.verify_password(old_password)) {
        user.set_password(new_password);
        true
    } else {
        false
    }
}
