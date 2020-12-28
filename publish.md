# Publish Node Package to NPM Registry

```sh
# Make code changes
git commit
git push
# Increment NPM package.json semantic version (major.minor.patch) and git commit / tag with:
npm version prepatch
git push --tags
npm login
npm publish ./ --tag beta --dry-run
npm publish ./ --tag beta
# Test:
docker build -t horizn .; docker run -p 8080:80 horizn;
# release for real:
npm version patch
git push --tags
npm login
npm publish ./ --tag stable
```
