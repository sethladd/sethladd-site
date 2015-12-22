# Fast fail the script on failures.
set -e

if [ $TRAVIS_BRANCH = "master" ]; then
  npm install -g firebase-tools
  firebase deploy --token "$FIREBASE_TOKEN"

  echo
  echo "Installing gcloud"
  echo

  curl -o /tmp/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz 
  tar xzf /tmp/google-cloud-sdk-91.0.1-linux-x86_64.tar.gz -C /tmp
  source '/tmp/google-cloud-sdk/path.bash.inc'

  which gcloud

  gcloud auth activate-service-account --key-file sethladd-site-8958bc933793.json
  gcloud preview app deploy --version=2 --project=sethladd-site app.yaml
  cat /home/travis/.config/gcloud/logs/2015.12.22/*.log
fi
