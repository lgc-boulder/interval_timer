describe IntervalTimer do
  it 'produces a list of timestamps with notes you added at record time' do
    timer = IntervalTimer.start

    timer.check_in('first point')
    timer.check_in('second_point')
    timer.check_in('third_point')

    expect(timer.check_ins).to be_a(Enumerable)
  end
end
