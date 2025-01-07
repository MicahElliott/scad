# source this file, or add to your plugin manager
#
# Defines Docker aliases.
#
# Author: Micah Elliott

# TODO
# - fzf completers
# - asccinema demo
# - --help H to all
# - add color to drH
# - enable grc to supported commands
# - pipe inspect commands into jq
# - demo a la https://asciinema.org/a/247655
# - remove long doc/descriptions in readme
# - full help for each mgmt cmd

# Set a short-term default prefix; unset later
p=${SCAD_PREFIX-d}
d=${SCAD_DOCKER-podman} # or maybe docker
dc=${SCAD_DCOMPOSE-podman-compose} # or maybe $dc

GRC_INSTALLED=false
GRC=''
if which grc >/dev/null; then
    GRC_INSTALLED=true
    GRC=grc
else
    echo
    echo 'You really gotta install grc to enjoy docker.'
    echo 'Spend 2 minutes and make your life better:'
    echo '  https://github.com/garabik/grc'
    echo
    echo 'But I’ll go ahead an enable the aliases for you anyway.'
    echo
fi

# Wrapper function for select docker commands that GRC supports
_grc() {
    if [[ -z $GRC ]]; then echo -e '\033[0;31mInstall GRC for docker color! https://github.com/garabik/grc\033[0m'; $@
    else                   grc -c $@; fi
}

## Docker top-level command aliases
dkr="${DOCKER-docker}"
# alias d=$d
alias dr=$d
alias ${p}'?'="_${p}HELP"
alias ${p}="_${p}HELP" # becomes main: alias d=...
# alias ${p}'?'=ddH
alias ${p}H='docker --help'
# alias ${p}'?'='docker --help'

## Misc (m) (grab-bag)
# alias dmdf=''
# alias dme=''
# alias dm=''
# alias ${p}gs='_grc docker search'
alias ${p}gv='_grc conf.dockerversion docker version'
alias ${p}mrmv='docker volume rm $(docker volume ls -f dangling=true -q)'

# ######################################################################
# ## Builder (b)
# __SCAD_BUILDER_HELP="
# TODO
# "
# alias ${p}b'?'='echo $__SCAD_BUILDER_HELP'
# alias ${p}bH="$d builder"
# alias ${p}b="$d builder"
# alias ${p}bH="$d builder   build --help"
# # alias ${p}bb="_grc ${d} builder build"
# # alias ${p}bB="_grc ${d} builder build --tag"
# alias ${p}bb="$d builder build"
# alias ${p}bB="$d builder build --tag"
# alias ${p}bpr="$d builder prune"

# ## conFig (f) (swarm)
# __SCAD_CONFIG_HELP="
# TODO
# "
# alias ${p}f'?'='echo $__SCAD_CONFIG_HELP'
# alias ${p}f="$d config"
# alias ${p}fH="$d config"
# alias ${p}fcr="$d config create"
# alias ${p}fi="$d config inspect"
# alias ${p}fl="$d config ls"
# alias ${p}frm="$d config rm"

## Container (c)
__SCAD_CONTAINER_HELP="${d} CONTAINER commands:
  ${p}c    — Invoke the bare ${d} container command
  ${p}ca   — Attach local standard input, output, and error streams to a running container
  ${p}cci  — Commit a new image from a container’s changes
  ${p}ccp  — Copy files/folders between a container and the local filesystem
  ${p}ccr  — Create a new image from a container’s changes
  ${p}cd   — Diff/inspect changes to files or directories on a container’s filesystem
  ${p}ce   — Exec-run a command in a running container
  ${p}cei  — Exec-run interactive tty
  ${p}cex  — Export a container’s filesystem as a tar archive
  ${p}cin  — Inspect/display detailed information on one or more containers
  ${p}ck   — Kill one or more running containers
  ${p}clo  — Logs of a container
  ${p}clof — Logs, in follow mode
  ${p}cl   — List containers
  ${p}cla  — List ALL containers, even those not running
  ${p}cp   — Pause all processes within one or more containers
  ${p}cpt  — Port mappings list or a specific mapping for the container
  ${p}cpr  — Prune/remove all stopped containers
  ${p}crn  — Rename a container
  ${p}ccy  — Cycle/restart one or more containers
  ${p}crm  — Remove one or more containers
  ${p}cr   — Run a command in a new container
  ${p}crD  — Run in daemon/detached mode with name (use logs to see output)
  ${p}cri  — Run, interactive tty
  ${p}cris — Run, interactive, shell entrypoint
  ${p}cs   — Start one or more stopped containers
  ${p}cx   — Stop one or more running containers
  ${p}cst  — Display a live stream of container(s) resource usage statistics (cpu, mem)
  ${p}ctop — Top/display the running processes of a container
  ${p}cP   — UnPause all processes within one or more containers
  ${p}cup  — Update configuration of one or more containers
  ${p}cw   — Wait/block until one or more containers stop, then print their exit codes
