# Publish Node Package to NPM Registry

```sh
# Make code changes
# Increment NPM package.json semantic version (major.minor.patch)
# git commit
# Create pull request to main
# Merge to main
# git checkout main
# npm login
# npm publish ./ --tag beta --dry-run
# npm publish ./ --tag beta
# Test:
   # docker build -t horizn .; docker run -p 8080:80 horizn;
# git tag -v <npm-version>
# git push --tags
# npm publish ./ --tag stable
```
