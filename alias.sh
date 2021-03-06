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
p=${SCAD_PREFIX-dd}

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
    if [[ -z $GRC ]]; then
        echo -e '\033[0;31mInstall GRC for docker color! https://github.com/garabik/grc\033[0m'
        $@
    else
        grc $@
    fi
}

## Docker top-level command aliases
alias dr='docker'
alias ${p}'?'="_${p}HELP"
# alias ${p}'?'=ddH
alias ${p}H='docker --help'
# alias ${p}'?'='docker --help'

## Misc (m)
# alias dmdf=''
# alias dme=''
# alias dm=''
alias ${p}ms='_grc docker search'
alias ${p}mv='_grc docker version'

alias ${p}mrmv='docker volume rm $(docker volume ls -f dangling=true -q)'

######################################################################
## Builder (b)
__SCAD_BUILDER_HELP="
TODO
"
alias ${p}b'?'='echo $__SCAD_BUILDER_HELP'
alias ${p}bH='docker builder'
alias ${p}b='docker builder'
alias ${p}bH='docker builder   build --help'
alias ${p}bb='_grc docker builder build'
alias ${p}bB='_grc docker builder build --tag'
alias ${p}bpr='docker builder prune'

## conFig (f)
__SCAD_CONFIG_HELP="
TODO
"
alias ${p}f'?'='echo $__SCAD_CONFIG_HELP'
alias ${p}f='docker config'
alias ${p}fH='docker config'
alias ${p}fcr='docker config create'
alias ${p}fin='docker config inspect'
alias ${p}fls='docker config ls'
alias ${p}frm='docker config rm'

## Container (c)
__SCAD_CONTAINER_HELP="Docker CONTAINER commands:
  ${p}c    — Invoke the bare docker container command
  ${p}ca   — Attach local standard input, output, and error streams to a running container
  ${p}cci  — Commit a new image from a container’s changes
  ${p}ccp  — Copy files/folders between a container and the local filesystem
  ${p}ccr  — Create a new image from a container’s changes
  ${p}cd   — Diff/inspect changes to files or directories on a container’s filesystem
  ${p}ce   — Exec-run a command in a running container
  ${p}cei  — Exec-run interactive tty
  ${p}cex  — Export a container’s filesystem as a tar archive
  ${p}cin  — Inspec/display detailed information on one or more containers
  ${p}ck   — Kill one or more running containers
  ${p}cl   — Logs of a container
  ${p}cL   — Logs, in follow mode
  ${p}cls  — List containers
  ${p}clsa — List ALL containers, even those not running
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
alias ${p}cH='docker container'
# alias ${p}C='docker container'
alias ${p}c='docker container'
alias ${p}ca='docker container attach'
alias ${p}cci='docker container commit'
alias ${p}ccp='docker container cp'
alias ${p}ccr='docker container create'
alias ${p}cd='docker container diff'
alias ${p}ce='docker container exec'
alias ${p}cei='docker container exec -i -t'
alias ${p}cex='docker container export'
alias ${p}cin='docker container inspect'
alias ${p}ck='docker container kill'
alias ${p}cl='docker container logs'
alias ${p}clf='docker container logs --follow'
alias ${p}cls='docker container ls'
alias ${p}clsa='docker container ls -a'
alias ${p}cp='docker container pause'
alias ${p}cpt='docker container port'
alias ${p}cpr='docker container prune'
alias ${p}crn='docker container rename'
alias ${p}ccy='docker container restart'
alias ${p}crm='docker container rm'
alias ${p}cr='docker container run --rm'
alias ${p}crD='docker container run --detach --rm --name'
alias ${p}cri='docker container run -i -t --rm'
alias ${p}cris='docker container run -i -t --rm --entrypoint /bin/bash'
alias ${p}cs='docker container start'
alias ${p}cst='docker container stats'
alias ${p}cx='docker container stop'
alias ${p}ctop='docker container top'
alias ${p}cP='docker container unpause'
alias ${p}cup='docker container update'
alias ${p}cw='docker container wait'

## conteXt
__SCAD_CONTEXT_HELP="
TODO
"
alias ${p}x'?'='echo $__SCAD_CONTEXT_HELP'
alias ${p}x='docker context'
alias ${p}xH='docker context'
alias ${p}xcr='docker context create'
alias ${p}xex='docker context export'
alias ${p}xim='docker context import'
alias ${p}xin='docker context inspect'
alias ${p}xls='docker context ls'
alias ${p}xrm='docker context rm'
alias ${p}xup='docker context update'
alias ${p}xu='docker context use'

