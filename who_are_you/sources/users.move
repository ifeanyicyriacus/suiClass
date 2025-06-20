module who_are_you::users{

    use std::string::String;
    use std::option::{none, some};
    // use sui::object::UID;
    use who_are_you::user::{Self, User};

    public struct Users has key, store{
        id:UID,
        users: vector<User>,
    }

    // Creates a new Users resource with an empty list of users and a unique id.
    public fun new(ctx: &mut TxContext): Users {
        Users {
            id: object::new(ctx),
            users: vector::empty<User>(),
        }
    }
    

    public fun register_user(users: &mut Users, username: String, email: String, password: String) {
        let new_user = user::new(username, email, password);
        users.users.push_back(new_user);
    }

    public fun get_all_users(users: &Users): &vector<User> {
        &users.users
    }

    public fun get_user_by_index(users: &Users, index: u64): Option<User> {
        if (index < users.users.length()) {
            some(users.users[index])
        } else {
            none()
        }
    }

    public fun find_user_by_username(users: &Users, username: String): Option<User> {
        let len:u64 = users.users.length();
        let mut i:u64 = 0;
        while (i < len) {
            let user = users.users[i];
            if (user.get_username() == username) { 
                return some(user)
            };
            i = i + 1;
        };
        none()
    }

    public fun find_user_by_email(users: &Users, email: String): Option<User> {
        let len:u64 = users.users.length();
        let mut i:u64 = 0;
        while (i < len) {
            let user = users.users[i];
            if (user.get_email() == email) {
                return some(user)
            };
            i = i + 1;
        };
        none()
    }
}