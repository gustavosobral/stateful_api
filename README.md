# Stateful API

[![Build Status](https://travis-ci.org/gustavosobral/stateful_api.svg?branch=master)](https://travis-ci.org/gustavosobral/stateful_api) [![codecov](https://codecov.io/gh/gustavosobral/stateful_api/branch/master/graph/badge.svg)](https://codecov.io/gh/gustavosobral/stateful_api) [![Code Climate](https://codeclimate.com/github/gustavosobral/stateful_api/badges/gpa.svg)](https://codeclimate.com/github/gustavosobral/stateful_api) [![Issue Count](https://codeclimate.com/github/gustavosobral/stateful_api/badges/issue_count.svg)](https://codeclimate.com/github/gustavosobral/stateful_api)

## Dependencies

To run this project you need to have:

* Ruby 2.4.1 - You can use [RVM](http://rvm.io)
* [PostgreSQL](http://www.postgresql.org/) - Version 9.2+

## Setup the project

1. Install the dependencies above
2. `$ git clone <REPOSITORY_URL> stateful_api` - Clone the project
3. `$ cd stateful_api` - Go into the project folder
4. `$ gem install bundler` - Install bundler on project gemset
5. `$ bundle install` - Install project dependencies with bundler
6. Configure the database access. There is a sample file for that (`/config/database.sample.yml`)
7. `$ rspec` - Run the specs to see if everything is working fine

If everything goes OK, you can now run the project!
