module Rails
  # route into the docker container and run rails commands
  def rails(args)
    cmd = args.join(' ')

    system("docker-compose run web #{cmd}")
  end

  def help_rails()
    {
      desc: 'Run a rails command inside the web container',
      args: {
        command: {
          desc: 'The command to run',
        },
      },
    }
  end

  def tinker
    system('docker-compose run web rails console')
  end

  def help_tinker
    {
      desc: 'Create a console inside the web container',
    }
  end
end