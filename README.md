# elm

A Nix flake that provides a package and an application which combines multiple Elm tools, that I use in my personal projects, into a unified tool.

## Usage


### `nix run`

```bash
# Run elm
nix run git+ssh://git@github.com/dwayne/elm -- <elm-args>

# Run a subcommand
nix run git+ssh://git@github.com/dwayne/elm -- <subcommand> <subcommand-args>
```

| subcommand | invokes              |
|------------|----------------------|
| `docs`     | [elm-doc-preview](https://github.com/dmy/elm-doc-preview) |
| `format`   | [elm-format](https://github.com/avh4/elm-format) |
| `json`     | [elm-json](https://github.com/zwilias/elm-json) |
| `optimize` | [elm-optimize-level-2](https://github.com/mdgriffith/elm-optimize-level-2) |
| `review`   | [elm-review](https://github.com/jfmengels/elm-review) |
| `test`     | [elm-test](https://github.com/rtfeldman/node-test-runner) |
| `help`     | elm --help |

For e.g.

```bash
nix run git+ssh://git@github.com/dwayne/elm -- init --help
nix run git+ssh://git@github.com/dwayne/elm -- repl
nix run git+ssh://git@github.com/dwayne/elm -- format src/ --yes
nix run git+ssh://git@github.com/dwayne/elm -- test
```

### Devbox

Add it to your `devbox.json`.

```json
{
  "packages": [
    "git+ssh://git@github.com/dwayne/elm"
  ]
}
```

Then, enter your Devbox shell to access the program.

```bash
devbox shell

elm init --help
elm repl
elm format src/ --yes
elm test
```

## Backstory

I started playing around with [Gleam](https://gleam.run/) and appreciated how all the tooling was unified under a single program.

```bash
Usage: gleam <COMMAND>

Commands:
  add      Add new project dependencies
  build    Build the project
  check    Type check the project
  clean    Clean build artifacts
  deps     Work with dependency packages
  docs     Render HTML documentation
  export   Export something useful from the Gleam project
  fix      Rewrite deprecated Gleam code
  format   Format source code
  help     Print this message or the help of the given subcommand(s)
  hex      Work with the Hex package manager
  lsp      Run the language server, to be used by editors
  new      Create a new project
  publish  Publish the project to the Hex package manager
  remove   Remove project dependencies
  run      Run the project
  shell    Start an Erlang shell
  test     Run the project tests
  update   Update dependency packages to their latest versions
```

This is my attempt to give myself something like that for Elm.
