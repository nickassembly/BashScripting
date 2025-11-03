# permissions: ls -l to list permissions on files 
# user, group, others
# r = read, w = write, x = execute
# eg. -rw-r--r-- (user rw- group r-- others r--)

#!/usr/bin/env bash
name="world"

# single quote doesn't recognize variable syntax
echo "hello $name!"

# subshell () most common use is command substitution
var=$(pwd)
echo $var

# conditionals
if [[ first_condition ]]; then
    echo "first condition true"
elif [[ second_condition ]]; then
    echo "second condition true"
else
    echo "no conditions true"
fi # close out with fi

# other conditionals
val=""
[[ -z $val ]] # Var is null (empty)
[[ -n $val ]] # Var is not null

# File checks
file="./snippets"
[[ -f $file ]] # file exists
[[ -d $file ]] # dir exists
[[ -e $file ]] # file/dir exists
[[ -r $file ]] # file is readable
[[ -w $file ]] # file is writeable
[[ -x $file ]] # file is executable

# String comparison 
val="a"
[[ "$val" == "a" ]] # Equal
[[ "$val" != "b" ]] # Not equal

# Numerical comparison
num=1
[[ "$num" -eq 1 ]] # Equal
[[ "$num" -ne 2 ]] # Not Equal
[[ "$num" -lt 2 ]] # Less than
[[ "$num" -le 2 ]] # Less than or equal
[[ "$num" -gt 1 ]] # Greater than
[[ "$num" -ge 1 ]] # Greater than or equal

# logical AND, OR
[[ $val -gt 5 && $val -lt 10 ]] || [[ $val -gt 5 && $val -lt 10 ]]

# other commands
# getting user input prompt, command
# echo "username"
# read -r name
# echo "Welcome, $name"

# read -p "Do you want to continue? (Y/n) " resp
# if [[ $resp != "Y" ]]; then
#     exit 1
# fi
# echo "Continuing..."

# Make bash more sane
# In general you should always use this command 
set -euo pipefail
# what set -euo pipefail does
# set -e           # Exit on error
# set -u           # Exit on unset variable
# set -o pipefail  # Exit on pipe fail

# Arrays
my_arr=(1 2 3 4 5)
echo ${my_arr[0]} # 1
echo ${my_arr[@]} # @ refers to all elements (1 2 3 4 5)
echo ${#my_arr[@]} # prints length of the array

my_arr=(6 7 8 9 10)
for item in "${my_arr[@]}"; do
    echo $item
done

# pattern matching -- eg check a file for matches
for item in $(ls); do
    echo "$item"
done

# wait until true example (while loop)

# pod_name="myapp"
# namespace="default"

# while true; do
#     status=$(kubectl get pod $pod_name -n $namespace --no-headers -o custom-columns=":status.phase")
#     if [[ "$status" == "Running" ]]; then
#         break
#     else
#         echo "Waiting for pod $pod_name to get into a running state.."
#         sleep 1
#     fi
# done
# echo "Pod $pod_name is running."

# working with multiple scripts
# Sourcing (same shell script calls other scripts in context of same shell)
# . ./script.sh

# Subshell (multiple scripts have their same context)
# ./script.sh

# PATH - environment variable that is set in the shell and lets it know where to search
#        when running commands. 

# Add directory to the path
# PATH=$PATH:$HOME/<name of scripts directory>/bin
# e.g. -- export PATH=$PATH:$HOME/.scripts/bin 

# make sure to add it to your ~/.bashrc 
# this allows you to run scripts as commands, like myscript vs ./myscript 

# Process for creating a new script
# 0. Figure out what you want to do
# 1. Identify tools you'll want to use (most scripts are stitching tools together)
# 2. Sketch it out in the terminal
# 3. Copy it into a script
# 4. Pull out variables and inputs (parameterize)
# 5. Add guards and checks (guard clauses checking for files, etc.)
# 6. Add loops / refactor if needed
# 7. Break into smaller files if it is getting too large


