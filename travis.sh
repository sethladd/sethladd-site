# Fast fail the script on failures.
set -e

if [ $TRAVIS_BRANCH = "master" ]; then
  npm install -g firebase-tools
  firebase deploy --token "$FIREBASE_TOKEN"

  echo "Installing gcloud"

  curl -o /tmp/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz 
  tar xzf /tmp/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz -C /tmp
  source '/tmp/google-cloud-sdk/path.bash.inc'

  which gcloud
fi
