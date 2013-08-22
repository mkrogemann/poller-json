#!/bin/bash -l

rvm use 1.9.3@mkrogemann-poller-json --create --fuzzy
bundle update

[ -d rspec-integration ] && rm -rf rspec-integration
bundle exec rspec --tag type:integration --out rspec-integration/rspec.xml --format html --out rspec-integration/rspec.html

exit $?
