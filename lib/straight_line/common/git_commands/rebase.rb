require 'straight_line/common/command'
require 'straight_line/common/shell_error'
require 'straight_line/common/git_commands'

module GitCommands
  # Rebase a branch to a base
  class Rebase < Command
    include GitCommands
    def initialize(base, branch)
      super('git')
      arg 'rebase'
      arg base
      arg branch
    end

    def run(*args)
      super true
    rescue ShellError => e
      handle_merge_conflict(e)
    end
  end
end
