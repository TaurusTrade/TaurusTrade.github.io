rm -rf _book
gitbook build
cd _book/
touch .nojekyll
git config user.name "TaurusTrade"
git config user.email "taurustrade@outlook.com"
git init
git add .
git commit -am 'import'
git remote add origin git@taurus:TaurusTrade/TaurusTrade.github.io
git push --set-upstream origin master --force