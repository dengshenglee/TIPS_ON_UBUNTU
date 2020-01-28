#pip
-i https://pypi.tuna.tsinghua.edu.cn/simple

#macbook front camera
sudo depmod
sudo modprobe -r bdc_pci
sudo modprobe facetimehd

#GigE camera

sudo vi /etc/network/interfaces
sudo ip addr flush enx000ec6a68a7b
sudo systemctl restart networking.service
sudo service network-manager restart
#删除默认的有线gateway（not ip net）
sudo route del default gw 192.168.0.1
#添加wifi为默认的有线网关
#sudo route add default gw 192.168.1.103

tcam-ctrl -l
gst-launch-1.0 tcambin ! videoconvert ! ximagesink
gst-launch-1.0 tcambin ! video/x-raw,format=RGBx,width=640,height=480,framerate=30/1 ! videoconvert ! ximagesink

#gscam(https://github.com/ros-drivers/gscam)

#tx2-zed
cd /usr/local/zed/tools
./"ZED Depth Viewer"

#git
git add .
git commit -m "info"
git push origin master

#ssh
ssh -X -p 1 nvidia@192.168.1.101

#xbox one s
jstest-gtk

sudo bluetoothctl
scan on 5C:BA:37:F5:97:1B
pair 5C:BA:37:F5:97:1B
trust 5C:BA:37:F5:97:1B
connect 5C:BA:37:F5:97:1B
remove 5C:BA:37:F5:97:1B

roscore
rosrun joy joy_node
rostopic echo joy


# nubot_ws
roslaunch nubot_common nubot.launch
roslaunch nubot_hwcontroller nubot_hwcontroller.launch
rosrun nubot_hwcontroller nubot_teleop_joy
./src/cyan_spawn_model.sh
./src/magenta_spawn_model.sh

# coach_ws
roslaunch nubot_coach nubot_coach.launch
roslaunch nubot_coach cyan_sim.launch
roslaunch nubot_coach magenta_sim.launch

# gazebo_ws
roslaunch nubot_gazebo game_ready.launch
仿真的话:gazebo->nubot->coach

#lipswitch-sleep
sudo gedit /etc/systemd/logind.conf
HandleLidSwitch=suspend <-> HandleLidSwitch=ignore
sudo service systemd-logind restart
