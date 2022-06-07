##################################################
# Conky Select Scripts
# Created by Special Ed
# Locate files in /usr/bin/ with 700 perms
##################################################


#############
# FUNCTIONS
#############

function_a () {
pkill conky
cp .conkyrc-original .conkyrc
conky &
exit
}

function_b () {
pkill conky
cp .conkyrc-version1 .conkyrc
conky &
exit
}

function_c () {
pkill conky
cp .conkyrc-version2 .conkyrc
conky &
exit
}

function_d () {
clear
}

function_e () {
clear
}

function_f () {
clear
}

function_g () {
clear
}

function_h () {
clear
}

function_i () {
clear
}

function_j () {
clear
}

function_k () {
clear
}

function_l () {
clear
}

function_m () {
clear
}

function_n () {
clear
}

function_o () {
clear
}

function_p () {
clear
}

function_q () {
clear
}

function_r () {
clear
}

function_s () {
clear
}

function_t () {
clear
}

function_u () {
clear
}

function_v () {
clear
}

function_w () {
clear
}

function_x () {
clear
exit
}


while : # Loop forever
do
clear
cat << !

 ----------------------------------------------------------
 |          C O N K Y    S E L E C T    M E N U           |
 ----------------------------------------------------------
 | a) conky-original   i)                  q)             |
 | b) conky-version1   j)                  r)             |
 | c) conky-version2   k)                  s)             |
 | d)                  l)                  t)             |
 | e)                  m)                  u)             |
 | f)                  n)                  v)             |
 | g)                  o)                  w)             |
 | h)                  p)                  x) exit menu   |
 ----------------------------------------------------------

!

###########################################
# FUNCTION CHOICES - NO NEED TO EDIT BELOW
###########################################

echo -n "  Your choice? : "
read choice

case $choice in
a) function_a ;;
b) function_b ;;
c) function_c ;;
d) function_d ;;
e) function_e ;;
f) function_f ;;
g) function_g ;;
h) function_h ;;
i) function_i ;;
j) function_j ;;
k) function_k ;;
l) function_l ;;
m) function_m ;;
n) function_n ;;
o) function_o ;;
p) function_p ;;
q) function_q ;;
r) function_r ;;
s) function_s ;;
t) function_t ;;
u) function_u ;;
v) function_v ;;
w) function_w ;;
x) function_x ;;

*) echo "\"$choice\" is not valid "; sleep 2 ;;
esac

done
