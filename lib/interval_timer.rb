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
    check_ins.push( build_check_in(message) )
  end

  def report
    lines = []

    check_ins.each_with_index do |x, i|
      last = i == 0 ? nil : check_ins[i - 1]

      lines.push report_line(x, last)
    end

    lines.join("\n")
  end

  def check_ins
    @check_ins ||= []
  end

  private

  def build_check_in(message)
    { created_at: Time.now, message: message }
  end

  def report_line(x, last)
    if last
      since_last = ( x[:created_at] - last[:created_at] ).round(3)
    else
      since_last = ' '
    end

    "#{x[:created_at]} -- #{since_last} -- #{x[:message]}"
  end
end
