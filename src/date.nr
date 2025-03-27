use dep::std::println;

pub struct Date {
    pub day: u8,
    pub month: u8,
    pub year: u32,
}

impl Date {
    pub fn get_duration_in_days(self: Self, other: Self) -> i64 {
        let _ = self.get_duration_between_years(other);
        self.get_duration_between_months()
    }

    pub fn is_leap_year(self: Self) -> bool {
        println(f"IS LEAP YEAR: {self}");
        let year = self.year;
        println(f"YEAR: {year}");

        let check1 = self.year % 4 == 0;
        let check2 = self.year % 100 != 0;
        let check3 = self.year % 400 == 0;
        println(f"self.year % 4 == 0   : {check1}");
        println(f"self.year % 100 != 0 : {check2}");
        println(f"self.year % 400 == 0 : {check3}");

        let res = (check1 & check2) | check3;
        println(f"RES: {res}");
        res
    }

    pub fn leap_year_count(year: u32) -> i32 {
        (year / 4) as i32 - (year / 100) as i32 + (year / 400) as i32
    }

    pub fn get_duration_between_months(self: Self) -> i64 {
        let _ = self.is_leap_year();

        0
    }

    pub fn get_duration_between_years(self: Self, other: Self) -> i64 {
        if (self.year < other.year) {
            let _ = self.is_leap_year();
        }
        0
    }
}
