## 0.4.3 (2015-11-17)

Refactors:
- Add Srm gem
- Move development dependencies into Gemfile

## 0.4.2 (2015-11-16)

Bug Fixes:
- Fix incompatible JSON gem version

## 0.4.1 (2015-11-14)

Improvements:
- Add versioning to gems in gemspec

## 0.4.0 (2015-11-14)

Features:
- No longer inherits from Hash (instead, call `.to_h` on instance)
- Add JSON support
- Values that are empty Hashes now remain a Hash

## 0.3.0 (2015-11-14)

Features:
  - Can now add default values
  - HashIsh now returns instance of self

## 0.2.0 (2015-11-12)

Features:
  - `HashIsh.new` now object that descends from Hash
