import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :front, Front.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "gVwfwtxvkZN8zebCRNPFfqzPNjGwHWYQNDhNq+eTi1+PaXq1s8qFXQg+aHAXlRz9",
  server: false

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :back, Back.Repo,
  username: System.get_env("PSQL_USERNAME"),
  password: System.get_env("PSQL_PASSWORD"),
  hostname: System.get_env("PSQL_HOSTNAME"),
  database: "back_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
