# cd to directory
cd intro-to-iiif

# install the plugins and build the static site
gitbook install && gitbook build

# build 5 day workshop
cd ../iiif-5-day-workshop
gitbook install && gitbook build

# build 1 day workshop
cd ../iiif-1-day-workshop
gitbook install && gitbook build

cd ../
cp README.md README.bwk

# checkout to the gh-pages branch
git checkout gh-pages

# pull the latest updates
git pull origin gh-pages --rebase

# copy the static site files into the current directory.
cp -R intro-to-iiif/_book/* ./intro-to-iiif
cp -R iiif-5-day-workshop/_book/* ./iiif-5-day-workshop
cp -R iiif-1-day-workshop/_book/* ./iiif-1-day-workshop
cp README.bwk README.md
rm README.bwk

# remove 'node_modules' and '_book' directory
git clean -fx node_modules
git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "Update site"

# push to the origin
git push origin gh-pages

# checkout to the master branch
git checkout master
