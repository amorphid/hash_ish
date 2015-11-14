## 0.4.0 (2015-11-14)

Features:
- No longer inherits from Hash (instead, call `.to_h` on instance)
- Add JSON support
- Values that are empty Hashes now remain a Hash

Bug fixes:
- Removed square_brackets

## 0.3.0 (2015-11-13)

Features:
  - Can now add default values
  - HashIsh now returns instance of self

## 0.2.0 (2015-11-12)

Features:
  - `HashIsh.new` now object that descends from Hash
