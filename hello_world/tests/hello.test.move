// Test block
#[test]
fun test_create_hello_world() {
    use sui::test_scenario;

    // Simulate a blockchain scenario
    let scenario = test_scenario::begin(tx_context::dummy());
    let account = test_scenario::next_address(&mut scenario); // Test account

    // Test transaction: call `create_hello_world`
    test_scenario::next_tx(&mut scenario, account);
    {
        create_hello_world(test_scenario::ctx(&mut scenario));
    };

    // Check if the object exists in the account
    let hello_id = test_scenario::take_owned<HelloWorld>(&scenario);
    let HelloWorld { id: _, message } = test_scenario::take_owned(hello_id);

    // Assert the message matches (like JUnit/Go's testing)
    assert!(message == string::utf8(b"Hello, World!"), 0);
}