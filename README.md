# Noir compiler 1.0.0 beta.3 bug

## Context

While testing my [2D-Doc circuit (tdd.nr)](https://github.com/teddav/tdd.nr) I ran into a weird bug when upgrading from nargo `1.0.0-beta.2` to `1.0.0-beta.3`.  
On beta2, the circuit runs fine and all constraints are respected, but just switching to beta3 started failing.

After a bit of investigation I located the issue in [noir-date](https://github.com/madztheo/noir-date/) in the [is_leap_year](https://github.com/madztheo/noir-date/blob/bd05506dbb711b6336d9d61610df3f0e944f3779/src/lib.nr#L191) function.

These operations return 0, even though `year == 2021`

```rust
self.year % 100
self.year % 400
```

## When does it happen?

This only happens with `nargo execute`. When running in test mode, everything runs fine.  
This also only happens if the Date is passed as an input to the circuit. If Date is initialized in `main`, then everything is fine

### intuition

Actually I have no idea for now.. 😅  
But the bug happens because of the first `if` condition. Even though it doesn't enter the `if`.  
When removing the `if`, it runs correctly

## Minimal code

I tried to reduce the code to a minimal. Only keeping an if (not entered) with a call to the problematic function, and then actually calling the function.

I put "121" as random in Prover.toml and for the assert in [bad_function](./src/main.nr#15), but anything can be used

## Run

You can test first with `beta.2`:

```bash
noirup -v 1.0.0-beta.2
nargo execute
```

then switch to `beta.3`:

```bash
noirup -v 1.0.0-beta.3

# this works fine
nargo test --show-output

# but this fails
nargo execute
```
