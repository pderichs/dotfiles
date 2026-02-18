# frozen_string_literal: true

task default: [:all]

DRY_RUN = ENV['DRY_RUN'] == '1'
SOURCE_PATH = File.join(__dir__, 'home')

def red(text)
  "\e[31m#{text}\e[0m"
end

def green(text)
  "\e[32m#{text}\e[0m"
end

def yellow(text)
  "\e[33m#{text}\e[0m"
end

def sources
  pattern = File.join(SOURCE_PATH, '**/*')
  @sources ||= Dir.glob(pattern, File::FNM_DOTMATCH)
end

def destination_by_source(source)
  relative = source.sub(%r{.*/home/}, '')
  File.join(Dir.home, relative)
end

def existing_file?(destination)
  File.exist?(destination) && !File.symlink?(destination)
end

def create_link(source, destination)
  if DRY_RUN
    puts yellow("DRY RUN: Would create link #{source} -> #{destination}")
    return
  end

  # If destination is a symlink to a folder and exists, ln_sf would
  # create the symlink *in* that folder. Remove link to avoid that
  # situation.
  File.unlink(destination) if File.symlink?(destination)

  ln_sf source, destination
  puts green("Created link #{destination}")
rescue RuntimeError => e
  puts red("Error! Link #{destination} could not be created: #{e.message}")
end

def link_file(source)
  destination = destination_by_source(source)
  if existing_file?(destination)
    puts yellow("WARNING: #{destination} is an existing file (no symlink). Skipping.")
    return
  end

  create_link(source, destination)
end

def link_folder?(folder)
  File.exist?(File.join(folder, '__LINK_FOLDER__'))
end

def setup_folder(folder)
  dest = destination_by_source(folder)
  return if File.directory?(dest)

  if DRY_RUN
    puts yellow("DRY RUN: Would create folder #{dest}")
    return
  end

  mkdir_p dest
  puts green("Created folder #{dest}")
rescue RuntimeError => e
  puts red("Error! Folder #{dest} could not be created: #{e.message}")
end

def warning_message
  puts red('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
  puts red('!                                                                   !')
  puts red('! CAUTION: This will create symlinks and modify your home directory !')
  puts red('!                                                                   !')
  puts red('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
end

def user_confirmation
  if DRY_RUN
    puts yellow('DRY RUN mode – no changes will be made.')
    true
  else
    warning_message
    print "Type 'YES!' to continue, anything else to cancel:"
    $stdin.gets.chomp == 'YES!'
  end
end

def linked_folders
  @linked_folders ||= Set.new
end

task :all do
  unless user_confirmation
    puts 'Aborted.'
    exit 1
  end

  puts 'Creating folders and links...'
  sources.each do |source|
    if File.directory?(source)
      next if File.identical?(source, SOURCE_PATH) # ignore home root

      if link_folder?(source)
        linked_folders.add(source)
        link_file(source)
      else
        setup_folder(source)
      end
    elsif File.file?(source)
      next if linked_folders.any? { |folder| source.start_with?(folder) }

      link_file(source)
    end
  end

  puts 'Done.'
end
