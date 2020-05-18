# frozen_string_literal: true

# https://blog.dnsimple.com/2018/03/elapsed-time-with-ruby-the-right-way/
def exec_time(&proc)
  starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  proc.call
  ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  ending - starting
end

p "Elapsed time: #{exec_time { p 'Hello World' }}"
