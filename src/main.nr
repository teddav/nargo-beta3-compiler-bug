fn main(x: u32) {
    // this if condition seems to trigger the bug
    if (x > 10000) {
        bad_function(x);
    }
    bad_function(x);
}

pub fn bad_function(input: u32) {
    println(f"INPUT: {input}");

    let mod_100 = input % 100;
    println(f"mod_100 (should be 21): {mod_100}");

    assert(mod_100 == 21);
}

#[test]
fn test_beta3() {
    main(121);
}
