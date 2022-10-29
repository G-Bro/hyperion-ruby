module Service
  def start(service = nil)
    system("docker-compose up -d #{service}")
  end

  def help_start()
    {
      desc: 'Start all containers',
      args: {
        service: {
          desc: 'Optionally specify a service to start',
          optional: true,
        },
      },
    }
  end

  def stop(service = nil)
    system("docker-compose stop #{service}")
  end

  def help_stop()
    {
      desc: 'Stop all containers',
      args: {
        service: {
          desc: 'Optionally specify a service to stop',
          optional: true,
        },
      },
    }
  end

  def restart(service = nil)
    stop(service)
    start(service)
  end

  def help_restart()
    {
      desc: 'Restart all containers',
      args: {
        service: {
          desc: 'Optionally specify a service to restart',
          optional: true,
        },
      },
    }
  end
end