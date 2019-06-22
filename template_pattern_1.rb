class Report
  def initialize
    @title = 'Monthly Report'
    @text = ["Today is", "Saturday !!!"]
  end

  def output_report
    output_start
    output_head
    output_body_start
    output_body
    output_body_end
    output_end
  end

  def output_body
    @text.each do |text|
      output_line(text)
    end
  end

  def output_line(line)
    raise 'Abstract method called output_line'
  end

  def output_start
    raise 'Abstract method called output_start'
  end

  def output_head
    raise 'Abstract method called output_head'
  end

  def output_body_start
    raise 'Abstract method called output_body_start'
  end

  def output_body_end
    raise 'Abstract method called output_body_end'
  end

  def output_end
    raise 'Abstract method called output_end'
  end

end

class HTMLReport < Report
  def output_line(line)
    puts "<p>#{line}</p>"
  end

  def output_start
    puts '<html>'
  end

  def output_head
    puts '<head>'
    puts "<title>#{@title}</title>"
    puts '</head>'
  end

  def output_body_start
    puts '<body>'
  end

  def output_body_end
    puts '</body>'
  end

  def output_end
    puts '</html>'
  end
end


class PlainTextReport < Report
  def output_line(line)
    puts line
  end

  def output_start
  end

  def output_head
    puts "***#{@title}***"
  end

  def output_body_start
  end

  def output_body_end
  end

  def output_end
  end
end

report = HTMLReport.new
report.output_report

report = PlainTextReport.new
report.output_report