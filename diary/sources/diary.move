module diary::diary {
    use std::string::String;

    public fun hello_world():String{
        let greet = b"Hello, World".to_string();
        greet
    }
}


