# Publish Node Package to NPM Registry

```sh
git clone git@github.com:rjminchuk/horizn.git
npm install
# Make code changes
# THEN compile LESS to CSS
npm run build
# test
npm run docker-local
git add *
git commit
# Increment NPM package.json semantic version (major.minor.patch) and git commit / tag with:
npm version prepatch
git push --follow-tags
npm login
npm run build
npm publish ./ --tag beta --dry-run
npm publish ./ --tag beta
# Test:
npm run docker
# release for real:
npm version patch
git push --follow-tags
npm login
npm run build
npm publish ./ --tag latest --dry-run
npm publish ./ --tag latest
```
