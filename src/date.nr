pub struct Date {
    pub day: u8,
    pub month: u8,
    pub year: u32,
}

impl Date {
    pub fn get_duration_in_days(self: Self, other: Self) {
        if (self.year < other.year) {
            let _ = self.is_leap_year();
        }
        let _ = self.is_leap_year();
    }

    pub fn is_leap_year(self: Self) -> bool {
        let year = self.year;
        println(f"YEAR: {year}");

        let year_mod_100 = self.year % 100;
        println(f"year_mod_100 (should be 21): {year_mod_100}");

        let year_mod_400 = self.year % 400;
        println(f"year_mod_400 (should be 21): {year_mod_400}");

        let check1 = self.year % 4 == 0;
        let check2 = year_mod_100 != 0;
        let check3 = year_mod_400 == 0;
        println(f"self.year % 4   == 0   : {check1}");
        println(f"self.year % 100 != 0 : {check2}");
        println(f"self.year % 400 == 0 : {check3}");

        let res = (check1 & check2) | check3;
        println(f"RES: {res}");

        if self.year == 2021 {
            assert(res == false);
        }

        res
    }
}
