require_relative '../../lib/interval_timer'

describe IntervalTimer do
  it 'produces a list of timestamps with notes you added at record time' do
    timer = IntervalTimer.started

    timer.check_in('first point')
    timer.check_in('second_point')
    timer.check_in('third_point')

    expect(timer.check_ins).to be_a(Enumerable)

    expect(timer.report).to be_a(String)

    header_size = 0

    expect( count_lines(timer.report) ).to(
      eq( header_size + timer.check_ins.count )
    )

    puts timer.report
  end

  def count_lines(string)
    string.split("\n").count
  end
end
