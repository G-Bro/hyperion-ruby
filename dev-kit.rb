def start
  system('docker-compose up -d')
end

def install(package, version)
  return system('docker-compose build web') if !package

  puts package
  gem_definition = "gem '#{package}'"
  puts gem_definition
  if File.readlines('Gemfile').any?{ |l| l[gem_definition] }
    puts 'already installed'
  else
    if version
      gem_definition = "#{gem_definition}, '~> #{version}'"
    end
    File.write('Gemfile', "\n#{gem_definition}\n", mode: "a")

    system('docker-compose build web')
  end
end

# route into the docker container and run rails commands
def rails(args)
  cmd = args.join(' ')

  system("docker-compose run web #{cmd}")
end

start if ARGV[0] === 'start'
install(ARGV[1], ARGV[2]) if ARGV[0] == 'install'
rails(ARGV) if ARGV[0] == 'rails'