"
alias ${p}c'?'='echo $__SCAD_CONTAINER_HELP'
alias ${p}cH="${d} container"
# alias ${p}C='${d} container'
alias ${p}c="$d container"
alias ${p}ca="$d container attach"
alias ${p}cci="$d container commit"
alias ${p}ccp="$d container cp"
alias ${p}ccr="$d container create"
alias ${p}cd="$d container diff"
alias ${p}ce="$d container exec"
alias ${p}cei="$d container exec -i -t"
alias ${p}cex="$d container export"
alias ${p}ci="$d container inspect"
alias ${p}ck="$d container kill"
alias ${p}clo="$d container logs"
alias ${p}clof="$d container logs --follow"
alias ${p}cl="_grc conf.dockerps $d container ls"
alias ${p}cla="_grc conf.dockerps $d container ls -a"
alias ${p}cp="$d container pause"
alias ${p}cpt="$d container port"
alias ${p}cpr="$d container prune"
alias ${p}crn="$d container rename"
alias ${p}ccy="$d container restart"
alias ${p}crm="$d container rm"
alias ${p}cr="$d container run --rm"
alias ${p}crD="$d container run --detach --rm --name"
alias ${p}cri="$d container run -i -t --rm"
alias ${p}cris="$d container run -i -t --rm --entrypoint /bin/sh"
alias ${p}cs="$d container start"
alias ${p}cst="$d container stats"
alias ${p}cx="$d container stop"
alias ${p}ctop="$d container top"
alias ${p}cP="$d container unpause"
alias ${p}cup="$d container update"
alias ${p}cw="$d container wait"

## conteXt
__SCAD_CONTEXT_HELP="
TODO
"
alias ${p}x'?'='echo $__SCAD_CONTEXT_HELP'
alias ${p}x="$d context"
alias ${p}xH="$d context"
alias ${p}xcr="$d context create"
alias ${p}xex="$d context export"
alias ${p}xim="$d context import"
alias ${p}xi="$d context inspect"
alias ${p}xl="$d context ls"
alias ${p}xrm="$d context rm"
alias ${p}xup="$d context update"
alias ${p}xu="$d context use"

## Image (i)
__SCAD_IMAGE_HELP="${d} IMAGE commands:
  ${p}i    — Invoke the bare ${d} image command
  ${p}ib   — Build an image from a Dockerfile
  ${p}ibr  — Build an image from a Dockerfile, removing intermediates
  ${p}iB   — Build an image with a tag
  ${p}ih   — Show the history of an image
  ${p}iim  — Import the contents from a tarball to create a filesystem image
  ${p}ii   — Inspect/display detailed information on one or more images
  ${p}il   — List images
  ${p}ila  — List all images
  ${p}ild  — Load an image from a tar archive or STDIN
  ${p}ipr  — Remove unused images
  ${p}ipl  — Pull an image or a repository from a registry
  ${p}iph  — Push an image or a repository to a registry
  ${p}irm  — Remove one or more images
  ${p}isv  — Save one or more images to a tar archive (streamed to STDOUT by default)
  ${p}it   — Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  ${p}is   — Find/search Docker Hub for images
"
alias ${p}i'?'='echo $__SCAD_IMAGE_HELP'
alias ${p}i="$d image"
alias ${p}iH="$d image"
# alias ${p}ib="$d image build"
alias ${p}ib="$d image build -t"
alias ${p}ibr="$d image build --rm -t"
alias ${p}ih="$d image history"
alias ${p}iim="$d image import"
alias ${p}ii="$d image inspect"
alias ${p}il="_grc conf.dockerimages $d image ls"
alias ${p}ild="$d image load"
alias ${p}ipr="$d image prune"
alias ${p}ipl="$d image pull"
alias ${p}ipu="$d image push"
alias ${p}irm="$d image rm"
alias ${p}isv="$d image save"
alias ${p}it="$d image tag"
# missing from docker
alias ${p}is="_grc conf.dockersearch $d search"

## Network (n)
__SCAD_NETWORK_HELP="${d} NETWORK commands:
  ${p}nc   — Connect a container to a network
  ${p}ncr  — Create a network
  ${p}nx   — Disconnect a container from a network
  ${p}ni   — Display detailed information on one or more networks
  ${p}nl   — List networks
  ${p}npr  — Prune, remove all unused networks
  ${p}nrm  — Remove one or more networks
