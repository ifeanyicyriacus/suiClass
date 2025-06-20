
#[test_only]
module who_are_you::users_tests;
// uncomment this line to import the module
use who_are_you::users;
use sui::tx_context::{new_tx_context};


#[test]
public fun test_users_list_is_empty_after_creation() {
    let mut ctx = new_tx_context();
    let mut users_list = users::new(&mut ctx);
    assert!(users_list.get_all_users().length() == 0);
}

// #[test, expected_failure(abort_code = ::who_are_you::who_are_you_tests::ENotImplemented)]
// fun test_who_are_you_fail() {
//     abort ENotImplemented
// }