## Image (i)
__SCAD_IMAGE_HELP="Docker IMAGE commands:
  ${p}i    — Invoke the bare docker image command
  ${p}ib   — Build an image from a Dockerfile
  ${p}iB   — Build an image with a tag
  ${p}ih   — Show the history of an image
  ${p}iim  — Import the contents from a tarball to create a filesystem image
  ${p}iin  — Display detailed information on one or more images
  ${p}ild  — Load an image from a tar archive or STDIN
  ${p}ils  — List images
  ${p}ipr  — Remove unused images
  ${p}ipl  — Pull an image or a repository from a registry
  ${p}iph  — Push an image or a repository to a registry
  ${p}irm  — Remove one or more images
  ${p}isv  — Save one or more images to a tar archive (streamed to STDOUT by default)
  ${p}it   — Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  ${p}is   — Find/search Docker Hub for images
"
alias ${p}i='docker image'
alias ${p}i'?'='echo $__SCAD_IMAGE_HELP'
alias ${p}iH='docker image'
alias ${p}ib='docker image build'
alias ${p}iB='docker image build -t'
alias ${p}ih='docker image history'
alias ${p}iim='docker image import'
alias ${p}iin='docker image inspect'
alias ${p}ild='docker image load'
alias ${p}ils='_grc docker image ls'
alias ${p}ipr='docker image prune'
alias ${p}ipl='_grc docker image pull'
alias ${p}ipu='docker image push'
alias ${p}irm='docker image rm'
alias ${p}isv='docker image save'
alias ${p}it='docker image tag'
# missing from docker
alias ${p}is='_grc docker search'

## Network (n)
__SCAD_NETWORK_HELP="
  ${p}nc  — Create a network
  ${p}ncr — Connect a container to a network
  ${p}nx  — Disconnect a container from a network
  ${p}nin — Display detailed information on one or more networks
  ${p}nls — List networks
  ${p}npr — Prune, remove all unused networks
  ${p}nrm — Remove one or more networks
"
alias ${p}n'?'='echo $__SCAD_NETWORK_HELP'
alias ${p}nH='docker network'
alias ${p}n='docker network'
alias ${p}nc='docker network connect'
alias ${p}ncr='docker network create'
alias ${p}nx='docker network disconnect'
alias ${p}nin='docker network inspect'
alias ${p}nls='_grc docker network ls'
alias ${p}npr='docker network prune'
alias ${p}nrm='docker network rm'

## Plugin (p)
__SCAD_PLUGIN_HELP="
TODO
"
alias ${p}p'?'='echo $__SCAD_PLUGIN_HELP'
alias ${p}pH='docker plugin'
alias ${p}p='docker plugin'
alias ${p}pcr='docker plugin create'
alias ${p}pdi='docker plugin disable'
alias ${p}pen='docker plugin enable'
alias ${p}pin='docker plugin inspect'
alias ${p}pi='docker plugin install'
alias ${p}pls='docker plugin ls'
alias ${p}ppu='docker plugin push'
alias ${p}prm='docker plugin rm'
alias ${p}ps='docker plugin set'
alias ${p}pup='docker plugin upgrade'

## Zecret (z)
__SCAD_SECRET_HELP="
TODO
"
alias ${p}z'?'='echo $__SCAD_SECRET_HELP'
alias ${p}zH='docker secret'
alias ${p}z='docker secret'
alias ${p}zcr='docker secret create'
alias ${p}zin='docker secret inspect'
alias ${p}zls='docker secret ls'
alias ${p}zrm='docker secret rm'

## Trust (t)
__SCAD_TRUST_HELP="
TODO
"
alias ${p}t'?'='echo $__SCAD_TRUST_HELP'
alias ${p}tH='docker trust'
alias ${p}t='docker trust'
alias ${p}tkgen='docker trust key generate'
alias ${p}tkld='docker trust key load'
alias ${p}tsadd='docker trust signer add'
alias ${p}tsrm='docker trust signer remove'
alias ${p}tin='docker trust inspect'
alias ${p}trm='docker trust revoke'
alias ${p}ts='docker trust sign'


## Volume (v)
__SCAD_VOLUME_HELP="
TODO
"
alias ${p}v'?'='echo $__SCAD_VOLUME_HELP'
alias ${p}vH='docker volume'
alias ${p}v='docker volume'
alias ${p}vc='docker volume create'
alias ${p}vin='docker volume inspect'
alias ${p}vls='docker volume ls'
alias ${p}vpr='docker volume prune'
alias ${p}vrm='docker volume rm'

