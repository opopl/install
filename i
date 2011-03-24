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
vrt=$HOME/vrt
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

atool		- archiving tool
vrt PLUGIN	- for vim plugins etc.

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


#git clone {{{

gc(){
git clone $*
}

#}}}

main(){
# {{{

case "$1" in
  atool | ranger) [ -d "$1dir" ] && rm -rf "$1dir"; tar xvzf $1.tar.gz; cd "$1dir"; 
 	case $1 in 
	 	atool)  cnf hi; cd - ;;
		ranger) ./setup.py install --prefix $HOME ;;
	esac
  ;;
  "vrt") #VIMRUNTIME{{{
  	shift;
        cd $unpackdir
	while [ ! -z "$1" ]; do
		case "$1" in
		  	tbibtools) 
			gc "http://github.com/tomtom/tbibtools_vim"
			;;
		esac
	  	shift
	done	  
  ;;
#}}}
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


