poller-json
===========

[![Build Status](https://travis-ci.org/mkrogemann/poller-json.png?branch=master)](https://travis-ci.org/mkrogemann/poller-json)
[![Code Climate](https://codeclimate.com/github/mkrogemann/poller-json.png)](https://codeclimate.com/github/mkrogemann/poller-json)
[![Coverage Status](https://coveralls.io/repos/mkrogemann/poller-json/badge.png?branch=master)](https://coveralls.io/r/mkrogemann/poller-json)
[![Dependency Status](https://gemnasium.com/mkrogemann/poller-json.png)](https://gemnasium.com/mkrogemann/poller-json)
[![Gem Version](https://badge.fury.io/rb/poller-json.png)](http://badge.fury.io/rb/poller-json)

An extension of [poller](https://github.com/mkrogemann/poller) offering JSON matchers. Please consult the poller [README](https://github.com/mkrogemann/poller) before trying to use this gem to make the experience as smooth as possible.

Installation
------------
The gem can be installed in the usual ways. Either let bundler take care of it and add to your Gemfile like this:

    gem 'poller-json'

Or install it directly on your command line

    gem install poller-json

Usage
-----

In order to familiarize yourself with the underlying [poller](https://github.com/mkrogemann/poller) gem, check out its [README](https://github.com/mkrogemann/poller) and its [Wiki](https://github.com/mkrogemann/poller/wiki).

Complementary to this section, there is also a [Wiki](https://github.com/mkrogemann/poller-json/wiki) page that has specific information about this gem (the poller-json rubygem) with more [Usage Examples](https://github.com/mkrogemann/poller-json/wiki/Usage-Examples).

Here is one simple three-step example of how to make use of poller-json:

    require 'poller/poller_json'

    matcher = Matchers::JSON::JSONPathHasObject.new('$menu.popup.menuitem[2]',
      '{\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}')
    #  alternatively, pass expected object in as a Hash

    poller = Poller::HTTP::HttpPoller.new('http://your.sut.example.com', matcher, 5.0, 1.0)
    #  timeout 5s, poll every 1s

    poller.check

In the example above, the expected JSON Object is passed into the matcher as a String. In this case, you have to escape the quotes within the object as shown in the example.

Since a JSON Object is parsed into a Ruby Hash by the [JSON](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/json/rdoc/JSON.html)::parse method, you can also pass in the expected object as a Ruby Hash, which you could produce comfortably in your tests by using JSON::parse('{...}') on String representations of your expected JSON Objects, JSON Arrays or JSON Values.

Scope &amp; Feature Requests
----------------------------

The gem brings with it a very limited implementation of [JSONPath](http://goessner.net/articles/JsonPath/). The implementation is contained in the class lib/matchers/json/json_path.rb.

For the following discussion, consider this given JSON document:

    {"menu": {
      "id": "file",
      "value": "File",
      "popup": {
        "menuitem": [
          {"value": "New", "onclick": "CreateNewDoc()"},
          {"value": "Open", "onclick": "OpenDoc()"},
          {"value": "Close", "onclick": "CloseDoc()"}
        ]
      }
    }}

The only feature that is currently implemented is the ability to navigate along a very simple path such as those shown in these examples:

    $menu.popup.menuitem[1].value

applied to the above document would yield the simple value

     Open

and

    $menu.popup.menuitem

would yield

    [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]

The intention of this very basic JSONPath implementation is to be compatible with the JSONPath design document and thus with alternative JSONPath implementations. To simply switch to using the [jsonpath](https://github.com/joshbuddy/jsonpath) rubygem is not an option right now mainly due to its missing support for Ruby 1.8.7.

The depth of the JSONPath implementation is covering all current use cases of poller-json.

As far as future development is concerned: I welcome Pull requests, proposals for additional features and bug reports.

Design
------

The gem has been developed to run in Ruby 1.9.3 and is being continuously integrated in (MRI) Ruby 2.0.0, 1.9.3 and 1.8.7.

In order to provide JSON parsing capability, the gem makes use of further gems: [multi_json](https://github.com/intridea/multi_json) on all platforms and [json](http://flori.github.io/json/) in the case of Ruby 1.8.7. Please note that the pure Ruby solution to JSON parsing, ie [json_pure](https://rubygems.org/gems/json_pure) will work fine in case you do not want to compile any C code (the json gem makes use of native libs) or in case you have to work on a system that does not allow it (no gcc available, etc.)

Of course, another dependency is the [poller](https://github.com/mkrogemann/poller) gem.

It would be nice to use [jsonpath](https://github.com/joshbuddy/jsonpath) to implement JSONPath based matchers but at the time of this writing, there are two issues that stop me from using it: Ruby 1.8.7 is no longer supported by jsonpath and there appear to be problems with certain characters in search expressions. Investigating
