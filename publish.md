# Publish Node Package to NPM Registry

```sh
git clone git@github.com:rjminchuk/horizn.git
npm install
# Make code changes
# THEN compile LESS to CSS
npm run all
# test
npm run docker-local-files
git add *
git commit
# Increment NPM package.json semantic version (major.minor.patch) and git commit / tag with:
npm version prepatch --message 'prepatch git commit message'
git push --follow-tags
npm login
npm publish ./ --tag beta --dry-run
npm publish ./ --tag beta
# Test:
npm run docker
# release for real:
npm version patch --message 'patch git commit message'
git push --follow-tags
npm login
npm publish ./ --tag stable
```