"
alias ${p}n'?'='echo $__SCAD_NETWORK_HELP'
alias ${p}n="$d network"
alias ${p}nH="$d network"
alias ${p}nc="$d network connect"
alias ${p}ncr="$d network create"
alias ${p}nx="$d network disconnect"
alias ${p}ni="$d network inspect"
alias ${p}nl="_grc conf.dockernetwork $d network ls"
alias ${p}npr="$d network prune"
alias ${p}nrm="$d network rm"

## Plugin (p)
__SCAD_PLUGIN_HELP="
TODO
"
alias ${p}p'?'='echo $__SCAD_PLUGIN_HELP'
alias ${p}p="$d plugin"
alias ${p}pH="$d plugin"
alias ${p}pcr="$d plugin create"
alias ${p}pdi="$d plugin disable"
alias ${p}pen="$d plugin enable"
alias ${p}pi="$d plugin inspect"
alias ${p}pI="$d plugin install"
alias ${p}pl="$d plugin ls"
alias ${p}ppu="$d plugin push"
alias ${p}prm="$d plugin rm"
alias ${p}ps="$d plugin set"
alias ${p}pup="$d plugin upgrade"

## Zecret (z)
__SCAD_SECRET_HELP="
TODO
"
alias ${p}z'?'='echo $__SCAD_SECRET_HELP'
alias ${p}z="$d secret"
alias ${p}zH="$d secret"
alias ${p}zcr="$d secret create"
alias ${p}zi="$d secret inspect"
alias ${p}zl="$d secret ls"
alias ${p}zrm="$d secret rm"

## Trust (t)
__SCAD_TRUST_HELP="
TODO
"
alias ${p}t'?'='echo $__SCAD_TRUST_HELP'
alias ${p}tH="$d trust"
alias ${p}t="$d trust"
alias ${p}tkgen="$d trust key generate"
alias ${p}tkld="$d trust key load"
alias ${p}tsadd="$d trust signer add"
alias ${p}tsrm="$d trust signer remove"
alias ${p}ti="$d trust inspect"
alias ${p}trm="$d trust revoke"
alias ${p}ts="$d trust sign"


## Volume (v)
__SCAD_VOLUME_HELP="${d} VOLUME commands:
  ${p}vcr  — Create a new volume
  ${p}ve   — Check if volume exists
  ${p}vex  — Export volumes
  ${p}vim  — Import a tarball contents into a podman volume
  ${p}vi   — Display detailed information on one or more volumes
  ${p}vl   — List volumes
  ${p}vm   — Mount volume
  ${p}vpr  — Remove all unused volumes
  ${p}vre  — Reload all volumes from volume plugins
  ${p}vrm  — Remove one or more volumes
  ${p}vun  — Unmount volume
"
alias ${p}v'?'='echo $__SCAD_VOLUME_HELP'
alias ${p}vH="$d volume"
alias ${p}v="$d volume"
alias ${p}vcr="$d volume create"
alias ${p}ve="$d volume exists"
alias ${p}vex="$d volume export"
alias ${p}vim="$d volume import"
alias ${p}vi="$d volume inspect"
alias ${p}vl="$d volume ls"
alias ${p}vm="$d volume mount"
alias ${p}vre="$d volume reload"
alias ${p}vrm="$d volume rm"
alias ${p}vu="$d volume unmount"

## System (y)
__SCAD_SYSTEM_HELP="
TODO
"
alias ${p}y'?'='echo $__SCAD_SYSTEM_HELP'
alias ${p}y="$d system"
alias ${p}yH="$d system"
alias ${p}ye="$d system events"
alias ${p}ydf="$d system df"
alias ${p}yi="_grc conf.dockerinfo $d system info"
alias ${p}ypr="$d system prune"

# ## Stack (k) (swarm)
# __SCAD_STACK_HELP="
# TODO
# "
# alias ${p}k'?'='echo $__SCAD_STACK_HELP'
# alias ${p}kH="$d stack"
# alias ${p}k="$d stack"
# alias ${p}kd="$d stack deploy"
# alias ${p}kl="$d stack ls"
# alias ${p}kps="$d stack ps"
# alias ${p}krm="$d stack rm"
# alias ${p}ks="$d stack services"


# docker Kompose (k)
__SCAD_COMPOSE_HELP="
TODO
"
alias ${p}k'?'='echo $__SCAD_COMPOSE_HELP'
alias ${p}kH="$dc"
alias ${p}k="$dc"
alias ${p}kb="$dc build"
alias ${p}kB="$dc build --no-cache"
alias ${p}kd="$dc down"
alias ${p}ke="$dc exec"
alias ${p}kk="$dc kill"
alias ${p}klo="$dc logs"
alias ${p}klof="$dc logs --follow"
# alias ${p}kl="_grc $dc ls"
alias ${p}kps="_grc conf.dockerps $dc ps"
alias ${p}kp="$dc pause"
alias ${p}kP="$dc unpause"
alias ${p}kpl="$dc pull"
alias ${p}kph="$dc push"
alias ${p}kr="$dc run"
alias ${p}kR="$dc run --rm"
alias ${p}krm="$dc rm"
alias ${p}ks="$dc start"
alias ${p}ksc="$dc scale"
alias ${p}kcy="$dc restart"
alias ${p}ku="$dc up"
alias ${p}kud="$dc up -d"
alias ${p}kv="$dc version"
alias ${p}kx="$dc stop"

