# Ndl

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ndl`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ndl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ndl

## Usage

### OpenSearch

* The following arguments are available
  - :dpid
  - :dpgroupid
  - :any
  - :title
  - :creator
  - :publisher
  - :ndc
  - :from
  - :until
  - :cnt
  - :idx
  - :isbn
  - :mediatype

* please refer to [my repository](https://github.com/himkt/opensearch)

```ruby
require 'rexml/document'
require 'ndl'

open_search = Ndl::OpenSearch.new

# you can see result by using the following code
result = open_search.search(:title=>'a', :from=>'1111-11-11', :cnt=>2)
while line = result.gets
  puts line
end

=begin
# you also can parse 'result' by using xml parser
result = open_search.search(:title=>'a', :from=>'1111-11-11', :cnt=>2)
doc = REXML::Document.new(result)
puts doc
=end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ndl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