## System (y)
__SCAD_SYSTEM_HELP="
TODO
"
alias ${p}y'?'='echo $__SCAD_SYSTEM_HELP'
alias ${p}yH='docker system'
alias ${p}ye='docker system events'
alias ${p}ydf='docker system df'
alias ${p}yi='_grc docker system info'
alias ${p}ypr='docker system prune'

## Stack (k)
__SCAD_STACK_HELP="
TODO
"
alias ${p}k'?'='echo $__SCAD_STACK_HELP'
alias ${p}kH='docker stack'
alias ${p}k='docker stack'
alias ${p}kd='docker stack deploy'
alias ${p}kls='docker stack ls'
alias ${p}kps='docker stack ps'
alias ${p}krm='docker stack rm'
alias ${p}ks='docker stack services'


# docker Kompose (k)
__SCAD_COMPOSE_HELP="
TODO
"
alias ${p}k'?'='echo $__SCAD_COMPOSE_HELP'
alias ${p}kH='docker-compose'
alias ${p}k='docker-compose'
alias ${p}k='docker-compose'
alias ${p}kb='docker-compose build'
alias ${p}kB='docker-compose build --no-cache'
alias ${p}kd='docker-compose down'
alias ${p}ke='docker-compose exec'
alias ${p}kk='docker-compose kill'
alias ${p}kl='docker-compose logs'
alias ${p}kL='docker-compose logs --follow'
alias ${p}klf='docker-compose logs --follow'
alias ${p}kls='_grc docker-compose ps'
alias ${p}kps='_grc docker-compose ps'
alias ${p}kp='docker-compose pause'
alias ${p}kP='docker-compose unpause'
alias ${p}kpl='docker-compose pull'
alias ${p}kph='docker-compose push'
alias ${p}kps='docker-compose ps'
alias ${p}kr='docker-compose run'
alias ${p}kR='docker-compose run --rm'
alias ${p}krm='docker-compose rm'
alias ${p}ks='docker-compose start'
alias ${p}ksc='docker-compose scale'
alias ${p}kcy='docker-compose restart'
alias ${p}ku='docker-compose up'
alias ${p}kud='docker-compose up -d'
alias ${p}kv='docker-compose version'
alias ${p}kx='docker-compose stop'

#${p}kudf () { docker-compose -f $1 up -d }


## CleanUp (rm)
# Clean up exited containers (docker < 1.13)
alias dkrmC='docker rm $(docker ps -qaf status=exited)'

# Clean up dangling images (docker < 1.13)
alias dkrmI='docker rmi $(docker images -qf dangling=true)'

# Pull all tagged images
alias dkplI='docker images --format "{{ .Repository }}" | grep -v "^<none>$" | xargs -L1 docker pull'

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


__SCAD_TOPLEVEL_HELP="Docker Alias Help

MOST COMMON
  ${p}b Builder
  ${p}c Container
  ${p}i Image
  ${p}n Network
  ${p}v Volume

LESS COMMON
  ${p}a Apropos
  ${p}f conFig
  ${p}x conteXt
  ${p}h Help
  ${p}m Misc (one-off commands)
  ${p}p Plugin
  ${p}s Service
  ${p}t Trust
  ${p}y sYstem
  ${p}a stAck
  ${p}x conteXt
  ${p}z Zecret

SYSTEMS
  ${p}k Kompose
  ${p}m Machine

HELP
  ${p}a apropos (search for any keyword in command descriptions)
  ${p}? help (this)
  --help (put on the end of any alias)
  dr (docker itself, alone prints full help)

TIPS
  - Tab-complete after typing an alias
  - Invoke the base command for more flexible explicit option use
  - Put command options at the end of any alias"

_ddHELP () { echo $__SCAD_TOPLEVEL_HELP }

# Apropos
__SCAD_HELPS=( $__SCAD_TOPLEVEL_HELP
               $__SCAD_CONTAINER_HELP
               $__SCAD_BUILDER_HELP
               $__SCAD_CONFIG_HELP
               $__SCAD_NETWORK_HELP
               $__SCAD_TRUST_HELP
               $__SCAD_SYSTEM_HELP
               $__SCAD_SECRET_HELP
               $__SCAD_VOLUME_HELP
               $__SCAD_IMAGE_HELP
               $__SCAD_COMPOSE_HELP )
dda() { for h in $__SCAD_HELPS; do echo $h; done | grep -E '^  dd\w+ +— ' | grep -i --color=always $1 }

unset p
