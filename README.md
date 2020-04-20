#  Shell Colorized Aliases for Docker (SCAD)

Defines [Docker][1] aliases (and a few functions) for shells (zsh,
bash, fish), with colorized output for many commands.

These aliases adhere to the [newer
style](https://blog.couchbase.com/docker-1-13-management-commands/) of
organizing and invoking docker with *management commands* rather than
the notoriously confusing “random solo commands”.

This work was inspired by
[akarzim/zsh-docker-aliases](https://github.com/akarzim/zsh-docker-aliases).
It uses [GRC](https://github.com/garabik/grc) and jq for colorized
Docker command output.

## How to Install

### With [zplug][2]

```sh
zplug "MicahElliott/zsh-docker-aliases"
```

## Usage Tips

This was put together with Zsh in mind; YMMV for bash/fish.

These shell aliases are all short mnemonics for docker **management
commands** (eg, `container`, `image`, `volume`), and **subsystems**
(eg, `compose`), and **basic commands** (whose use is discouraged; eg,
`ps`, `build`).  The commands all start with a `dd` (by default,
configurable) and take form like `ddcps` (*container ps*) and `ddcb`
(*container build*).

With such a voluminous set of commands, it’s helpful to use zsh’s tab
completion constantly to see explore what you’re actually trying to
invoke.  Say you’re just looking for a basic command…

Think in terms of *management commands*: Containers, Images, Volumes,
Networks, System, Daemon.

Compose and Machine are their own separate systems, and maybe Compose
is the only one you’ll care about, so get used to typing `ddk<tab>` for
all of its commands.

Install docker zsh completions.

If you’re using (any parts of) oh-my-zsh, use `CASE_SENSITIVE="true"`
to make alias completion differentiation sane.  This way typing
`dc<tab>` will be distinguished from `dC<tab>`.

### run-help (M-h)

See [this solution](https://stackoverflow.com/a/46415388/326516) for
conveniently seeing alias definitions on-the-fly.

## Aliases

### Docker (basic commands)

- `dr` is short for `docker`
- `dkdf` Show docker filesystem usage
- `dkli` Log in to a Docker registry
- `dklo` Log out from a Docker registry
- `dkv` Show the Docker version information

#### Misc

- `dMdf` Show docker filesystem usage
- `dMe` events
- `dMli` Log in to a Docker registry
- `dMlo` Log out from a Docker registry
- `dMv` Show the Docker version information

#### Builder (dB…)

#### Container (dC…)

- `dC` Manage containers
- `dCa` Attach to a running container
- `dCcp` Copy files/folders between a container and the local filesystem
- `dCd` Inspect changes on a container's filesystem
- `dCe` Run a command in a running container
- `dCE` Run an interactive command in a running container
- `dCin` Display detailed information on one or more containers
- `dCk` Kill one or more running containers
- `dCl` Fetch the logs of a container
- `dCL` Fetch and follow (`-f`) the logs of a container
- `dCls` List containers
- `dCp` Pause all processes within one or more containers
- `dCpr` Remove all stopped containers
- `dCrn` Rename a container
- `dCS` Restart one or more containers
- `dCrm` Remove one or more containers
- `dCr` Run a command in a new container
- `dCR` Run an interactive command in a new container and automatically remove the container when it exits
- `dCRe` like `dkCR` and set entry point to `/bin/bash`
- `dCs` Start one or more stopped containers
- `dCss` Display a live stream of container(s) resource usage statistics
- `dCx` Stop one or more running containers
- `dCtop` Display the running processes of a container
- `dCP` Unpause all processes within one or more containers
- `dCup` Update configuration of one or more containers
- `dCw` Block until one or more containers stop, then print their exit codes

#### Image (dI…)

- `dI` Manage images
- `dIb` Build an image from a Dockerfile
- `dIh` Show the history of an image
- `dIim` Import the contents from a tarball to create a filesystem image
- `dIin` Display detailed information on one or more images
- `dIls` List images
- `dIpr` Remove unused images
- `dIpl` Pull an image or a repository from a registry
- `dIplI` Pull all tagged images
- `dIph` Push an image or a repository to a registry
- `dIrm` Remove one or more images
- `dIrmi` Clean up dangling images
- `dIsv` Save one or more images to a tar archive (streamed to STDOUT by default)
- `dIt` Tag an image into a repository

#### Network (dN…)

- `dN` Manage networks
- `dNs` Connect a container to a network
- `dNx` Disconnects a container from a network
- `dNin` Displays detailed information on a network
- `dNls` Lists all the networks created by the user
- `dNpr` Remove all unused networks
- `dNrm` Deletes one or more networks

#### Volume (dV…)

- `dV` Manage volumes
- `dVin` Display detailed information on one or more volumes
- `dVls` List volumes
- `dVpr` Remove all unused volumes
- `dVrm` Remove one or more volumes

#### nodE (dE…)

#### conFig (dF…)

- `dFc` – create a config from file or stdin
- `dFi` – inspect a config
- `dFl` – list configs
- `dFr` – remove config

#### sYstem (dY…)

- `dS` Manage Docker
- `dSi` Show docker info
- `dSdf` Show docker filesystem usage
- `dSpr` Remove unused data
- `dSe` Get real-time events from server


### Docker Compose (dc…)

- `dc` is short for `docker-compose`
- `dcb` Build or rebuild services
- `dcB` Build or rebuild services and do not use cache when building the image
- `dcd` Stop and remove containers, networks, images, and volumes
- `dce` Execute a command in a running container
- `dck` Kill containers
- `dcl` View output from containers
- `dcL` View and follow (`-f`) output from containers
- `dcls` is alias for `dkcps`
- `dcp` Pause services
- `dcP` Unpause services
- `dcpl` Pull service images
- `dcph` Push service images
- `dcps` List containers
- `dcr` Run a one-off command
- `dcR` Run a one-off command and remove container after run.
- `dcrm` Remove stopped containers
- `dcs` Start services
- `dcsc` Set number of containers for a service
- `dcS` Restart services
- `dcu` Create and start containers
- `dcU` Create and start containers in detached mode:
- `dcV` Show the Docker-Compose version information
- `dcx` Stop services

### Docker Machine (dm…)

- `dm` is short for `docker-machine`
- `dma` Get or set the active machine
- `dmcp` Copy files between machines
- `dmd` Set up the default machine ; alowing you to use `dkme` without arguments
- `dme` Set up the environment for the Docker client (eg: `dkme staging` to toggle to staging)
- `dmin` Inspect information about a machine
- `dmip` Get the IP address of a machine
- `dmk` Kill a machine
- `dmls` List machines
- `dmpr` Re-provision existing machines
- `dmps` is alias for `dkmls`
- `dmrg` Regenerate TLS Certificates for a machine
- `dmrm` Remove a machine
- `dms` Start a machine
- `dmsh` Log into or run a command on a machine with SSH
- `dmst` Get the status of a machine
- `dmS` Restart a machine
- `dmu` Get the URL of a machine
- `dmup` Upgrade a machine to the latest version of Docker
- `dmV` Show the Docker Machine version or a machine docker version
- `dmx` Stop a machine

## Author

*The author of this module should be contacted via the [issue tracker][3].*

- [Micah Elliott](https://github.com/MicahElliott)

[1]: https://www.docker.com/
[2]: https://github.com/zplug/zplug
[3]: https://github.com/MicahElliott/zsh-docker-grc-aliases/issues
