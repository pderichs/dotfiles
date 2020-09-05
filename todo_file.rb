#!/usr/bin/env ruby

require 'fileutils'

class TodoFileFactory

  attr_reader :today, :todo_folder

  EXTENSION = '.org.gpg'

  def initialize
    @todo_folder = ENV['TODO']
    raise 'Todo Folder is not set' if @todo_folder == '' || @todo_folder == nil
    puts "Todo Folder: #{todo_folder}"
    now = Time.now
    @today = sprintf("%.4d%.2d%.2d", now.year, now.month, now.day).to_i
    puts "Today is #{@today}"
  end

  def create_todays_todo_file
    todays_file = "#{todo_folder}/#{today}#{EXTENSION}"
    puts "Todays file is #{todays_file}"
    if File.file?(todays_file)
      puts 'File exists. Nothing to do.'
      return
    end

    # Creates a new todo file for today if needed
    previous_todo_file = last_todo_file
    if previous_todo_file
      # Add missing folder path
      previous_todo_file = "#{todo_folder}/#{previous_todo_file}"
      puts "Copying previous todo file #{previous_todo_file} to #{todays_file}"
      # Copy file to new file with todays timestamp
      FileUtils.copy_file(previous_todo_file, todays_file)
    else
      # Create a new file for today
      puts "No todo file present yet - please create one (#{todays_file})"
    end

    puts "Done. Have a nice day."
  end

  private

  def available_todo_files
    # Read all files in todo folder and sort them by name descending
    Dir.entries("#{todo_folder}").select { |f| File.file?("#{todo_folder}/#{f}") && /^(\d{8})#{EXTENSION}$/.match(f) }.sort.reverse
  end

  def last_todo_file
    # Gets the last todo file before today
    files = available_todo_files
    return files[0] if files.size > 0
    nil
  end

end

TodoFileFactory.new.create_todays_todo_file
