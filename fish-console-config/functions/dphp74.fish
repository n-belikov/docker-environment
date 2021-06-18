# Defined in - @ line 1
function dphp74 --wraps='docker exec -it --user=nikita php74 fish' --description 'alias dphp74 docker exec -it --user=nikita php74 fish'
  docker exec -it --user=nikita -w=/projects/(string replace $HOME/Projects/ '' -- (pwd)) php74 fish $argv;
end

# Defined in - @ line 1
function php74 --wraps='docker exec -it --user=nikita php74 fish' --description 'alias dphp74 docker exec -it --user=nikita php74 fish'
  docker exec -it --user=nikita -w=/projects/(string replace $HOME/Projects/ '' -- (pwd)) php74 fish -c "$argv";
end
