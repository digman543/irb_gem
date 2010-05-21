module IrbGem
  extend self
  
  def install_gems(gems, *options)
    if gems.empty?
      puts 'nothing need install'
      return
    end
    require 'rubygems'
    require 'rubygems/commands/install_command'
    cmd = Gem::Commands::InstallCommand.new
    cmd.handle_options %w[--no-rdoc --no-ri]
    
    unless options.empty?
      cmd.handle_options options
    end
    
    cmd.options[:args] = gems
    
    begin
      cmd.execute
    rescue Gem::SystemExitException => e
      # catech gem installed exception
    end
  end
  
  def find_gems
    user_home = ENV['HOME']
    gems = []
    File.open(File.join(user_home, '.irbrc')) do |file|
      file.each do |line|
        if line =~ /.*require '.*' # .*/
          gems << line.split('#').last.strip
        end
      end
    end
    gems
  end
end