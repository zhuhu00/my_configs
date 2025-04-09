# Ubuntu的工具记录

## CMake 升级
正确步骤是：

1. 去 https://cmake.org/files/ 下载所需版本的源码。也可以使用wget下载，例如：
   ```
   wget https://cmake.org/files/v3.22/cmake-3.22.1.tar.gz
   ```
2. 解压：
   ```
   tar -xvzf cmake-3.22.1.tar.gz
   ```
3. 进入解压目录，配置成功之后显示：`CMake has bootstrapped. Now run make.`
   ```
    chmod 777 ./configure
    ./configure
   ```
4. 配置完成后，编译,安装，测试：
   ```
   make
   sudo make install
   cmake --version
   ```


## 0. ZSH install
1）安装zsh
```bash
sudo apt-get update
sudo apt-get install cmake git zsh
```

2）安装ohmyzsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
3）安装插件
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

4）修改zshrc
```
gedit ~/.zshrc
```

在文件中添加
```shell
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
)
alias ezs="gedit ~/.zshrc"
alias szs="source ~/.zshrc"
alias sss="source devel/setup.zsh"

# source /opt/ros/melodic/setup.zsh
# export PATH=~/anaconda3/bin:$PATH

setopt no_nomatch # 允许使用 *缺省
```

## 1. 安装terminator
```
sudo apt-get install terminator
```
之后创建目录：
```
mkdir ~/.config/terminator
gedit ~/.config/terminator/config
```
粘贴下列内容
```
[global_config]
  title_font = Ubuntu Mono 11[keybindings]
[keybindings]
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = ""
      size = 1200, 600
      type = Window
[plugins]
[profiles]
  [[default]]
    background_color = "#002b36"
    background_darkness = 0.91
    background_image = None
    background_type = transparent
    font = Ubuntu Mono 15
    foreground_color = "#e0f0f1"
    show_titlebar = False
    use_system_font = False
```
## 2. mavros pcl ROS
ROS: www.ros.org
```
sudo apt-get install ros-noetic-mavros*
sudo apt-get install ros-noetic-pcl*
sudo ln -s /usr/include/pcl-1.8/pcl /usr/include/pcl
```
## 3. 录屏软件`simplescreenrecorder`，截图软件`flameshot`，截动图软件`peek`

```
sudo apt-get install simplescreenrecorder
```
```
sudo apt-get install flameshot
```
截图软件可以在设置里面添加快捷键，方便截图，设置如下：

