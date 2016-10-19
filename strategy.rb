# Strategy pattern is used for implementing each version of algorythm as a separate object

class Report
  attr_accessor :title, :body, :formatter

  def initialize(formatter = nil)
    @title = "Report"
    @body = ['first line of the report', 'second line of the report', 'third line']
    @formatter = formatter.to_s.classify.new if formatter
  end

  def output
    @strategy.output
  end
end
