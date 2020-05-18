# frozen_string_literal: true

require 'dotenv'
require 'io/console'
require 'readline'
require 'uri'

require_relative 'github_manager'

Dotenv.load('credentials.env')
puts 'Checking if your credentials are valid...'

email = ENV['EMAIL']

if email.nil? || email == ''
  print 'Github username: '
  email = gets.chomp
  until email.match?(URI::MailTo::EMAIL_REGEXP)
    puts 'Please enter a valid email'
    print 'Github username: '
    email = gets.chomp
  end
end

password = ENV['PASSWORD']

if password.nil? || password == ''
  print 'Github password: '
  password = STDIN.noecho(&:gets).chomp
  puts ''
end

gm = GithubRepoManager.new(email, password)

commands = %w[create update delete]

loop do
  input = Readline.readline('>', true)

  cmd, *args = input.split(/\s/)

  if commands.include?(cmd)
    case cmd
    when 'create'
      if args.size != 1
        puts 'Expected just one argument'
        return
      end
      gm.create_repo(args[0])
    when 'update'
      if args.size != 2
        puts 'Expected two arguments'
        return
      end
      gm.update_repo_name(args[0], args[1])
    when 'delete'
      if args.size != 1
        puts 'Expected just one argument'
        return
      end
      gm.delete_repo(args[0])
    end
  else
    puts 'Command is not valid'
  end
end
