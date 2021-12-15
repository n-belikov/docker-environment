# Defined in - @ line 1
function a
    set w /projects/(string replace $HOME/Projects/ '' -- (pwd));
    set b (basename (pwd));
    set str (string escape --style=regex "a $argv");
    docker exec -it --user=nikita -w=$w -e PHP_IDE_CONFIG="serverName=$b" php73o fish -c $str
end

