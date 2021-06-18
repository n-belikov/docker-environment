# Defined in - @ line 1
function dnode
  docker run --rm -p 3000:3000 -v (pwd):"/app" -w "/app" --user=1000:1000 -it node $argv;
end
