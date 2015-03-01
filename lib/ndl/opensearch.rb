require 'open-uri'
require 'rss'

module Ndl
  class OpenSearch
    def initialize
      @url = "http://iss.ndl.go.jp/api/opensearch?"
    end
    def search(*query)
      # delete query that don't have value
      query = query[0].delete_if{|k,v|v==''}
      # make url for ndl-opensearch-api
      query.each_with_index do |(k,v), i|
        @url += "#{k}=#{v}"
        @url += "&" if (i != query.size-1)
      end
      # return #StringIO or #Tempfile via gem 'open-uri'
      # about 'open-uri', please refer to http://docs.ruby-lang.org/ja/2.1.0/library/open=2duri.html
      result = open(@url)
      return result
    end
    def parse(result)
      parsed_result = Hash.new
      doc = RSS::Parser.parse(result)
      parsed_result[:hit] = doc.items.size
      parsed_result[:item] = Array.new
      doc.items.each do |item|
        bibliography = Hash.new
        bibliography[:dc_title] = item.dc_title
        bibliography[:dc_creator] = item.dc_creator
        bibliography[:guid] = item.guid.content
        bibliography[:category] = item.category.content
        bibliography[:dc_subject] = item.dc_subject if ((item.dc_subject != nil) && (item.dc_subject.size == 3))
        parsed_result[:item].push(bibliography)
      end
      return parsed_result
    end
  end
end
