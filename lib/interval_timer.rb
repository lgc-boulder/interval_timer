class IntervalTimer
  def self.started
    timer = new
    timer.start
    timer
  end

  def start
    raise "Already started" if @start_time

    @start_time = Time.now
  end

  def check_in(message = nil)
    check_in = build_check_in(message)
    check_ins.push(check_in)
    check_in
  end
  alias_method :mark, :check_in

  def report
    [
      report_header.join("\n"),
      report_body.join("\n")
    ].join("\n")
  end

  def check_ins
    @check_ins ||= []
  end

  private

  def build_check_in(message)
    { created_at: Time.now, message: message }
  end

  def report_header
    output = []

    output << "start_time: #{@start_time}"

    output
  end

  def report_body
    output = []

    check_ins.each_with_index do |x, i|
      last = i == 0 ? nil : check_ins[i - 1]

      output.push report_line(x, last)
    end

    output
  end

  def report_line(x, last)
    if last
      since_last = ( x[:created_at] - last[:created_at] ).round(3)
    else
      since_last = ( x[:created_at] - @start_time )
    end

    "#{x[:created_at]} -- #{since_last} -- #{x[:message]}"
  end
end
