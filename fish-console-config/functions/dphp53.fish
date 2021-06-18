# Defined in - @ line 1
function dphp56 --wraps='docker exec -it --user=nikita php56 fish' --description 'alias dphp56 docker exec -it --user=nikita php56 fish'
  docker exec -it --user=nikita -w=/projects/(basename (pwd)) php56 fish $argv;
end
