# frozen_string_literal: true

logs = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'

def log_format(logs)
  logs.each_line do |line|
    text = %r{/\w+/\d/\w+}.match(line).to_s.upcase
    next if text.empty?

    ip = %r{//(\d{1,3}\.){3}\d{1,3}//}.match(line).to_s
    time = %r{\d{1,2}/\w+/\d{4}(:\d{2}){3}[[:space:]]\+\d{4}}.match(line).to_s
    puts "#{time} FROM: #{ip} TO: #{text}"
  end
end

log_format(logs)
