#!/usr/bin/env bash
# exit on error
set -o errexit

bundle config set force_ruby_platform true #https://community.render.com/t/nokogiri-1-11-4-bundler-gemnotfound-error-with-rake-in-ruby-build/3159/6
gem update --system --no-document
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rake db:seed