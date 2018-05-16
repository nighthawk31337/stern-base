alias l='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias lal='ls -al --color=auto'

alias mmm='mount /mnt/spin; cd /data'
alias m8='mount -t nfs 192.168.1.108:/pb /mnt/spin; cd /data'

alias spin='cd /mnt/spin'
alias sam='cd /mnt/spin/sam'

alias bdir='cd /mnt/spin/sam/batman_dk'
alias brun='/mnt/spin/sam/batman_dk/build/at91sam9g45/gnu/Debug/game.exe'
alias bcp='cp /mnt/spin/sam/batman_dk/build/at91sam9g45/gnu/Debug/game.exe .'
alias bdbg='gdbserver localhost:2222 /mnt/spin/sam/batman_dk/build/at91sam9g45/gnu/Debug/game.exe'

alias tdir='cd /mnt/spin/sam/transformers'
alias trun='/mnt/spin/sam/transformers/build/at91sam9g45/gnu/Debug/game.exe'
alias tcp='cp /mnt/spin/sam/transformers/build/at91sam9g45/gnu/Debug/game.exe .'
alias tdbg='gdbserver localhost:2222 /mnt/spin/sam/transformers/build/at91sam9g45/gnu/Debug/game.exe'

alias insamp='insmod /mnt/spin/kernel/modules/amp/amp.ko'
alias insi2s='insmod /mnt/spin/kernel/modules/i2s/i2s.ko'
alias insc='insmod /mnt/spin/kernel/modules/amp/amp.ko; insmod /mnt/spin/kernel/modules/i2s/i2s.ko'

