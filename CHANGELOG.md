# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v3.0.2] - 2021-02-05
### Changed
- fix for variable unit of measures.

## [v3.0.1] - 2021-01-29
### Changed
- Changed node package.json to reflect new location of code repository in richminchukio organization.

### Removed
- Removed the use of `!important` in CSS print styles for Amp ⚡️ support.
   - _Use of `!important` was a holdover from improper ordering of normalize.css in an earlier prerelease version._
- Removed unused css selection styles.
   - _These styles were never included in the horizn.less file or slim version templates. IE: not a (breaking) major version bump_

## [v3.0.0] - 2021-01-28
### Added
- node package support
- A prominent horizontal "hero" image.
- Full device width images (mobile only) that bleed into device specific inset areas.
- Thoughtful positioning of hierarchically semantic navigation.
- Dueling scrollable areas which accentuate article content.
- Optional article styling. Content that looks and behaves well out of the box for desktop and mobile devices.
- Built in light (and optionally dark) mode styling.

### Changed
- Changed from CSS grid to flexbox.
   - _this includes breaking changes to the template from [v1.0.0]_

## [v2.0.0] - 2020-12-28
### Added
- pushed major release to NPM prematurely
   - _IE: don't use this version_

## [v1.0.0] - 2018-06-10
### Added
- horizn's first form: css-grid