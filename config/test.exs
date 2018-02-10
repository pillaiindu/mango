use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mango, MangoWeb.Endpoint,
  http: [port: 4001],
  server: true

config :hound, driver: "chrome_driver"
# use phantomjs as driver instead of chrome_driver
# if you're using chrome_driver, you have to download chrome_driver
# from https://sites.google.com/a/chromium.org/chromedriver/downloads

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mango, Mango.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "phxuser",
  password: "phxuser",
  database: "mango_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
