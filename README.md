# jieba_ffi
[![Build Status](https://travis-ci.org/altkatz/jieba_ffi.png?branch=master)](https://travis-ci.org/altkatz/jieba_ffi)

FFI bindings of [libcppjieba](https://github.com/aszxqw/libcppjieba/) for Ruby. Thanks to [fxsjy](https://github.com/fxsjy), [aszxqw](https://github.com/aszxqw/), and [falood](https://github.com/falood).

## Installation

Add this line to your application's Gemfile:

    gem 'jieba_ffi', :require => 'jieba'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jieba_ffi

## Usage

	# require 'jieba' if not using bundler
    Jieba::MixSegment.init  # Using dict and hmm model in ext/libcppjieba/dict by default
    words = Jieba::MixSegment.cut "我来到南京市长江大桥"
    #["我", "来到", "南京市", "长江大桥"]

## Test
    git submodule update --init
    cd wrapper && make && cd ..
    rake test

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
