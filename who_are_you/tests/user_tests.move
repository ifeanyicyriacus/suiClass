#[test_only]
module who_are_you::user_tests;

use who_are_you::user;

// const ENotImplemented: u64 = 0;

#[test]
fun test_a_new_user_can_be_created_successfully() {
    let username = b"ifeanyicyriacus".to_string();
    let email = b"civm@gmail.com".to_string();
    let password = b"strong_password".to_string();

    let new_user = user::new(
        username,
        email,
        password,
    );
    assert!(new_user.get_username() == username);
    assert!(new_user.get_email() == email);
    assert!(new_user.verify_password(password));
}

#[test]
fun test_user_can_change_password_successfully() {
    let username = b"ifeanyicyriacus".to_string();
    let email = b"civm@gmail.com".to_string();
    let password = b"strong_password".to_string();

    let mut new_user = user::new(
        username,
        email,
        password,
    );
    assert!(new_user.get_username() == username);
    assert!(new_user.get_email() == email);
    assert!(new_user.verify_password(password));

    new_user.change_password(password, b"new_strong_password".to_string());
    assert!(new_user.verify_password(b"new_strong_password".to_string()));
}

