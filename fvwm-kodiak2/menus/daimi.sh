# File:     daimi.sh
# Author:   Mads N Noe <mntnoe (@) gmail.com>
# Licence:  as-is
# Modified: 2008-08-14
#
# University stuff. Examples in the comments for recursively adding LaTeX 
# files for some courses, and then some svn commands. Quite handy...

cat << eos
DestroyMenu recreate MenuDaimi
AddToMenu MenuDaimi     
+ "dBerLog"                                     Title
#find $HOME/B/l/aflv_* -name "*.tex" -printf '+ %%24x24-unknown.png%%"%f"\t Exec exec gvim -c "cd %H" %p\n'|sort -nr
+ " "                                           Nop
+ "dConc"                                       Title
#find $HOME/C/l/aflv_* -name "*.tex" -printf '+ %%24x24-unknown.png%%"%f"\t Exec exec gvim -c "cd %H" %p\n'
+ " "                                           Nop
+ "dDB"                                         Title
#find $HOME/B/l/aflv_* -name "*.tex" -printf '+ %%24x24-unknown.png%%"%f"\t Exec exec gvim -c "cd %H" %p\n'|sort -nr
#echo '+ "&grpaflv" Exec exec gvim -c "cd $HOME/D/grp" -p $HOME/D/grp/*.tex'
#find $HOME/D/grp -name "*.tex" -printf '+ %%24x24-unknown.png%%"%f"\t Exec exec gvim -c "cd %H" %p\n' |sort -nr
+ " "                                           Nop
eos

cat << eos
+ ""                                            Nop
+ "%24x24-keyring.png%ssh-&add"                 Exec exec ssh-add
+ "%24x24-unknown.png%&Update"                  Exec exec urxvt -e sleepdo 1 svn update ~/B/l ~/C/l ~/D/l
+ "%24x24-unknown.png%&Commit"                  Exec exec urxvt -e sleepdo 1 _svn_ci ~/B/l ~/C/l ~/D/l
+ ""                                            Nop
+ "%24x24-edit.png%&Edit"                       Exec exec gvim ~/.fvwm/menus/daimi.sh
eos

# vim: set ft=fvwm:
