# TODO
# - --help H to all
# - add color to drh
# - enable grc to supported commands
# - pipe inspect commands into jq

#
# Defines Docker aliases.
#
# Author: Micah Elliott

#
# Aliases
#

# p=d
p=dd

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

_grc() {
    if [[ -z $GRC ]]; then
        echo -e '\033[0;31mInstall GRC for docker color! https://github.com/garabik/grc\033[0m'
        $@
    else
        grc $@
    fi
}


# Docker
# alias dk='docker'
alias dr='docker'
alias 'd?'=drh
alias 'dr?'='docker --help'

## Misc (m)
# alias dmdf=''
# alias dme=''
# alias dm=''
alias dms='_grc docker search'
alias dmv='_grc docker version'


## Builder (b)
alias 'db?'='docker builder'
alias dbH='docker builder   build --help'
alias dbb='_grc docker builder build'
alias dbB='_grc docker builder build --tag'
alias dbpr='docker builder prune'

## conFig (f)
alias dfcr='docker config create'
alias dfin='docker config inspect'
alias dfls='docker config ls'
alias dfrm='docker config rm'

## Container (c)
# alias dc='docker container'
alias dcH='docker container --help'
alias 'dc?'='docker container'
alias dC='docker container'
alias dca='docker container attach'
alias dcci='docker container commit'
alias dccp='docker container cp'
alias dccr='docker container create'
alias dcd='docker container diff'
alias dce='docker container exec'
alias dcE='docker container exec -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t'
alias dcex='docker container export'
alias dcin='docker container inspect'
alias dck='docker container kill'
alias dcl='docker container logs'
alias dcL='docker container logs -f'
alias dcls='docker container ls'
alias dcp='docker container pause'
alias dcpt='docker container port'
alias dcpr='docker container prune'
alias dcrn='docker container rename'
alias dcS='docker container restart'
alias dcrm='docker container rm'
alias dcr='docker container run'
alias dcR='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm'
alias dcRs='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm --entrypoint /bin/bash'
alias dcs='docker container start'
alias dcst='docker container stats'
alias dcx='docker container stop'
alias dctop='docker container top'
alias dcP='docker container unpause'
alias dcup='docker container update'
alias dcw='docker container wait'

## conteXt
alias dxcr='docker context create'
alias dxex='docker context export'
alias dxim='docker context import'
alias dxin='docker context inspect'
alias dxls='docker context ls'
alias dxrm='docker context rm'
alias dxup='docker context update'
alias dxu='docker context use'

## Image (i)
alias 'di?'='docker image'
alias dib='docker image build'
alias dih='docker image history'
alias diim='docker image import'
alias diin='docker image inspect'
alias dild='docker image load'
alias dils='_grc docker image ls'
alias dipr='docker image prune'
alias dipl='_grc docker image pull'
alias dipu='docker image push'
alias dirm='docker image rm'
alias disv='docker image save'
alias dit='docker image tag'
# missing from docker
alias dis='_grc docker search'

## Network (n)
# alias dn='docker network'
alias dncr='docker network create'
alias dnc='docker network connect'
alias dnx='docker network disconnect'
alias dnin='docker network inspect'
alias dnls='_grc docker network ls'
alias dnpr='docker network prune'
alias dnrm='docker network rm'

## Plugin (p)
alias dpcr='docker plugin create'
alias dpdi='docker plugin disable'
alias dpen='docker plugin enable'
alias dpin='docker plugin inspect'
alias dpi='docker plugin install'
alias dpls='docker plugin ls'
alias dppu='docker plugin push'
alias dprm='docker plugin rm'
alias dps='docker plugin set'
alias dpup='docker plugin upgrade'

## Zecret (z)
alias dzcr='docker secret create'
alias dzin='docker secret inspect'
alias dzls='docker secret ls'
alias dzrm='docker secret rm'


## Trust (t)
alias dtkgen='docker trust key generate'
alias dtkld='docker trust key load'
alias dtsadd='docker trust signer add'
alias dtsrm='docker trust signer remove'
alias dtin='docker trust inspect'
alias dtrm='docker trust revoke'
alias dts='docker trust sign'


## Volume (v)
# alias dkv='docker volume'
alias dvc='docker volume create'
alias dvin='docker volume inspect'
alias dvls='docker volume ls'
alias dvpr='docker volume prune'
alias dvrm='docker volume rm'

## System (y)
# alias dy='docker system'
alias dye='docker system events'
alias dydf='docker system df'
alias dyi='_grc docker system info'
alias dypr='docker system prune'

## Stack (k)
# alias dk='docker stack'
alias dkd='docker stack deploy'
alias dkls='docker stack ls'
alias dkps='docker stack ps'
alias dkrm='docker stack rm'
alias dks='docker stack services'


# docker Kompose (k)
alias dk='docker-compose'
alias dkb='docker-compose build'
alias dkB='docker-compose build --no-cache'
alias dkd='docker-compose down'
alias dke='docker-compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`'
alias dkk='docker-compose kill'
alias dkl='docker-compose logs'
alias dkL='docker-compose logs -f'
alias dkls='_grc docker-compose ps'
alias dkps='_grc docker-compose ps'
alias dkp='docker-compose pause'
alias dkP='docker-compose unpause'
alias dkpl='docker-compose pull'
alias dkph='docker-compose push'
alias dkps='docker-compose ps'
alias dkr='docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines`'
alias dkR='docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines` --rm'
alias dkrm='docker-compose rm'
alias dks='docker-compose start'
alias dksc='docker-compose scale'
alias dkS='docker-compose restart'
alias dku='docker-compose up'
alias dkU='docker-compose up -d'
alias dkv='docker-compose version'
alias dkx='docker-compose stop'




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


drh() {
    echo 'Docker Alias Help

MOST COMMON
  db Builder
  dc Container
  di Image
  dn Network
  dv Volume

LESS COMMON
  df conFig
  dx conteXt
  dp Plugin
  ds Service
  dt Trust
  dy sYstem
  da stAck
  dx conteXt
  dz Zecret

SYSTEMS
  dk Kompose
  dm Machine

HELP
  d? help (this)
  --help (put on the end of any alias)
  dr (docker itself, alone prints full help)

TIPS
  - Put command options at the end of any alias
  - Tab-complete after typing an alias
  - Invoke the base command by capitalizing second letter'
}


unset p
