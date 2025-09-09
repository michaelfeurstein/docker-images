#!/bin/bash
# references:
#   1) https://medium.com/@BioCatchTechBlog/passing-arguments-to-a-docker-container-299d042e5ce
#   2) https://refine.dev/blog/bash-script-arguments/#implementing-flags-and-options
#   3) https://stackoverflow.com/a/16496491/693052

# Initialize our own variables
OPTIND=1         # Reset in case getopts has been used previously in the shell.
notation=""
storyboard=""

usage() { echo "Usage: $0 [-n <kv|cnl>] [-s <path to storyboard>]" 1>&2; exit 1; }

while getopts ":h:n:s:" opt; do
    case "$opt" in
    h)
        usage
        ;;
    s)  
        storyboard=${OPTARG}
        ;;
    n)  
        notation=${OPTARG}
        ;;
    *)
        usage
        ;;
    esac
done

shift $((OPTIND-1))

[ "${1:-}" = "--" ] && shift

echo "notation='$notation', storyboard=$storyboard, Leftovers: $@"
echo "calling: /usr/bin/nxsh /usr/local/sbl/${notation}_tester.tcl ${storyboard}"
eval "/usr/bin/nxsh /usr/local/sbl/${notation}_tester.tcl ${storyboard}"
echo -e "\n###\n\n Find the generated.html file:\n\n   a) in your mounted output Volume via Docker Desktop -> Volumes -> output -> generated.html \n   b) using docker cp <imageid>:/usr/local/sbl/storyboards/output/generated.html <path to your local machine directory>\n"


# initial version
#
#args_array=("$@")
#for i in "${args_array[@]}"
#do
#  :
#  echo "### Got variable $i ###"
#done
#echo "args_count = $#"
#echo "calling: /usr/bin/nxsh $@"
#eval "/usr/bin/nxsh /usr/local/sbl/kv_tester.tcl $@"

# EOF
