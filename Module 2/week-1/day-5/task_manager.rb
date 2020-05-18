# frozen_string_literal: true

require 'readline'
require 'yaml'

# Task Manager, Rubocop, a simple task manager
class TaskManager
  @@auto_id = 1
  @@proc_not_find = proc { |id| puts "The task with ID #{id} doesn't exist" }

  def initialize
    if File.file?('log.txt')
      file_content = YAML.load_file('log.txt')
      @tasks = file_content[0]
      @@auto_id = file_content[1]
    else
      @tasks = []
      add!('Finish the assignment')
      add!('English homework')
      add!('Play super smash bros until you blow your brain out')
    end
  end

  public

  def add!(description)
    @tasks << Task.new(@@auto_id, description)
    @@auto_id += 1
    save
  end

  def update_description!(id, new_description)
    search_apply(id) do |task|
      task.description = new_description
      puts "Task with ID #{id} has been updated with the new description '#{new_description}'."
      save
    end
  end

  def complete!(id)
    search_apply(id) do |task|
      if task.completed == true
        puts "Task with ID #{id} has already been completed."
      else
        task.completed = true
        puts "Task with ID #{id} has been marked as completed."
        save
      end
    end
  end

  def delete!(id)
    search_apply(id) do |task|
      @tasks.delete(task)
      puts "Task with ID #{id} has been deleted."
    end
  end

  def list
    puts @tasks.select { |task| !task.completed }
  end

  def filter(string)
    puts @tasks.select { |task| (Regexp.new string).match(task.description) }
  end

  def list_completed
    puts @tasks.select { |task| task.completed }
  end

  def list_all
    puts @tasks
  end

  def to_s
    @tasks.join("\n")
  end

  def save
    yaml = YAML.dump([@tasks, @@auto_id])
    File.open('log.txt', 'w') do |h|
      h.write yaml
    end
  end

  private

  # Task search and aply method according to whether it exists or not
  def search_apply(task_id)
    task = @tasks.find { |task| task.id == task_id }
    if task.nil?
      @@proc_not_find.call(task_id)
    else
      yield(task)
    end
  end
end

# Task, Rubocop, a simple task
class Task
  attr_reader :id
  attr_accessor :completed, :description

  def initialize(id, description)
    @id = id
    @description = description
    @completed = false
  end

  def to_s
    "#{@id} - #{@description}"
  end
end

# This is a command for this app
class Commands
  @@count = 0
  @@instances = []

  attr_accessor :name, :desc, :type, :trigger,
                :args_type, :fixed_size, :min_size

  def initialize(name, desc, type, trigger, *args_types)
    @name = name
    @desc = desc
    @type = type
    @trigger = trigger
    @args_type = args_types
    @fixed_size = true
    @fixed_size = false if args_types[-1] == String
    @min_size = name.scan(/\S+/).size + args_types.size
    @@instances << self
  end

  def self.count
    @@count
  end

  def self.list
    @@instances.each(&:print_desc)
  end

  def self.run?(input)
    res = valid?(input)
    command = res[:cmd]
    args = res[:args]
    if command.nil?
      puts 'Command is not valid, try again or use help'
      return false
    end

    if args.empty?
      command.type.send(command.trigger)
    else
      command.type.send(command.trigger, *args)
    end

    true
  end

  def self.valid?(input)
    input_words = input.scan(/\S+/)
    matched = matching_commands(input)

    return { cmd: nil, args: nil } if matched.empty?

    picked_command = pick_most_specific(matched)

    # p "CMD name: #{picked_command.name}"

    input_args = input_words[picked_command.name.split.size..
                                 input.scan(/\S+/).size]

    return { cmd: nil, args: nil } unless picked_command.valid_type?(input_args)

    converted_args = convert_args(picked_command, input_args)
    merged_args = merge_args(picked_command, converted_args)

    { cmd: picked_command, args: merged_args }
  end

  def self.matching_commands(input)
    match = []
    input_words = input.scan(/\S+/)

    @@instances.each do |cmd|
      next unless input[0, cmd.name.size].eql?(cmd.name)
      next unless cmd.valid_size?(input_words)

      match << cmd
    end
    match
  end

  def self.pick_most_specific(valid_commands)
    most_specific_cmd = valid_commands[0]
    valid_commands.each do |cmd|
      most_specific_cmd = cmd if cmd.name.size > most_specific_cmd.name.size
    end
    most_specific_cmd
  end

  def self.convert_args(cmd, input_args)
    input_args.each_with_index do |arg, index|
      type = cmd.args_type[index]
      input_args[index] = Object.send(type.name.to_sym, arg) unless type.nil?
    end
    input_args
  end

  def self.merge_args(cmd, input_args)
    merged_args = input_args
    string_starts = find_string_start(cmd)

    if input_args.size > cmd.args_type.size

      join_string_args = input_args[string_starts, input_args.size]
                             .join(' ')

      merged_args = input_args[0, string_starts]
      merged_args.push(join_string_args)
    end
    merged_args
  end

  def self.find_string_start(cmd)
    string_index = -1
    cmd.args_type.each_with_index do |type, index|
      next unless type == String

      string_index = index
    end
    string_index
  end

  def valid_type?(input_args)
    unless args_type.empty?
      valid = []
      args_type.each_with_index do |type, index|
        case type.name
        when Integer.name
          input_args[index].scan(/^(?!0+$)\d+$/) do |v|
            valid << v
          end
        when Float.name
          # TODO: Learn how to regex floats
        else
          valid << input_args[index]
        end
      end
      return false if valid.size < args_type.size
    end

    true
  end

  def valid_size?(input_words)
    if fixed_size
      return false if input_words.size != min_size
    else
      return false if input_words.size < min_size - 1
    end
    # puts 'Size is valid'
    true
  end

  def print_desc
    puts ">> Type '#{name}' to #{desc}"
  end

  def self.exit
    puts 'Bye...'
    Kernel.exit(0)
  end
end

task_manager = TaskManager.new

Commands.new('task add', 'add a task', task_manager, 'add!', String)

Commands.new('task update', 'update a task', task_manager,
             'update_description!', Integer, String)

Commands.new('task list', 'list all task', task_manager, 'list')

Commands.new('task complete', 'mark task as completed',
             task_manager, 'complete!', Integer)

Commands.new('task list --completed', 'list completed tasks',
             task_manager, 'list_completed')

Commands.new('task list --all', 'list all tasks',
             task_manager, 'list_all')

Commands.new('task list -f', 'filter a task',
             task_manager, 'filter', String)

Commands.new('task delete', 'delete a task',
             task_manager, 'delete!', Integer)

Commands.new('help', 'list all the commands', Commands, 'list')

Commands.new('exit', 'quit', Commands, 'exit')

while (input = Readline.readline('> ', true))
  Commands.run?(input)
end
