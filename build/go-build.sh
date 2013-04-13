#!/bin/bash -l

rvm use 1.9.3@mkrogemann-poller-json --create --fuzzy
bundle

[ -d rspec ] && rm -rf rspec
COVERAGE=true bundle exec rspec --out rspec/rspec.xml --format html --out rspec/rspec.html

exit $?