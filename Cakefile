{spawnSync} = require 'child_process'

sources = ['index', 'lib/yawait']

task 'build', ->
  for source in sources
    coffee = spawnSync (if process.platform is 'win32' then 'coffee.cmd' else 'coffee'),
      ['--bare', '--compile', "#{source}.coffee"],
      stdio: 'inherit'
    if coffee.status > 0
      return
