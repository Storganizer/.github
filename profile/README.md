# storganizer

## OpenSource

While there are applications doing exactly what i want

Commercial offerings
- https://www.iboxxit.com/de/
- https://housebook.io/
- StuffKeeper
- and alot more https://play.google.com/store/search?q=inventory&c=apps

But, there is nothing where you also own your data. This is the gap storganizer is trying to fill.
I am a strong believer in "Everybody should be in control of where his/her data is persisted and what might or might not happen with it." 



## Run it locally

API
```
# clone and change directory
git clone git@github.com:Storganizer/api.git storganizer-api
cd storganizer-api

# create tables and seed some data if needed
./seed.py

# run the api
python3 api.py
```

UI
```
# clone and change directory
git clone git@github.com:Storganizer/ui.git storganizer-ui
cd storganizer-ui

# install all packages
npm install

# start the webappliation
npm run start
```
Both appliations are now accessible in the webbrowser
API: http://localhost:5000
WebUI: http://localhost:3000






# Legacy Docs


## Description
Application to manage your storage at home. It is really not much more than an idea.
I did not find anything simple to digitally manage my mess at home. Everything I own is of unimaginable value of course.

I want to classify my storage possibilities based on accessibility. Most accessible will be 1, next is 2 and so on.
Then, I want to mark my boxes with QR codes and add what items are in there.

[ ] Items can optionally also have QR codes.

[ ] The app should be able to scan a QR code and then act.

With boxes:
 - [ ] set an action with a related item, possibly "store" or "take"
 - [ ] set a last access date

 With items:
 - [ ] check the state "stored" or "taken"
 - [ ] check details anyway
 - [ ] perform action, possibly "store" or "take", maybe "relocate" to store it in a different box
 - [ ] set a last usage date

Items without QR codes, for whatever reason, can still change state by scanning the boxes QR code. This might get hard to use having alot of items in one box. Time will tell.


## Repositories
- API
- UI
- DATA

## High Level Architecture

./concept/HIGH_LEVEL.md

```

## Data Structure

./concept/ER_MODEL.md

## Planned Features
- UI
- API
- Data Import/Export
- 3D Models
