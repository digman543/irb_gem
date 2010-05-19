require 'spec_helper'

describe "IrbGem" do
  context ".irbrc exist" do
    # before(:each) do
    #   user_home = ENV['HOME']
    #   File.move(File.join(user_home, '.irbrc'), File.join(user_home, '.irbrc.bakeup'])) if File.exist?(File.join(user_home, '.irbrc'))
    #   File.open(File.join(user_home, '.irbrc']), 'w') do |file|
    #     file << "require 'sketches' # sketches"
    #   end
    # end
    it "sholud find require gem" do
      @gem_name = 'sketches'
      @gems = IrbGem.find_gems
      @gems.include?(@gem_name).should be_true
    end
    
    it "sholud find require gem from remote" do
      require 'rubygems'
      require 'rubygems/commands/query_command'
			cmd = Gem::Commands::QueryCommand.new
			cmd.handle_options %w[-r]
			cmd.options[:name] = /#{ @gem_name}/i
			
    end
    
    # after(:each) do
    #     user_home = ENV['HOME']
    #     File.move(File.join(user_home, '.irbrc.bakeup'), File.join(user_home, '.irbrc')) if File.exist?(File.join(user_home, '.irbrc.bakeup'))
    # end
  end
end
