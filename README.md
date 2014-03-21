# Winni Vote
[![Build Status](https://travis-ci.org/winnipegrb/winnivote.png?branch=master)](https://travis-ci.org/winnipegrb/winnivote)

## Description

Winnivote is a website to submit topics/ideas and vote to show which ones are more popular.

## Goal

Use the development of _Winnivote_ as a common topic for all the participants of the 
[Winnipeg Ruby User Group](http://winnipegrb.org) so each meeetup a volunteer will show a feature or two that has 
been implemented.


## Guidelines

As a learning experience, part of the goal is to use, highlight and learn good coding practices around the RoR world and
programming in general. 

### Practices

* BDD (every feature should have a specification that drives the development)
* TDD (no line of production code is written without a test)
* Branch per feature and then pull request
* Code reviews
* Heroku deployment with staging and production sites
* Continuos Integration


### Tools

* PostgreSQL database
* heroku toolbelt
* Guard
* slim templates
* rSpec for unit and acceptance tests
* Jasmine for JS unit and integration tests
* Bootstrap
* Font Awesome
* Knockout.js
* Coffeescript
* Devise
* Vagrant

## Getting Started

### Code

Check out the code first

```
git clone https://github.com/winnipegrb/winnivote.git
```

Alternatively, go to https://github.com/winnipegrb/winnivote, fork it, and clone your own copy

### Using Vagrant (optional)

1. [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. [Install Vagrant](http://docs.vagrantup.com/v2/installation/)
1. Update submodules `git submodule update --init --recursive`
1. Run `vagrant up`
1. `vagrant ssh`
1. `cd /vagrant`

### Configuring the app and running it

```
bundle install
bundle exec rake db:migrate
bundle exec rails s
```

### Running the tests

1. [Install PhantomJS](http://phantomjs.org/download.html). It is a pre-requisite to running the feature specs.
2. Run: ```bundle install``` to install all the gems for the project.
2. Run: ```bundle exec rake db:migrate && bundle exec rake db:test:prepare``` to set up the test database.
3. Run: ```mkdir -p tmp/cache```
3. Run: ```bundle exec rspec``` to run all the tests.
