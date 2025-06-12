// hello.move
module hello_world::hello {
    use sui::object::{UID, Self};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // Struct (like a Java class)
    struct HelloWorld has key, store {
        id: UID, // Unique identifier (like a database primary key)
        message: String
    }

    // Public function to create a HelloWorld object (entry point)
    public entry fun create_hello_world(ctx: &mut TxContext) {
        let hello = HelloWorld {
            id: object::new(ctx),
            message: string::utf8(b"Hello, World!") // Create a String from bytes
        };
        // Transfer the object to the transaction sender
        transfer::public_transfer(hello, tx_context::sender(ctx));
    }
}