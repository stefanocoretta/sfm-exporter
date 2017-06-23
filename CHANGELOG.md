# Change Log

## [2.2.0] - 2017-06-23
### Changed
- each entry is now separated by an empty line for better human readability ([#4][i4])

## [2.1.0] - 2017-06-18
### Added
- support for both csv and tsv files in script
- suport for xls files in script
- support for tab separated, comma separated and Excel files in app

### Changed
- update to License year

### Fixed
- bug which generated wrong output in script

## [2.0.1] - 2017-05-10
### Fixed
- fix bug which did not parse the lexicon file correctly

## [2.0.0] - 2016-12-31
### Added
- shiny app

### Changed
- change output function to lapply (now empties are skipped in the output)
- merged `tab` and `xls` scripts
- change license to MIT

## 1.1.0 -  2016-12-24
### Changed
- merged with `tab_to_sfm`

## 1.0 - 2016-01-13
### Added
- `rm()` to remove created values

### Removed
- (apparently) useless commands after first `cat()`


[2.2.0]: https://github.com/stefanocoretta/sfm-exporter/compare/v2.1.0...v2.2.0
[2.1.0]: https://github.com/stefanocoretta/sfm-exporter/compare/v2.0.1...v2.1.0
[2.0.1]: https://github.com/stefanocoretta/sfm-exporter/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/stefanocoretta/sfm-exporter/compare/v1.1.0...v2.0.0

[i4]: https://github.com/stefanocoretta/sfm-exporter/issues/4
