module wwtbas::wwtbas{
    // use std::object;

    public struct Quiz has store{
        id:UID,
    }

    public fun get_id(quiz: Quiz): UID {
        quiz.id;
    }

    public fun new_quiz(ctx:&mut TxContext):Quiz{
        let quiz=Quiz{
        };
        quiz;
    }
}


