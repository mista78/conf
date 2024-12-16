echo "%%%%%%" | sudo -S echo "password"
dirname=$(dirname 0)
action=${1:-install}
if [ "$action" = "install" ]; then
	xargs -d '\n' -a installe.list | xargs -p  sudo apt install -y 
elif [ "$action" = "conf" ]; then
	xargs -d '\n' -a conf.list | xargs cp -r -t ~/.config/
	cp -r $dirname/polybar-scripts ~/
else
	echo pwd
fi
