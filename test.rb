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
