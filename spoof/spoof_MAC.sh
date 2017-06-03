export SUDO_ASKPASS="$HOME/askpass.sh"

sudo -A ifconfig wlp3s0 down
sudo -A ifconfig wlp3s0 hw ether FE:ED:DE:AD:BE:EF
sudo -A ifconfig wlp3s0 up

