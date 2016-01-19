ExUnit.start

Mix.Task.run "ecto.create", ~w(-r BrunchBrosPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r BrunchBrosPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(BrunchBrosPhoenix.Repo)

