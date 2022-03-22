RSpec Notification Center
=========================

[![Build Status](https://img.shields.io/travis/twe4ked/rspec-nc.svg?style=flat-square)](https://travis-ci.org/twe4ked/rspec-nc)

rspec-nc is an RSpec formatter for displaying messages using your system's notifications centre.

Currently Supports:
 - Mountain Lion and newer's Notification Center (via [Terminal Notifier](julienXX/terminal-notifier))
 - Linux

![Screenshot](http://twe4ked.github.io/rspec-nc/rspec-nc.jpg)

Installation
------------

Installing rspec-nc is easy.
Just put it in your Gemfile (`gem 'rspec-nc', require: false`) and run your specs:

```
rspec --format=doc --format=Nc
```

You will want to specify another formatter as rspec-nc does not provide any
other output.

If you want to use rspec-nc as your default formatter, simply put this option
in your .rspec file:

```
--format Nc
```

There are two other formatters included:

- `NcFail` – Only notifies if there is a failure
- `NcFirstFail` – Only notifies on the first failure

### tmux

Using rspec-nc under tmux requires `reattach-to-user-namespace`,
see: [julienXX/terminal-notifier#115].

### linux with docker

Essentially, if `notify-send "Hello"` works, you should be fine. If you're within docker, you may find the following helpful for giving the container access to the system [https://unix.stackexchange.com/a/696388/170153] (Warning: There may be security issues with this, use at your own peril.)

Since your docker container's path may be different to your host, if you set a ENV['PROJECT_HOST_ROOT'] to point at your project from the host's perspective. Otherwise, the image used is based on `Rails.root`


Contributing
------------

Found an issue? Have a great idea? Want to help? Great! Create an issue issue
for it, or even better; fork the project and fix the problem yourself. Pull
requests are always welcome. :)

### Running the specs

``` ruby
rake

# with a formatter
FORMATTER=Nc rake
```

[julienXX/terminal-notifier#115]: https://github.com/julienXX/terminal-notifier/issues/115
