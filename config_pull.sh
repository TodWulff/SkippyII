cd ~/printer_data/config
git fetch
echo "Pulling a config restore - will restart Klipper if config changes exist."
echo 'M118 Checking config status.' > ~/printer_data/comms/klippy.serial
say Checking for updated configs.

if git status | grep -q 'Your branch is behind'; then
	git pull
	echo "Changes exist, pulled & restarting Klipper" 
	echo 'M118 GIT Repo Pull RESTART' > ~/printer_data/comms/klippy.serial
	echo RESTART > ~/printer_data/comms/klippy.serial
	say Changed detected & pulled.  Restarting printer.
else
	echo "No changes exist, configs are up to date."
	echo 'M118 No changes exist, configs are up to date.' > ~/printer_data/comms/klippy.serial
	say No changes exist, configs are up to date.
fi
