module who_are_you::users{

    use std::string::String;
    use std::option::{none, some};
    use who_are_you::user::{Self, User};

    public struct UsersList has key, store{
        id: UID,
        users: vector<User>,
    }

    // Creates a new Users resource with an empty list of users and a unique id.
    public fun new(ctx: &mut TxContext): UsersList {
        UsersList {
            id: object::new(ctx),
            users: vector::empty<User>(),
        }
    }
    
    public fun register_user(users_list: &mut UsersList, username: String, email: String, password: String) {
        let new_user = user::new(username, email, password);
        users_list.users.push_back(new_user);
    }

    public fun get_all_users(users_list: &UsersList): &vector<User> {
        &users_list.users
    }

    public fun get_user_by_index(users_list: &UsersList, index: u64): Option<User> {
        if (index < users_list.users.length()) {
            some(users_list.users[index])
        } else {
            none()
        }
    }

    public fun find_user_by_username(users_list: &UsersList, username: String): Option<User> {
        let len:u64 = users_list.users.length();
        let mut i:u64 = 0;
        while (i < len) {
            let user = users_list.users[i];
            if (user.get_username() == username) { 
                return some(user)
            };
            i = i + 1;
        };
        none()
    }

    public fun find_user_by_email(users_list: &UsersList, email: String): Option<User> {
        let len:u64 = users_list.users.length();
        let mut i:u64 = 0;
        while (i < len) {
            let user = users_list.users[i];
            if (user.get_email() == email) {
                return some(user)
            };
            i = i + 1;
        };
        none()
    }
}