defmodule Bake.Cli.Menu do
  use Behaviour

  defcallback menu(cmd :: binary)

  defmacro __using__(_) do
    quote do
      import Bake.Cli.Menu

      def invalid_cmd,      do: Bake.Shell.info menu
      def invalid_cmd(""),  do: Bake.Shell.info menu
      def invalid_cmd(cmd) do
        mod = Atom.to_string(__MODULE__)
          |> String.split(".")
          |> List.last
          |> String.downcase
        Bake.Shell.info "Invalid #{mod} command - #{cmd}"
        Bake.Shell.info menu
      end

      def check_target(opts) do
        if opts[:target] == nil and opts[:all] == nil, do: raise """
          You must specify a target to install a system for or pass --all to install systems for all targets
        """
        opts[:target] || {:all}
      end

      def check_bakefile(opts) do
        opts[:bakefile] || System.cwd! <> "/Bakefile"
      end
    end
  end
end
