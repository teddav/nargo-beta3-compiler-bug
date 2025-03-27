mod date;

use date::Date;

fn main(date: Date) {
    // let year = 2021;
    // let result1 = year % 100 != 0;
    // let result2 = (year % 100) != 0;
    // println(f"{result1}");
    // println(f"{result2}");

    // is_leap_year(date);
    // date.is_leap_year();
    // println("------");

    // date.get_days_in_month(2);

    let EPOCH = Date { year: 2000, month: 1, day: 1 };
    let diff = date.get_duration_in_days(EPOCH);

    // println("\n================");
    // println(f"{diff}");
    // println(f"{date}");
    // println(f"{EPOCH}");

    // assert(diff == 7963);
    assert(diff == 0);
}

#[test]
fn test_beta3() {
    let date = Date { year: 2021, month: 10, day: 20 };
    main(date);
}
