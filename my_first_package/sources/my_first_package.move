/*
/// Module: my_first_package
module my_first_package::my_first_package;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_first_package::Counter {

    public struct Counter has key, store {
        id: sui::object::UID,
        value: u64,
    }

    public entry fun increment(my_counter: &mut Counter) {
        my_counter.value = my_counter.value + 1;
    }
}