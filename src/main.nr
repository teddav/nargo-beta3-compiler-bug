fn main(year: u32) {
    if (year > 10000) {
        is_leap_year(year);
    }
    is_leap_year(year);
}

pub fn is_leap_year(year: u32) {
    println(f"YEAR: {year}");

    let year_mod_100 = year % 100;
    println(f"year_mod_100 (should be 21): {year_mod_100}");

    let year_mod_400 = year % 400;
    println(f"year_mod_400 (should be 21): {year_mod_400}");

    let check1 = year % 4 == 0;
    let check2 = year_mod_100 != 0;
    let check3 = year_mod_400 == 0;
    println(f"self.year % 4   == 0   : {check1}");
    println(f"self.year % 100 != 0 : {check2}");
    println(f"self.year % 400 == 0 : {check3}");

    let res = (check1 & check2) | check3;
    println(f"RES: {res}");

    if year == 2021 {
        assert(res == false);
    }
}

#[test]
fn test_beta3() {
    let year = 2021;
    main(year);
}
