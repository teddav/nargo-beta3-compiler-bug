mod date;
use date::Date;

fn main(date: Date) {
    // let date = Date { year: 2021, month: 10, day: 20 };

    let EPOCH = Date { year: 2000, month: 1, day: 1 };
    date.get_duration_in_days(EPOCH);
}

#[test]
fn test_beta3() {
    let date = Date { year: 2021, month: 10, day: 20 };
    main(date);
}
