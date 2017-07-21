# IntervalTimer [![Build Status](https://travis-ci.org/lgc-boulder/interval_timer.svg?branch=master)](https://travis-ci.org/lgc-boulder/interval_timer)

A single object that helps make a timeline of code execution.

## installation

`gem install interval_timer`


## usage

```ruby
require 'interval_timer'
timer = IntervalTimer.started

# later in your code:

timer.check_in('Finished saving user')

# even later in your code:

timer.check_in('Finished sending email')

# even later in your code:

puts timer.report
```

The output of timer.report will look like:

```
start_time: 2017-07-20 13:10:43 -0600
2017-07-20 13:10:43 -0600 -- 0.345 -- Finished saving user
2017-07-20 13:10:43 -0600 -- 1.453 -- Finished sending email
```

