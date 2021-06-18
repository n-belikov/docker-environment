# Defined in - @ line 1
function dphp73 --wraps='docker exec -it --user=nikita php73 fish' --description 'alias dphp73 docker exec -it --user=nikita php73 fish'
  docker exec -it --user=nikita -w=/projects/(basename (pwd)) php73 fish $argv;
end
