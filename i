#!/usr/bin/env bash
 
# directory where this script resides
export shd="`dirname $(readlink -f $0)`"
# name of this script 
export this_script=` basename $0 `

vim_opts="-n -p"
v="vim $vim_opts"

define_base_dirs(){
# {{{
# main Wales group software directory
export wg_dir="$shd/../../"
packdir=$HOME/arch/packed
unpackdir=$HOME/arch/unpacked
# }}}
}


set_base_vars(){
# {{{
s_purpose="installation script"
s_project="~/install"
# }}}
}

set_base_vars

display_help(){
# {{{
# general beginning part {{{
cat << EOF
=============================================
SCRIPT NAME: $this_script 
PROJECT: $s_project
PURPOSE: $s_purpose
USAGE: $this_script [ OPTIONS ] 

	OPTIONS:

	============
	General
	============

			display the help message

	vm		v(iew) m(yself), i.e., edit this script
	
	============
EOF
# }}}
# actual interesting part {{{
cat << EOF

some option

EOF
# }}}
# final general part {{{
cat << EOF
REMARKS:
AUTHOR: O. Poplavskyy
=============================================
EOF
# }}}
# }}}
}

[ -z "$*" ] && ( display_help; exit 0 )


main(){
# {{{

case "$1" in
  atool) [ -d "$1dir" ] && rm -rf "$1dir"; tar xvzf $1.tar.gz; cd "$1dir"; cnf hi; cd - ;;
  *)
  ;;
esac    # --- end of case ---

# }}}
}

# main part 
# {{{

script_opts=( $* )
define_base_dirs

while [ ! -z "$1" ]; do
  	case "$1" in
		  #{{{
	  	vm) $v $0; exit ;;
		h) display_help $*; exit ;;
	  	*) main $* && exit 0 ;;
	esac
  	shift
        #}}}
done

# }}}


