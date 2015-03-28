class Article < ActiveRecord::Base
  def to_html
    processor = Qiita::Markdown::Processor.new
    result = processor.call(self.body)
    result[:output].to_s
  end
end
