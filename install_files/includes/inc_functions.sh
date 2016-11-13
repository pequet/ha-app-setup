#!/bin/bash

# this script is part of https://github.com/pequet/ha-app-setup

# ----------------------------------------------------------------------

source $dir_includes/inc_loaded.sh

# ----------------------------------------------------------------------

# title

title() {
    m=$(($counter% $((${#shell_colors_arr[@]}-1))+1));
    printf ${shell_colors_arr[$m]}
    echo -e "\n ${1^^}\n\n";
}

# progressbar

progressbar() {
    m=$(($counter% $((${#shell_colors_arr[@]}-1))+1));
    printf ${shell_colors_arr[$m]}
    width=110
    x=$(printf "%.0f" $(echo "scale=2; $counter / $install_total * $width" | bc))
    y=$(printf "%.0f" $(echo "scale=2; $counter / $install_total * 99" | bc))
    echo;
    for ((a=1; a <= x ; a++)); do printf "█"; done
    for ((a=1; a <= $((width-x)) ; a++)); do printf "▒"; done
    echo -e " ($y%)\n"
}

# ----------------------------------------------------------------------

# end