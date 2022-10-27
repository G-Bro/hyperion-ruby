def start
  system('docker-compose up -d')
end

start if ARGV[0] === 'start'

def install(package, version)
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

install(ARGV[1], ARGV[2]) if ARGV[0] == 'install'