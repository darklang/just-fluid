# Fluid

TODO

See also:

- [Project Tracking](https://github.com/orgs/darklang/projects/5) - what we're actually
  working on right
- [Darklang Community Discord](https://darklang.com/discord-invite)
- [Roadmap](https://github.com/darklang/dark/issues/3284)
- [Contributor guide](https://docs.darklang.com/contributing/getting-started)

See our [guide to the repo](https://docs.darklang.com/contributing/repo-layout) for help browsing.

## Contributing

TODO

## Getting started

TODO

### Install dependencies

We develop Dark within a docker container, so there is not a lot of setup.
However, we do need to setup the host system in a few ways to support running
scripts, and Docker.

#### OSX

To build and run the server you must have the following installed (and running):

- [Homebrew for Mac](https://brew.sh/)
- [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
- Bash 4 or later: `brew install bash`

#### Linux

Everything should just work on Linux, so long as you have docker installed and
you are using bash 4 or later.

#### Windows

On Windows, you can run Dark in WSL2 (Windows Subsystem for Linux):

- You must be on at least Windows 10 Version 2004, and you must run WSL 2
  (docker does not work in WSL 1)
- Follow the [WSL 2 installation
  instructions](https://docs.microsoft.com/en-us/windows/wsl/install-win10#update-to-wsl-2)
- Follow the [Docker for WSL 2 installation
  instructions](https://docs.docker.com/docker-for-windows/wsl/)
- You need to clone the dark repo with the git `core.autocrlf` setting set to
  `false`. You can configure this by running `git config --global core.autocrlf false`. If you have already cloned dark, you will need to reclone it.
- This section of the guide is incomplete. Please [create an
  issue](https://github.com/darklang/dark/issues) if you find something doesn't work.

### Building and running for the first time

#### Running the build script

Now that the pre-requisites are installed, we should be able to build the
development container in Docker, which has the exact right versions of all the
tools we use.

- If you're using VSCode, we run our build scripts in the VSCode devcontainer. See
  [the VSCode instructions](docs/vscode-setup.md) for instructions.
- Otherwise, simply run `scripts/builder --compile --watch --test`

These steps apply for all builds, VSCode or using `scripts/builder`:

- Wait until the terminal says "Initial compile succeeded" - this means the
  build server is ready. The `builder` script will sit open, waiting for file
  changes in order to recompile
- If you see "initial compile failed", it may be a memory issue. Sometimes
  trying again will work. If not, ensure you have Docker configured to provide
  4GB or more of memory, then try again.
- Open your browser to http://darklang.localhost:9000/a/dark/, username "dark",
  password "what"
- Edit code normally - on each save to your filesystem, the app will be rebuilt
  and the browser will reload as necessary

### Using Dark scripts

The [`scripts/`](/scripts) directory is full of scripts. They automatically execute
in the dev container, even if they are run on the host (see
[`scripts/devcontainer/_assert-in-container`](/scripts/devcontainer/_assert-in-container)
for how this works). Scripts starting with an underscore are primarily intended to be
run by other scripts. Scripts without an underscore are usually intended to be called
by a human, though they are often also called by other scripts as well.

## Read the contributor docs

If you've gotten this far, you're now ready to [contribute your first PR](https://darklang.github.io/docs/contributing/getting-started#first-contribution).

## Advanced setup

- [setting up dnsmasq](docs/dnsmasq.md)
- [setting up browser-reloading](docs/livereload.md)

## Testing

Unit tests run when you specify `--test` to `scripts/builder`. You can run them as a once off using:

- `scripts/run-client-tests`

## Running unix commands in the container

- `scripts/run-in-docker bash`

## Accessing the local db

- `scripts/run-in-docker psql -d devdb`

## Config files

Config files ([config/](config)) define all env vars that you can use in Dark code.
All config vars must start with `DARK_CONFIG`. Changing a config variable in
`config/dev` requires restaring the devcontanier.

## Debugging the client

You can enable the FluidDebugger by mousing over the Gear in the
left-sidebar. There is also "Enable debugger" which enables a legacy
debugger that nobody uses and doesn't work well.

If you're using Chrome, enable Custom Formatters to see ReScript values in
Chrome Dev Tools instead of their JS representation. From within Chrome
Dev Tools, click "⠇", "Settings", "Preferences", "Enable Custom
Formatters".


## Other important docs

- [Contributor docs](https://docs.darklang.com/contributing/getting-started)
- [Other ways to run the dev container](docs/builder-options.md)
- [Setting up your editor](docs/editor-setup.md)
- [Running unit tests](docs/unittests.md)
- [Dark unit tests](backend/testfiles/README.md)
- [If you're interviewing at Dark, read this](docs/interviewing.md)

### Less important docs

- [Docs around running Dark in production](docs/production)
- [Running the client against production (ngrok)](docs/running-against-production.md)
- [Oplist serialization](docs/oplist-serialization.md)
- [Intricacies of Bucklescript-tea](docs/bs-tea.md)
- [Writing Stdlib docstrings](docs/writing-docstrings.md)
- [Editing other BS libraries](docs/modifying-libraries.md)
- [Add an account for yourself](docs/add-account.md)
- [Using fuzzers to develop Dark](docs/fuzzer.md)
- [Logging and telemetry](docs/logging-and-telemetry.md)
- [Writing docstrings in the Dark Standard library](docs/writing-docstrings.md)
