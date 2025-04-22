#!/bin/bash
# reference: https://medium.com/@BioCatchTechBlog/passing-arguments-to-a-docker-container-299d042e5ce
args_array=("$@")
for i in "${args_array[@]}"
do
  :
  echo "### Got variable $i ###"
done
echo "args_count = $#"
echo "calling: /usr/bin/nxsh $@"
eval "/usr/bin/nxsh $@"

# EOF
