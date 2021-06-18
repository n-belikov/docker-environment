# Defined in - @ line 1
function dmysql --wraps='docker exec -it --user=root mariadb bash' --description 'alias dmysql docker exec -it --user=root mariadb bash'
  docker exec -it --user=root mariadb bash $argv;
end
