defmodule EsioCi do
  @moduledoc false
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(EsioCi.Main, ['EsioCi.Main']),
      worker(EsioCi.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: EsioCi.Supervisor]
    Supervisor.start_link(children, opts)

  end
end
