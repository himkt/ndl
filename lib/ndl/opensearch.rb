require 'open-uri'

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
  end
end
