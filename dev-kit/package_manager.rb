module PackageManager
  def install(package = nil, version = nil)
    return system('docker-compose build web') if !package

    puts package
    gem_definition = "gem '#{package}'"
    puts gem_definition
    if File.readlines("#{__dir__}/../Gemfile").any?{ |l| l[gem_definition] }
      puts 'already installed'
    else
      if version
        gem_definition = "#{gem_definition}, '~> #{version}'"
      end
      File.write("#{__dir__}/../Gemfile", "\n#{gem_definition}\n", mode: "a")

      system('docker-compose build web')
    end
  end

  def help_install()
    {
      desc: 'Install all gems and rebuild the web container',
      args: {
        package: {
          desc: 'Name of a new gem to install',
          optional: true,
        },
        version: {
          desc: 'Version number in format 1.2.3',
          optional: true,
        }
      },
    }
  end
end