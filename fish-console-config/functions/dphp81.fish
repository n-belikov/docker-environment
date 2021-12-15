# Defined in - @ line 1
function dphp81 --wraps='docker exec -it --user=nikita php81 fish' --description 'alias dphp81 docker exec -it --user=nikita php81 fish'
  docker exec -it --user=nikita -w=/projects/(string replace $HOME/Projects/ '' -- (pwd)) php81 fish $argv;
end

# Defined in - @ line 1
function sudphp81
  docker exec -it --user=root -w=/projects/(string replace $HOME/Projects/ '' -- (pwd)) php81 fish $argv;
end

# Defined in - @ line 1
function php81 --wraps='docker exec -it --user=nikita php81 fish' --description 'alias dphp81 docker exec -it --user=nikita php81 fish'
  docker exec -it --user=nikita -w=/projects/(string replace $HOME/Projects/ '' -- (pwd)) php81 fish -c "$argv";
end
