module diary::diary_tests;

use diary::diary;

public fun test_hello_world() {
    assert!(diary::hello_world() == b"Hello, World".to_string())
}