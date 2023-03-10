module completions {
  # crystal language
  export extern "crystal" [
    file: path
    --help(-h): bool
    --version(-v): bool
  ]

  # create empty crystal project
  export extern "crystal init" [
    type: string
    name: string
    --help(-h): bool
    --force(-f): bool
    --skip-existing(-s): bool
  ]


  # run build program
  export extern "crystal build" [
    file: path
    --debug(-d): bool
    --define(-D): string
    --no-debug: bool
    --emit: string
    --format(-f): string
    --error-trace: bool
    --ll: bool
    --link-flags: string
    --mcpu: string
    --mattr: string
    --mcmodel: string
    --warnings: string
    --error-on-warnings: bool
    --exclude-warnings: path
    --no-color: bool
    --no-codegen: bool
    -o: string
    --prelude: path
    --release: bool
    --stats(-s): bool
    --progress(-p): bool
    --time(-t): bool
    --single-module: bool
    --threads: int
    --verbose: bool
    --static: bool
    --stdin-filename: bool
    --help(-h): bool
    --version(-v): bool
  ]

  # run crystal program
  export extern "crystal run" [
    file: path
    --debug(-d): bool
    --define(-D): string
    --no-debug: bool
    --emit: string
    --format(-f): string
    --error-trace: bool
    --ll: bool
    --link-flags: string
    --mcpu: string
    --mattr: string
    --mcmodel: string
    --warnings: string
    --error-on-warnings: bool
    --exclude-warnings: path
    --no-color: bool
    --no-codegen: bool
    -o: string
    --prelude: path
    --release: bool
    --stats(-s): bool
    --progress(-p): bool
    --time(-t): bool
    --single-module: bool
    --threads: int
    --verbose: bool
    --static: bool
    --stdin-filename: bool
    --help(-h): bool
    --version(-v): bool
  ]

  # rust package manager
  export extern "cargo" [
    --version(-v): bool
    --list: bool
    --explain: string
    --verbose(-v): bool
    --quiet(-q): bool
    --color: string = "auto"
    --frozen: bool
    --locked: bool
    --offline: bool
    --config: string
    --help(-h): bool
  ]

  # build rust programm
  export extern "cargo build" [
    --bin: string
    --example: string
    --jobs(-j): int
    --keep-going: bool
    --release(-r): bool
    --profile: string
    --features(-F): string
    --all-features: bool
    --no-default-features: bool
    --target: string
    --target-dir: path
    --manifest-path: path
    --message-format: string
    --unit-graph: bool
    --ignore-rust-version: bool
    --version(-v): bool
    --list: bool
    --explain: string
    --verbose(-v): bool
    --quiet(-q): bool
    --color: string = "auto"
    --frozen: bool
    --locked: bool
    --offline: bool
    --config: string
    --help(-h): bool
  ]


  # build and run rust programm
  export extern "cargo run" [
    --bin: string
    --example: string
    --jobs(-j): int
    --keep-going: bool
    --release(-r): bool
    --profile: string
    --features(-F): string
    --all-features: bool
    --no-default-features: bool
    --target: string
    --target-dir: path
    --manifest-path: path
    --message-format: string
    --unit-graph: bool
    --ignore-rust-version: bool
    --version(-v): bool
    --list: bool
    --explain: string
    --verbose(-v): bool
    --quiet(-q): bool
    --color: string = "auto"
    --frozen: bool
    --locked: bool
    --offline: bool
    --config: string
    --help(-h): bool
  ]
  
  # rpm tool for rust
  export extern "cargo rpm" [
    --config(-c): path
    --help(-h): bool
    --verbose(-v): bool
  ]

  # init cargo-rpm stuff in existing cargo project
  export extern "cargo rpm init" [
    --config(-c): path
    --help(-h): bool
    --verbose(-v): bool
  ]

  # build and package cargo-rpm project
  export extern "cargo rpm build" [
    --config(-c): path
    --help(-h): bool
    --verbose(-v): bool
  ]

  # scaka package manager
  export extern "sbt" [
    --help(-h): bool
    --verbose(-v): bool
    --version(-V): bool
    --numeric-version: bool
    --script-version: bool
    --no-colors: bool
    --debug-inc: bool
    --debug(-d): bool
    --timings: bool
    --traces: bool
    --sbt-version: string
    --sbt-jar: path
    --sbt-dir: path
    --sbt-boot: path
    --sbt-cache: path
    --java-home: path
    --ivy: path
    --mem: int
    --no-share: bool
    --no-global: bool
    --jvm-debug: string
    --batch: bool
  ]

  # compile scala project
  export extern "sbt compile" [
    --help(-h): bool
    --verbose(-v): bool
    --version(-V): bool
    --numeric-version: bool
    --script-version: bool
    --no-colors: bool
    --debug-inc: bool
    --debug(-d): bool
    --timings: bool
    --traces: bool
    --sbt-version: string
    --sbt-jar: path
    --sbt-dir: path
    --sbt-boot: path
    --sbt-cache: path
    --java-home: path
    --ivy: path
    --mem: int
    --no-share: bool
    --no-global: bool
    --jvm-debug: string
    --batch: bool
    --native: bool
  ]

  export extern "sbt run" [
    --help(-h): bool
    --verbose(-v): bool
    --version(-V): bool
    --numeric-version: bool
    --script-version: bool
    --no-colors: bool
    --debug-inc: bool
    --debug(-d): bool
    --timings: bool
    --traces: bool
    --sbt-version: string
    --sbt-jar: path
    --sbt-dir: path
    --sbt-boot: path
    --sbt-cache: path
    --java-home: path
    --ivy: path
    --mem: int
    --no-share: bool
    --no-global: bool
    --jvm-debug: string
    --batch: bool
    --native: bool
  ]

  def "nu-complete git branches" [] {
    ^git branch | lines | each { |line| $line | str replace '[\*\+] ' '' | str trim }
  }

  def "nu-complete git remotes" [] {
    ^git remote | lines | each { |line| $line | str trim }
  }
  
  # Download objects and refs from another repository
  export extern "git fetch" [
    repository?: string@"nu-complete git remotes" # name of the repository to fetch
    branch?: string@"nu-complete git branches" # name of the branch to fetch
    --all                                         # Fetch all remotes
    --append(-a)                                  # Append ref names and object names to .git/FETCH_HEAD
    --atomic                                      # Use an atomic transaction to update local refs.
    --depth: int                                  # Limit fetching to n commits from the tip
    --deepen: int                                 # Limit fetching to n commits from the current shallow boundary
    --shallow-since: string                       # Deepen or shorten the history by date
    --shallow-exclude: string                     # Deepen or shorten the history by branch/tag
    --unshallow                                   # Fetch all available history
    --update-shallow                              # Update .git/shallow to accept new refs
    --negotiation-tip: string                     # Specify which commit/glob to report while fetching
    --negotiate-only                              # Do not fetch, only print common ancestors
    --dry-run                                     # Show what would be done
    --write-fetch-head                            # Write fetched refs in FETCH_HEAD (default)
    --no-write-fetch-head                         # Do not write FETCH_HEAD
    --force(-f)                                   # Always update the local branch
    --keep(-k)                                    # Keep dowloaded pack
    --multiple                                    # Allow several arguments to be specified
    --auto-maintenance                            # Run 'git maintenance run --auto' at the end (default)
    --no-auto-maintenance                         # Don't run 'git maintenance' at the end
    --auto-gc                                     # Run 'git maintenance run --auto' at the end (default)
    --no-auto-gc                                  # Don't run 'git maintenance' at the end
    --write-commit-graph                          # Write a commit-graph after fetching
    --no-write-commit-graph                       # Don't write a commit-graph after fetching
    --prefetch                                    # Place all refs into the refs/prefetch/ namespace
    --prune(-p)                                   # Remove obsolete remote-tracking references
    --prune-tags(-P)                              # Remove any local tags that do not exist on the remote
    --no-tags(-n)                                 # Disable automatic tag following
    --refmap: string                              # Use this refspec to map the refs to remote-tracking branches
    --tags(-t)                                    # Fetch all tags
    --recurse-submodules: string                  # Fetch new commits of populated submodules (yes/on-demand/no)
    --jobs(-j): int                               # Number of parallel children
    --no-recurse-submodules                       # Disable recursive fetching of submodules
    --set-upstream                                # Add upstream (tracking) reference
    --submodule-prefix: string                    # Prepend to paths printed in informative messages
    --upload-pack: string                         # Non-default path for remote command
    --quiet(-q)                                   # Silence internally used git commands
    --verbose(-v)                                 # Be verbose
    --progress                                    # Report progress on stderr
    --server-option(-o): string                   # Pass options for the server to handle
    --show-forced-updates                         # Check if a branch is force-updated
    --no-show-forced-updates                      # Don't check if a branch is force-updated
    -4                                            # Use IPv4 addresses, ignore IPv6 addresses
    -6                                            # Use IPv6 addresses, ignore IPv4 addresses
    --help                                        # Display the help message for this command
  ]

  export extern "git checkout" [
    ...targets: string@"nu-complete git branches"   # name of the branch or files to checkout
    --conflict: string                              # conflict style (merge or diff3)
    --detach(-d)                                    # detach HEAD at named commit
    --force(-f)                                     # force checkout (throw away local modifications)
    --guess                                         # second guess 'git checkout <no-such-branch>' (default)
    --ignore-other-worktrees                        # do not check if another worktree is holding the given ref
    --ignore-skip-worktree-bits                     # do not limit pathspecs to sparse entries only
    --merge(-m)                                     # perform a 3-way merge with the new branch
    --orphan: string                                # new unparented branch
    --ours(-2)                                      # checkout our version for unmerged files
    --overlay                                       # use overlay mode (default)
    --overwrite-ignore                              # update ignored files (default)
    --patch(-p)                                     # select hunks interactively
    --pathspec-from-file: string                    # read pathspec from file
    --progress                                      # force progress reporting
    --quiet(-q)                                     # suppress progress reporting
    --recurse-submodules: string                    # control recursive updating of submodules
    --theirs(-3)                                    # checkout their version for unmerged files
    --track(-t)                                     # set upstream info for new branch
    -b: string                                      # create and checkout a new branch
    -B: string                                      # create/reset and checkout a branch
    -l                                              # create reflog for new branch
    --help                                          # Display the help message for this command
  ]

  export extern "git push" [
    remote?: string@"nu-complete git remotes",      # the name of the remote
    ...refs: string@"nu-complete git branches"      # the branch / refspec
    --all                                           # push all refs
    --atomic                                        # request atomic transaction on remote side
    --delete(-d)                                    # delete refs
    --dry-run(-n)                                   # dry run
    --exec: string                                  # receive pack program
    --follow-tags                                   # push missing but relevant tags
    --force-with-lease                              # require old value of ref to be at this value
    --force(-f)                                     # force updates
    --ipv4(-4)                                      # use IPv4 addresses only
    --ipv6(-6)                                      # use IPv6 addresses only
    --mirror                                        # mirror all refs
    --no-verify                                     # bypass pre-push hook
    --porcelain                                     # machine-readable output
    --progress                                      # force progress reporting
    --prune                                         # prune locally removed refs
    --push-option(-o): string                       # option to transmit
    --quiet(-q)                                     # be more quiet
    --receive-pack: string                          # receive pack program
    --recurse-submodules: string                    # control recursive pushing of submodules
    --repo: string                                  # repository
    --set-upstream(-u)                              # set upstream for git pull/status
    --signed: string                                # GPG sign the push
    --tags                                          # push tags (can't be used with --all or --mirror)
    --thin                                          # use thin pack
    --verbose(-v)                                   # be more verbose
    --help                                          # Display the help message for this command
  ]
}

use completions *
