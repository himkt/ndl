require 'ndl'

open_search = Ndl::OpenSearch.new

result = open_search.search(:title=>'a', :from=>'1111-11-11', :cnt=>2)

while line = result.gets
  puts line
end
