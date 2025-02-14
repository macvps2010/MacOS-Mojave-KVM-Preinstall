echo Installing Software...
sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip &>/dev/null &
unzip ngrok-stable-linux-amd64.zip1 &>/dev/null &
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
./ngrok tcp 3388 &>/dev/null &
sudo apt update -y
sudo apt install wget git qemu-system qemu-utils python3 python3-pip -y 
git clone https://github.com/foxlet/macOS-Simple-KVM.git
cd macOS-Simple-KVM
sudo python3  -m pip install click
./jumpstart.sh --mojave
echo "Downloading Mac OS Mojave Disk..." 
wget -q --show-progress --no-check-certificate -O MyDisk.qcow2 https://tinyurl.com/9v4p8d5c
cpus=$(lscpu | grep CPU\(s\) | head -1 | cut -f2 -d":" | awk '{$1=$1;print}')
availableRAMcommand="free -m | tail -2 | head -1 | awk '{print \$7}'"
availableRAM=$(echo $availableRAMcommand | bash)
echo HEADLESS=1 MEM=$availableRAM"M" CPUS=$cpus SYSTEM_DISK=MyDisk.qcow2 ./headless.sh > silence.sh
chmod +x silence.sh
nohup ./silence.sh &>/dev/null &
sudo qemu-system-x86_64 -vnc :0 -hda MyDisk.qcow2 -smp cores=$cpu  -m 8192M -machine usb=on -device usb-tablet > /dev/null 2>&1
echo "All Done !!! Your Mac OS VM now Ready to use !!!"
echo "Open VNC Viewer and connect with port 5900"
echo "Your VM Specs: $availableRAM"M" / $cpus CPUs"
echo "User: Mojave-User"
echo "Pass: 123456"
cpu=$(echo nproc | bash)
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sleep 43200
