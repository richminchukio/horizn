# Contributing to Horizn

The `main` branch in this repository represents the "Next" major, minor, or patch release candidate.

1. Create an issue.
2. Create a shortlived feature branch off of `main` for your fix.
3. `git commit -m 'commit message referencing issue #xxx'`
4. create a pull request to `main`.

# Publishing

Horizn leverages the npm version tool for semantic versioning of git tags. [Notes on publishing npm versions.](./publish.md)

There are no automated tests for Horizn, so there is no automation for publishing Horizn. Publishing Horizn to the public NPM registry is at the discretion of the repository owner.