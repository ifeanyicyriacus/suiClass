module 0x0::move_basics {
    use sui::address;
    use std::string::String;

    let addr_as_string: String = address::to_string(0x0);
    let addr_from_string: address::Address = address::from_string(addr_as_string);
}

// module block allows multiple module definitions in the
// same file but this is not a recommended practice
module 0x0::another_module_in_the_file {
    // ...
}
