module 0x0::hello {
    use sui::debug; 
    
    public fun greet() {
        debug::print(b"Hello, Move!"); 
    }
}