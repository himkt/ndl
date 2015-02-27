# -*- coding: utf-8 -*-
require 'ndl'

open_search = Ndl::OpenSearch.new


# you can parse 'result' by using xml parser
result = open_search.search(:title=>'a', :from=>'1111-11-11', :cnt=>2, :ndc=>100)

# parse return Hash include key, 'hit' and 'item'
# hit is number of hit
# item is array that include hash object, and array include bibliography
parsed_result = open_search.parse(result)
p parsed_result[:hit]
p parsed_result[:item]

=begin
# you can also see result by using the following code
result = open_search.search(:title=>'a', :from=>'1111-11-11', :cnt=>2)
while line = result.gets
  puts line
end
=end
