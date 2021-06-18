# Defined in - @ line 1
function a
	set w /projects/(string replace $HOME/Projects/ '' -- (pwd));
	docker exec -it --user=nikita -w=$w php74 fish -c "a $argv"
end

