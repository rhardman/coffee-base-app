optimist = require 'optimist'
Config = require './config'

###*
 * The command line interface class.
###
class CLI
  constructor: (@pkg_info, @logger) ->
    @config = Config.get()
    @argv = optimist
      .usage("Usage: " + @pkg_info.name)

      # configuration
      .alias('c', 'config')
      .describe('c', 'Load the configuration file')
      .default('c', "/etc/baseapp.json")

      # help
      .alias('h', 'help')
      .describe('h', 'Shows this message')
      .default('h', false)

      # append the argv from the cli
      .argv

    @configure()

    if @config.get('help') is true
      optimist.showHelp()
      process.exit(0)

  # Configures the nconf mapping where the priority matches the order
  configure: () =>
    @set_overrides()
    @set_argv()
    @set_env()
    @set_file()
    @set_defaults()

  # Sets up forceful override values
  set_overrides: () =>
    @config.overrides({
      })

  # Sets up the configuration for cli arguments
  set_argv: () =>
    @config.add('optimist_args', {type: 'literal', store: @argv})

  # Sets up the environment configuration
  set_env: () =>
    @config.env({
      whitelist: []
      })

  # Sets up the file configuration
  set_file: () =>
    @config.file({ file: @config.get('c') })

  # Sets up the default configuration
  set_defaults: () =>
    @config.defaults({
      })

module.exports = CLI
