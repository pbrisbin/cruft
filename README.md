# Cruft

Find dependency gems that are no longer needed by your projects.

Cruft compares the output of `gem list` to a body of `Gemfile.lock`s. 
For any gem installed but not required by any of the lock files, it 
prints a `gem uninstall` command which would remove it.

## Installation

~~~
$ git clone https://github.com/pbrisbin/cruft
$ rake install
~~~

## Usage

~~~
$ find ~/Code -name 'Gemfile.lock' -exec cruft {} \+
gem uninstall better_errors --version 0.8.0
gem uninstall bigdecimal --version 1.2.0
gem uninstall bootstrap-sass --version 2.3.1.2
gem uninstall bourbon --version 3.1.7
gem uninstall bundler --version 1.3.5
gem uninstall capybara-webkit --version 0.14.2
gem uninstall delayed_job --version 4.0.0.beta1
gem uninstall ffi --version 1.4.0
gem uninstall gem-browse --version 1.0.0
gem uninstall gem-ctags --version 1.0.5
gem uninstall guard --version 1.8.0
gem uninstall guard-rspec --version 3.0.0
gem uninstall io-console --version 0.4.2
gem uninstall jquery-rails --version 3.0.0
gem uninstall listen --version 1.1.2
gem uninstall minitest --version 4.3.2
gem uninstall pg_search --version 0.6.4
gem uninstall psych --version 2.0.0
gem uninstall rails_admin --version 0.4.8
gem uninstall rake --version 0.9.6
gem uninstall rcodetools --version 0.8.5.0
gem uninstall rdoc --version 4.0.0
gem uninstall safe_yaml --version 0.9.2
gem uninstall schema_validations --version 0.2.2
gem uninstall shoulda-context --version 1.0.2
gem uninstall strong_parameters --version 0.2.0
gem uninstall test-unit --version 2.0.0.0
~~~

Copy and execute lines as desired.
