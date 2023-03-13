import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :concurso_de_preguntasv3, ConcursoDePreguntasv3.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "concurso_de_preguntasv3_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :concurso_de_preguntasv3, ConcursoDePreguntasv3Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "PMU2iaS8DUJ+F/+6TB3N+2DESolII0jN71Gmofdl/Hgqpw6Q92ff+8/LulRcdv+u",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
