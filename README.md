# DeviceTree Dagu TWRP

> Device tree and recovery-side files for building TWRP for the **Dagu** device.
> thanks:Kyuofox

[中文](#中文) | [English](#english)

## 中文

### 项目简介

本仓库用于保存 **Dagu（设备代号：`dagu`）** 的 TWRP device tree 及 recovery 相关文件，供 Android/TWRP 构建环境使用。

本项目不是官方 TWRP 项目，也不代表 Android 或设备厂商。刷入 recovery 或其他镜像前，请确认设备型号、分区布局和镜像来源完全匹配，并提前做好数据备份。

### 参考链接

- 本人酷安帖子：<https://www.coolapk.com/feed/68684878?s=ZGQ3YmI1NGExYThhMjk3ZzZhODk4MDhjega1660>

上面的链接是本项目的相关参考资料。若链接内容、构建方式或设备信息与当前文件不一致，请以本仓库实际内容和你的设备实测结果为准。

### 目录说明

- `BoardConfig.mk`：设备及构建参数
- `device.mk`、`Android.mk`、`Android.bp`：设备模块和构建配置
- `twrp_dagu.mk`：TWRP 产品配置
- `recovery.fstab`：recovery 分区挂载配置
- `recovery/root/`：recovery ramdisk、初始化脚本、VINTF 配置及相关二进制文件
- `gpt-utils/`：GPT/存储相关工具源码及构建文件
- `libinit/`：设备初始化代码
- `kernel-headers/`：构建所需的内核头文件
- `prebuilt/`：预编译的 kernel、DTB、DTBO 及模块
- `security/`：recovery 使用的证书文件

### 构建提示

1. 准备与设备 Android 版本及 TWRP 分支匹配的 Android/TWRP 源码树和完整构建环境。
2. 将本仓库放入源码树中与构建系统匹配的 device tree 路径，例如：

   ```bash
   mkdir -p device/<vendor>/dagu
   git clone https://github.com/akers4238/devicetree-dagu-twrp.git device/<vendor>/dagu
   ```

3. 初始化构建环境并选择 Dagu 对应的 TWRP 产品目标。产品目标名称以你的源码树为准，常见示例：

   ```bash
   source build/envsetup.sh
   lunch twrp_dagu-eng
   mka recoveryimage
   ```

4. 如果源码树中的路径、产品名或构建命令不同，请按对应 TWRP 分支的要求调整。

### 注意事项

- `prebuilt/` 中包含较大的二进制文件，请确认其来源、版本和再分发许可。
- 不要将本仓库生成的镜像刷入其他型号或分区布局不同的设备。
- 刷机存在数据丢失、无法启动甚至设备损坏的风险，请自行承担并保留可恢复的原厂镜像。
- **Android 16 特别说明：**如果目标设备运行 Android 16，构建前需要将 `prebuilt/kernel` 替换为该设备自带的原厂 Android 16 内核（必须与目标设备和系统版本匹配），不要直接使用不兼容的预编译内核；替换后还应确认 DTB、DTBO、内核模块以及 `BoardConfig.mk` 配置相互兼容。
- 建议在提交新版本前记录 kernel、DTB、DTBO 和模块的来源及版本信息。

## English

### Overview

This repository contains the **Dagu** device tree (`dagu`) and recovery-side files for building TWRP in a compatible Android/TWRP source tree.

This is not an official TWRP project and is not affiliated with Android or the device manufacturer. Before flashing recovery or any other image, verify the exact device model, partition layout, software branch, and image compatibility. Back up your data first.

### Reference

- Related CoolAPK post: <https://www.coolapk.com/feed/68684878?s=ZGQ3YmI1NGExYThhMjk3ZzZhODk4MDhjega1660>

The link above is provided as related project reference material. If the linked content differs from the current files or build instructions, use the repository contents and results verified on your own device as the source of truth.

### Directory layout

- `BoardConfig.mk`: device and build parameters
- `device.mk`, `Android.mk`, `Android.bp`: device modules and build definitions
- `twrp_dagu.mk`: TWRP product configuration
- `recovery.fstab`: recovery mount configuration
- `recovery/root/`: recovery ramdisk, init scripts, VINTF files, and related binaries
- `gpt-utils/`: GPT/storage-related utility sources and build files
- `libinit/`: device initialization code
- `kernel-headers/`: kernel headers required by the build
- `prebuilt/`: prebuilt kernel, DTB, DTBO, and modules
- `security/`: certificate files used by recovery

### Build notes

1. Prepare an Android/TWRP source tree and a complete build environment matching the device Android version and TWRP branch.
2. Place this repository in the device-tree path expected by your source tree, for example:

   ```bash
   mkdir -p device/<vendor>/dagu
   git clone https://github.com/akers4238/devicetree-dagu-twrp.git device/<vendor>/dagu
   ```

3. Initialize the build environment and select the Dagu TWRP product target. The exact target name depends on your source tree; a common example is:

   ```bash
   source build/envsetup.sh
   lunch twrp_dagu-eng
   mka recoveryimage
   ```

4. Adjust the path, product name, and build command if they differ in your TWRP branch or Android tree.

### Important notes

- `prebuilt/` contains relatively large binary artifacts. Verify their provenance, version, and redistribution terms before using or redistributing them.
- Do not flash images built from this repository to another model or to a device with a different partition layout.
- Flashing involves risks including data loss, boot failure, and permanent device damage. Proceed at your own risk and keep recoverable stock images.
- **Android 16-specific note:** If the target device runs Android 16, replace `prebuilt/kernel` with the stock/bundled Android 16 kernel from that device before building. It must match the target device and software version; do not use an incompatible prebuilt kernel. After replacing it, verify that the DTB, DTBO, kernel modules, and `BoardConfig.mk` settings are compatible with one another.
- When publishing an updated build, record the source and version of the kernel, DTB, DTBO, and modules whenever possible.

### Disclaimer

Use this project at your own risk. No warranty is provided, and the maintainers are not responsible for data loss or device damage.
