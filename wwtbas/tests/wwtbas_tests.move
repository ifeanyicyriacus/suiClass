#[test_only]
module wwtbas::wwtbas_tests{

    use wwtbas::wwtbas;
    use sui::test_scenario;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_can_create_quiz() {
        let sender = @0x123;
        let scenerio = test_scenario::begin(sender);
        let ctx = scenario.ctx();
        let quiz =wwtbas::new_quiz(ctx);
        assert!(scenario.num_concluded_txes() != 0);
    }

    #[test, expected_failure(abort_code = ::wwtbas::wwtbas_tests::ENotImplemented)]
    fun test_wwtbas_fail() {
    }
}