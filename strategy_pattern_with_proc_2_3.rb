class Report
  
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'Monthly Report'
    @text = ['This is ', 'good, actually good.']
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end

end

HTML_FORMATTER = lambda do |context|
  puts '<html>'
  puts '<head>'
  puts "<title>#{context.title}</title>"
  puts '</head>'
  puts '<body>'
  context.text.each do |line|
    puts "<p>#{line}</p>"
  end
  puts '</body>'
  puts '</html>'
end

TEXT_FORMATTER = lambda do |context|
  puts "***#{context.title}***"
  context.text.each do |line|
    puts line
  end
end

report = Report.new &HTML_FORMATTER
report.output_report

report = Report.new &TEXT_FORMATTER
report.output_report