![image-20220731104214478](https://raw.githubusercontent.com/zhuhu00/img/master/20220731104214.png)

截动图软件：peek

1. Add the Peek stable PPA:

   ```
   sudo add-apt-repository ppa:peek-developers/stable
   ```

2. Then check updates and install peek via commands:

```
sudo apt-get update

sudo apt-get install peek	
```

## 4. 搜狗 / google输入法

搜狗：https://shurufa.sogou.com/linux
google输入法：TBA

## 5. Typora+github图床

TBA

## 6. Backward CPP

参考下面库的用法

```
 sudo apt-get install libdw-dev 
```

随后下载头文件 https://raw.githubusercontent.com/bombela/backward-cpp/master/backward.hpp 复制到根目录 `sudo mv backward.hpp /usr/include` 在`CmakeLists.txt->target_link_lib` 后面加个 "dw"

在主程序中：
```
#define BACKWARD_HAS_DW 1
#include "backward.hpp"
namespace backward{
    backward::SignalHandling sh;
}
```

## 7. VSCode编译调试ROS

见[vscode_catkin_ws](https://github.com/zhuhu00/vscode_catkin_ws)仓库

参考：https://github.com/edmundwsy/vscode-ros-config

## 8. 远程软件
nomachine：https://www.nomachine.com/download

## 9. Ubuntu 共享文件夹
需要安装Samba软件：`sudo apt install -y samba`，可以用`samba -V`查看版本

1、新建共享文件夹

获取root权限，或者登陆root账户。可在/home文件夹（或其它文件夹）下新建一个文件夹，如下面的。不用root权限也可以，后面会自动分配

![2022-08-03-15-32-14](https://raw.githubusercontent.com/zhuhu00/img/master/2022-08-03-15-32-14.png)

两个选项共享文件夹的`别名`以及是否允许`生成和删除文件`

2、设置samba的用户名，

`sudo smbpasswd -a username # username为访问的用户名`，可以是本机的，然后就开始设置密码了。

设置完密码，设置共享文件夹的用户权限：
`sudo chown username /home/xxx`

3、连接

ubuntu连接是

![2022-08-03-15-44-13](https://raw.githubusercontent.com/zhuhu00/img/master/2022-08-03-15-44-13.png)
写上`ip/xxx`，如`smb://192.168.1.102/Handheld_ws`，前面是ip的地址，后面是文件夹的名字，这样就能实现文件夹共享了。

而在Windows下面，则需要新建网络位置,之后输入的地址还是一样的ip+文件别名，只是这里只需要`\\192.168.1.102\Handheld_ws`

### samba和linux用户查看及删除

查看samba服务器中已拥有哪些用户：
`sudo pdbedit -L`

删除samba服务中的某个用户`smbpasswd -x   用户名`
 
查看Linux中所有用户：`cat  /etc/passwd`

查看Linux中添加了多少用户：`cat /etc/passwd|grep -v nologin|grep -v halt|grep -v shutdown|awk-F":" '{ print $1"|"$3"|"$4 }'|more`

查看Linux中所有组：`cat  /etc/group`

删除linux某个用户: `userdel   用户名`

删除linux中某个用户所有信息:`userdel   -r  用户名`

Using net share to create a share fold: `net usershare add share /home/$USER/ : Everyone:F guest_ok=n`

## 10. 增加、删除Swap文件
need **root** permission， add `sudo`
```shell
swapon -s （没有显示就说明不存在swap文件）

sudo swapoff /swapfile

dd if=/dev/zero of=/swapfile bs=1MB count=65536 (增加64G的swap空间，64*1024=65536)

mkswap /swapfile（格式化swap空间）

swapon /swapfile （激活swap）

free -m （查看swap空间是否添加上）

# 如果要机器重启的时候自动挂载 Swap ，那么还需要修改 fstab 配置。
# 用 vim 打开 /etc/fstab 文件，在其最后添加如下一行：
/swapfile   swap   swap    defaults 0 0
```
## 11. Docker 使用
ROS在不同Ubuntu版本的见：https://github.com/zhuhu00/Docker_utils
还有wechat或者其他的软件docker版本。


# 一些编译所需的依赖code_lib
Personal code_lib for compile libraries in Ubuntu 18.04(之后会在20.04上测试)

## livox_SDK & ROS driver
SDK: https://github.com/Livox-SDK/Livox-SDK.git
ROS driver: 
```bash
mkdir -p catkin_livox_ws/src
cd catkin_livox_ws/src
git clone https://github.com/Livox-SDK/livox_ros_driver.git
catkin_make
```
add `$(pwd)/devel/setup.zsh` to `~/.zshrc`
# 怎么添加子模块?
`git submodule add xxx.git`
进入子模块后,可以变更branch或者是tag

```bash
cd submodule_directory
git checkout v1.0
cd ..
git add submodule_directory
git commit -m "moved submodule to v1.0"
git push
```

子模块更新:`git submodule update --init --recursive`


# 已有的库
```
[submodule "gtsam"]
	path = gtsam
	url = https://github.com/borglab/gtsam.git

[submodule "ceres-solver"]
	path = ceres-solver
	url = https://github.com/ceres-solver/ceres-solver.git

[submodule "doxygen"]
	path = doxygen
	url = https://github.com/doxygen/doxygen.git

[submodule "Pangolin"]
	path = Pangolin
	url = https://github.com/stevenlovegrove/Pangolin.git
[submodule "thrust"]
	path = thrust
	url = https://github.com/NVIDIA/thrust.git
```

|Libraries|Version|Descriptions
|  ----  | ----  | ----  |
|Azure-kinect-Sensor & Azure-kinect-**ROS**-Driver|V1.4.1 & Melodic| Azure-kinect-use|
| eigen3 | 3.3.0||
|ceres-solver| 1.14.0||
|GTSAM|4.1.1|[GTSAM学习建议TODO](https://zhuanlan.zhihu.com/p/356968742)|
|Kinect2-ROS & Kinect2-SDK(libfreenect2)|melodic&||
|realsense-ros|2.3.2||
|CMake|3.16.4|需要解压，见[安装](https://blog.csdn.net/aian2132/article/details/107978876)|
|doxygen|Release_1_9_3||
|gflags|v2.2.2||
|glog|v0.5.0||
|libtorch|cuda102, 1.10.0|[下载地址](https://download.pytorch.org/libtorch/cu102/libtorch-cxx11-abi-shared-with-deps-1.10.0%2Bcu102.zip),[使用教程github](https://github.com/AllentDan/LibtorchTutorials)[使用测试](https://oldpan.me/archives/pytorch-c-libtorch-inference)|
|Opencv&opencv_contrib|3.2.0|编译安装见下|
|Pangolin|v0.6||
|thrust|1.16.0||
|**backward-cpp**|强烈推荐|[再也不用担心Segment Fault!](https://zhuanlan.zhihu.com/p/397148839)|

# GTSAM
使用系统自带的eigen版本，避免一些其他错误。
修改`gtsam/cmake/HandleEigen.cmake`
```cmake
option(GTSAM_USE_SYSTEM_EIGEN "Find and use system-installed Eigen. If 'off', use the one bundled with GTSAM" OFF)
# OFF改为ON
option(GTSAM_USE_SYSTEM_EIGEN "Find and use system-installed Eigen. If 'off', use the one bundled with GTSAM" ON)
```

# Opencv编译安装
方便使用GPU加速
```bash
cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_TBB=ON \
-D ENABLE_FAST_MATH=1 \
-D CUDA_FAST_MATH=1 \
-D WITH_CUBLAS=1 \
-D WITH_CUDA=ON \
-D BUILD_opencv_cudacodec=OFF \
-D WITH_CUDNN=ON \
-D OPENCV_DNN_CUDA=ON \
-D CUDA_ARCH_BIN=8.6 \
-D WITH_V4L=ON \
-D WITH_QT=OFF \
-D WITH_OPENGL=ON \
-D WITH_GSTREAMER=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_PC_FILE_NAME=opencv.pc \
-D OPENCV_ENABLE_NONFREE=ON \
-D OPENCV_PYTHON3_INSTALL_PATH=/usr/lib/python3/dist-packages \
-D PYTHON_EXECUTABLE=/usr/bin/python3 \
-D OPENCV_EXTRA_MODULES_PATH=/home/xxx/opencv-xx/opencv_contrib/modules \
-D INSTALL_PYTHON_EXAMPLES=OFF \
-D INSTALL_C_EXAMPLES=OFF \
-D BUILD_EXAMPLES=OFF ..
```
检查 TIFF cudastereo 有没有 ON
```bash
sudo make -j$(nproc)
sudo make install
```

ubuntu18.04 opencv3.2.0 with cuda10.2：https://blog.csdn.net/weixin_51925771/article/details/121120677
ubuntu 18.04 安装opencv3.2.0的坑：https://blog.csdn.net/dbdxnuliba/article/details/106895321
### 参考
- https://www.nanguoyu.com/opencv4-5-1-gpu
- https://github.com/zfc-zfc/install_ubuntu
