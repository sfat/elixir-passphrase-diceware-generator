# CLI

## How to get your own executable locally

Since Elixir `escript` isn't really a standalone per se thing to use in production, you're going
to need a few things before getting your own `passphase-generator` that you can run.

1. You're going to need to install Elixir (read more [here](https://elixir-lang.org/install.html))
2. Then run from the following:
```bash
cd apps/cli
MIX_ENV=prod mix do escript.build, escript.install

# Here it will ask you if you want to install the executable. You will say 'Y'

# depending on your shell (bash/zsh)

vim ~/.bash_profile

export PATH=$PATH:"/your/local/directory/.mix/escripts"

:wq
```

And you should be good to go and run your own `passphrase-generator`

````bash
passphrase-generator
````


