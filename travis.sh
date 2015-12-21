# Fast fail the script on failures.
set -e

if [ $TRAVIS_BRANCH = "master" ]; then
  npm install -g firebase-tools
  firebase deploy --token "$FIREBASE_TOKEN"
fi
