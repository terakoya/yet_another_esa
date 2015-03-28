class Article < ActiveRecord::Base

  def to_html
    processor = Qiita::Markdown::Processor.new
    processor.call(body)[:output]
  end
end
