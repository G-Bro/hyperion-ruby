require 'bundler/inline'
gemfile do
  source 'https://rubygems.org'
  gem 'colorize'
end

require 'colorize'

require_relative './service.rb'
require_relative './package_manager.rb'
require_relative './rails.rb'

class DevKit
  include PackageManager
  include Service
  include Rails

  def help
    # find all methods starting with "help"
    methods = self.methods.filter { |m| m.to_s.start_with?('help_') }

    methods.each do |method|
      documentation = self.public_send(method)
      output_help_title(method, documentation)
      output_help_arguments(method, documentation)
      puts "\n"
    end
  end

  private

  def output_help_title(method, documentation)
    doc_string = "hyp ".yellow + method.to_s.sub('help_', '').cyan
    if documentation.key?(:args)
      documentation[:args].each do |key, value|
        doc_string += " <#{key}#{'?' if value[:optional]}>".magenta
      end
    end
    puts "#{doc_string} - #{documentation[:desc]}"
  end

  def output_help_arguments(method, documentation)
    if documentation.key?(:args)
      documentation[:args].each do |key, value|
        puts "\t" + [key.to_s.magenta, value[:desc].light_blue].join("\t")
      end
    end
  end
end

kit = DevKit.new
kit.public_send(*ARGV)

# puts String.color_samples

# puts kit.methods
