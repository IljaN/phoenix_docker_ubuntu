# Phoenix Docker
Basic Docker setup for Phoenix + Postgres apps which are deployed using Distillery.
 - Change APP_NAME in docker-compose.yml to something like ```my_app``` (ideally name of project dir)
 - Install and configure [Distillery](https://github.com/bitwalker/distillery#installation) for your project
 - Change your prod.exs and dev.exs to use PORT env variable
  ```elixir
  config :docker_test, DockerTest.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost", port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/manifest.json",
  server: true,
  root: "."
  ```
  ## Compile Release
  ```bash
  $ MIX_ENV=prod mix compile
  $ MIX_ENV=prod mix release --env=prod
  ```  
  ## Build 
  ```bash
  $ sudo -E VERSION=0.0.1 docker-compose build --force-rm
  ```
  
  ## Run
  ```bash
  $ docker-compose up
  ```