module wwtbas::wwtbas{

    public struct Quiz has key, store{
        id:UID
    }

    public fun new_quiz(ctx:&mut TxContext):Quiz{
        let quiz=Quiz{
            id:object::new(ctx),
        };
        transfer::public_transfer(quiz, ctx.sender());
        quiz
    }
    
}