#${p}kudf () { $dc -f $1 up -d }


## CleanUp (rm)
# Clean up exited containers (docker < 1.13)
alias dkrmC="$d rm \$(docker ps -qaf status=exited)"

# Clean up dangling images (docker < 1.13)
alias dkrmI="$d rmi \$(docker images -qf dangling=true)"

# Pull all tagged images
alias dkplI="$d images --format \"{{ .Repository }}\" | grep -v \"^<none>$\" | xargs -L1 docker pull"

# Clean up dangling volumes (docker < 1.13)
alias dkrmV='docker volume rm $(docker volume ls -qf dangling=true)'

# # Docker Machine (m)
# alias dm='docker-machine'
# alias dma='docker-machine active'
# alias dmcp='docker-machine scp'
# alias dmin='docker-machine inspect'
# alias dmip='docker-machine ip'
# alias dmk='docker-machine kill'
# alias dmls='docker-machine ls'
# alias dmpr='docker-machine provision'
# alias dmps='docker-machine ps'
# alias dmrg='docker-machine regenerate-certs'
# alias dmrm='docker-machine rm'
# alias dms='docker-machine start'
# alias dmsh='docker-machine ssh'
# alias dmst='docker-machine status'
# alias dmS='docker-machine restart'
# alias dmu='docker-machine url'
# alias dmup='docker-machine upgrade'
# alias dmv='docker-machine version'
# alias dmx='docker-machine stop'


__SCAD_TOPLEVEL_HELP="$d Alias Help

MOST COMMON
  ${p}c Container
  ${p}i Image (search, list, inspect, build)
  ${p}n Network
  ${p}v Volume

LESS COMMON
  ${p}a Apropos
  ${p}h Help
  ${p}g Misc (one-off grab-bag commands)
  ${p}p Plugin
  ${p}s Service
  ${p}t Trust
  ${p}y sYstem
  ${p}x conteXt
  ${p}z Zecret

SYSTEMS
  ${p}k Kompose
  ${p}m Machine

HELP
  ${p}a apropos (search for any keyword in command descriptions)
  ${p}? help (this)
  ${p}  help (this)
  --help (put on the end of any alias)
  dr (docker/podman itself, alone prints full help)

TIPS
  - Tab-complete after typing an alias
  - Invoke the base command for more flexible explicit option use
  - Put additional command options at the end of any alias
  - Add a '?' to the end of any command
  - Use '^x a' to auto-expand the alias
  - Put 'export SCAD_DOCKER=podman' in your shell startup file

INFO EXAMPLES
  dil                               ## list images
  dih docker.io/library/rabbitmq:3  ## history
  dii docker.io/library/rabbitmq:3  ## image config
  dce   myrabbit env     ## print environment (via exec)
  dcst  myrabbit         ## live status
  dci   myrabbit | jq …  ## inspect many details
  dctop myrabbit         ## running process list
  dclo  myrabbit         ## examine logs
  dni   ## network info
  dvi   ## volume info
  dyi   ## system info (long)
  dydf  ## storage info

ACTION EXAMPLES
  dibr mydeb .       ## build and tag an image
  dce  myrabbit cmd  ## exec cmd
  dcri -e MYVAR=1 --network=host -v ${PWD}:/data localhost/mydeb somecmd"


_dHELP () { echo $__SCAD_TOPLEVEL_HELP }

# Apropos
__SCAD_HELPS=( $__SCAD_TOPLEVEL_HELP
               $__SCAD_CONTAINER_HELP
               $__SCAD_BUILDER_HELP
               $__SCAD_NETWORK_HELP
               $__SCAD_TRUST_HELP
               $__SCAD_SYSTEM_HELP
               $__SCAD_SECRET_HELP
               $__SCAD_VOLUME_HELP
               $__SCAD_IMAGE_HELP
               $__SCAD_COMPOSE_HELP )
da() {
    if (( $#argv == 1 ))
    then for h in $__SCAD_HELPS; do echo $h; done | grep -E '^  d\w+ +— ' | grep -i --color=always ${1}
    else for h in $__SCAD_HELPS; do echo $h; done | grep -E --color=none '^  d\w+ +— '
    fi
}

unset p d dc
