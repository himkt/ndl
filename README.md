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
require 'ndl'

open_search = Ndl::OpenSearch.new


# you can parse 'result' by using xml parser
result = open_search.search(:title=>'a', :from=>'1111-11-11', :cnt=>2, :ndc=>100)

# parse return Hash include key, 'hit' and 'item'
# hit is number of hit
# item is array that include hash object, and array include bibliography
parsed_result = open_search.parse(result)
p parsed_result

=begin
# you can also see result by using the following code
result = open_search.search(:title=>'a', :from=>'1111-11-11', :cnt=>2)
while line = result.gets
  puts line
end
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

## data source
* 国立国会図書館のAPIを利用します
* from [this](http://iss.ndl.go.jp/information/wp-content/uploads/2014/12/ndlsearch_api_20141215_jp.pdf)

## リクエストURL
* http://iss.ndl.go.jp/api/opensearch?dpid=[dpid]&title=[title]&...

## 引数

|参照名     |内容                                            |一致条件|複数   |
|:----------|:-----------------------------------------------|:-------|:------|
|dpid       |データプロパイダID                              |完全一致|able   |
|dpgroupid  |データプロバイダグループID                      |完全一致|disable|
|any        |すべての項目を対象に検索                        |部分一致|able   |
|title      |タイトル                                        |部分一致|able   |
|creator    |作成者                                          |部分一致|able   |
|publisher  |出版者                                          |部分一致|able   |
|ndc        |分類(NDC)                                       |前方一致|disable|
|from       |開始出版年月日(YYYY-MM-DD)                      |        |disable|
|until      |終了出版年月日                                  |        |disable|
|cnt        |出力レコード上限値(省略時は200)                 |        |disable|
|idx        |レコード取得開始位置                            |        |disable|
|isbn       |isbn(10, 13桁の場合は完全一致), その他は前方一致|        |disable|
|mediatype  |種類種別                                        |完全一致|able   |

## データプロバイダID

* [参照](http://iss.ndl.go.jp/information/wp-content/uploads/2014/12/ndlsearch_api_furoku1_20141215_jp.pdf)

## データプロバイダグループID

|No |データプロバイダグループID|データプロバイダグループIDの内容|
|:--|:-------------------------|:-------------------------------|
|1  |Digitalcontents           |本文、デジタル画像等(一次情報)  |
|2  |Catalogue                 |目録、索引等                    |
|3  |Site                      |サイト情報                      |
|4  |Reference                 |調べ物に便利な情報、参考情報    |
|5  |Science                   |自然科学系の情報                |
|6  |Humanities                |人文科学系の情報                |
|7  |Library                   |図書館に関わる情報              |
|8  |Child                     |子供向けの情報                  |
|9  |Ndl                       |国立国会図書館が提供する情報    |

## 種類種別

|記号|種別|
|:---|:---|
|1   |本  |
|2   |記事・論文|
|3   |新聞|
|4   |児童書|
|5   |レファレンス資料|
|6   |デジタル資料|
|7   |その他|
|8   |障害者向け資料|
|9   |立法情報|
