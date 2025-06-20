#[test_only]
module wwtbas::wwtbas_tests;

use sui::test_scenario;
use wwtbas::wwtbas;

const ENotImplemented: u64 = 0;

#[test]
fun test_can_create_quiz() {
    let sender = @0x123;
    let scenerio = test_scenario::begin(sender);
    let ctx = scenario.ctx();
    wwtbas::new_quiz(ctx);
    assert!(scenario.num_concluded_txes() != 0);
    test_scenario::end(scenario);
}

// #[test, expected_failure(abort_code = ::wwtbas::wwtbas_tests::ENotImplemented)]
// fun test_wwtbas_fail() {}

#[test]
fun test_can_add_question_to_quiz(){
    let sender = @0x123;
    let scenario = test_scenario::begin(sender);
    let ctx = scenario.ctx();
    let quiz = wwtbas::Quiz{
        id:object::new(ctx),
    };
    
    
    (ctx);
    wwtbas::add_question(ctx, quiz, "What is the capital of France?", "Paris", "London", "Berlin", "Madrid");
    assert!(scenario.num_concluded_txes() != 0);
    test_scenario::end(scenario);
}