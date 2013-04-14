poller-json
===========

[![Build Status](https://travis-ci.org/mkrogemann/poller-json.png?branch=master)](https://travis-ci.org/mkrogemann/poller-json)
[![Code Climate](https://codeclimate.com/github/mkrogemann/poller-json.png)](https://codeclimate.com/github/mkrogemann/poller-json)
[![Coverage Status](https://coveralls.io/repos/mkrogemann/poller-json/badge.png?branch=master)](https://coveralls.io/r/mkrogemann/poller-json)

An extension of poller offering JSON matchers


Design
------

The gem has been developed to run in Ruby 1.9.3 and is being continuously integrated in (MRI) Ruby 2.0.0, 1.9.3 and 1.8.7.

In order to provide JSON parsing capability, the gem makes use of further gems: [multi_json](https://github.com/intridea/multi_json) on all platforms and [json_pure](http://flori.github.io/json/) in the case of Ruby 1.8.7.

Of course, another dependency is the [poller](https://github.com/mkrogemann/poller) gem.

It would be nice to use [jsonpath](https://github.com/joshbuddy/jsonpath) to implement JsonPath based matchers but at the time of this writing, there are two issues that stop me from using it: Ruby 1.8.7 is no longer supported by jsonpath and there appear to be problems with certain characters in search expressions.
