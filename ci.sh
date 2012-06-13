#!/bin/bash

# install ruby and gems

curl -s -o use-ruby https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/use-ruby
RUBY_VERSION=1.8.7-p352 source ./use-ruby

gem install --conservative bundler

bundle check || bundle install

# run buildr ci

ENV=ci bundle exec buildr ci