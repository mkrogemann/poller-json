Changelog
=========

Version 0.2.5 - released 2018-09-09
-------------

* No longer support MRI in versions < 2.0
* Add MRI 2.4 and 2.5 to Travis build matrix
* Fix some linting issues in gemspec

Version 0.2.4 - released 2014-12-30
-------------

* Update dependencies and dev dependencies
* Adjust test syntax to RSpec 3
* Add support for MRI 2.2 (README and travis)

Version 0.2.3 - released 2013-12-26
-------------

* Drop support for Rubinius, remove rbx from .travis.yml
* Add support for MRI 2.1, add 2.1.0 to .travis.yml

Version 0.2.2 - released 2013-12-06
-------------

* Make it work with Rubinius again. Handling Rubinius has become more complicated, might drop it.
* Update dependencies

Version 0.2.1 - released 2013-10-11
-------------

* Update dependencies
* Test on rubinius (1.9 mode) and jruby (1.9 mode) too

Version 0.2.0 - released 2013-08-26
-------------

* Update dependencies
* API change, based on updated poller dependency. New version of poller does return tuple of http response and elapsed time rather than nil
* Refactoring (remove duplication)

Version 0.1.6 - released 2013-08-18
-------------

* update dependencies (includes poller Gem)

Version 0.1.5 - released 2013-06-09
-------------

* Improve usage example in README
* Use github code highlighting feature in README
* Replace inheritance with a bit more code and mixins in matchers

Version 0.1.4 - released 2013-05-07
-------------

* the bundler 'platforms' feature does not make sure to install 'json' in MRI 1.8.7 -> revert

Version 0.1.3 - released 2013-05-07
-------------

* improve dependency management (use bundler's 'platforms' feature)

Version 0.1.2 - released 2013-04-21
-------------

* Add rudimentary regex checking for json path expression
* More restrictive on poller dependency
* Refactor json_path.rb

Version 0.1.1 - released 2013-04-19
-------------

* Bugfix: 'poller' was not require'd

Version 0.1.0 - released 2013-04-19
-------------

First public release