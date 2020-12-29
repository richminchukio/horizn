# Publish Node Package to NPM Registry

```sh
# Make code changes
git commit
git push
# Increment NPM package.json semantic version (major.minor.patch) and git commit / tag with:
npm version prepatch --message 'patch commit message'
git push --follow-tags
npm login
npm publish ./ --tag beta --dry-run
npm publish ./ --tag beta
# Test:
docker build --no-cache --tag horizn .; docker run --rm --publish 8080:80 horizn;
# release for real:
npm version patch
git push --tags
npm login
npm publish ./ --tag stable
```
