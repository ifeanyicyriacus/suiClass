
#[test_only]
module who_are_you::users_tests;
// uncomment this line to import the module
use who_are_you::users;
use sui::test_scenario;
use std::debug::print;


#[test]
public fun test_users_list_is_empty_after_creation() {
    let sender = @0x123;
    let mut scenario = test_scenario::begin(sender);

    let users_list = users::new(scenario.ctx());

    print(&users_list.get_all_users().length());
    assert!(users_list.get_all_users().length() == 0)
    // test_scenario::end(scenario);
    // transfer::public_transfer(users_list, sender);
}

// #[test, expected_failure(abort_code = ::who_are_you::who_are_you_tests::ENotImplemented)]
// fun test_who_are_you_fail() {
//     abort ENotImplemented
// }
