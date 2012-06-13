[ideaGit] RecruitingOnJava
================

Description
----------------

This is a web application for HR recruiting.

Tech Stack
---------

* __web application__: Java / [Spring MVC](http://www.springsource.org)
* __database__: [MySql](http://www.mysql.com/)
* __build__: Ruby / [Buildr](http://buildr.apache.org/)

CI Server
-------

ci server is setup on `CloudBees`:

    https://ideagit.ci.cloudbees.com/

How To
------

### prepare the environment

Make sure you have Java and Ruby installed. You can use RVM to manage your ruby environment. (This project uses [rvm](https://rvm.io/) which will create a ruby/gemset on `ruby-1.8.7-p352`)

Install bundler and required gems:

    gem install bundle
    bundle install

Run the full build:

    bundle exec buildr ci

### run a local server

    bundle exec app:jetty

### full build

`bundle exc buildr ci` will run the full build which includes:

* generate config file using config.yml by the `ENV` environmental variable;

* run `checkstyle` against the Java source code

* compile Java source code into a war file

* run `JUnit` tests

* use `jetty` to start a local web server

* run `cucumber` acceptance test


