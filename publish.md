# Publish Node Package to NPM Registry

```sh
git clone git@github.com:rjminchuk/horizn.git
npm install
# Make code changes
# THEN compile LESS to CSS
npm run all
git add *
git commit
# Increment NPM package.json semantic version (major.minor.patch) and git commit / tag with:
npm version prepatch --message 'prepatch git commit message'
git push --follow-tags
npm login
npm publish ./ --tag beta --dry-run
npm publish ./ --tag beta
# Test:
docker build --no-cache --tag horizn .; docker run --rm --publish 8080:80 horizn;
# release for real:
npm version patch --message 'patch git commit message'
git push --follow-tags
npm login
npm publish ./ --tag stable
```
