echo "Pushing a config backup."
say_wait  Pushing a kunfihg backup.
echo 'M118 Pushing a config backup...' > ~/printer_data/comms/klippy.serial

cd ~/printer_data/config
git fetch && git status
git add .
git commit -m 'printer event - automated config backup'
git push

echo "Config backup complete."
say_wait  Complete.
echo 'M118 ... complete.' > ~/printer_data/comms/klippy.serial
