# Arch Linux Notes

For more help, check the [**Arch Wiki**](wiki.archlinux.org)!

(Note this will be very unorganized sorry. Also this is not finished yet.)

## Prerequisites
* A plainly installed Arch system
* Assuming using NVIDIA (because that's what I use)
* Assuming using GRUB (because that's what I use)
* That's it I guess.

## Editing pacman.conf

We want to make sure that pacman settings are good before moving on with the rest of the notes. 
This is to ensure that we can install the packages we want to install, and they will install as
quick as possible.

1. Open /etc/pacman.conf using a text editor (vim or nano)
2. Make changes.
   * Uncomment ```Color``` because why not I guess.
   * Uncomment ```ParallelDownloads``` and change it from 5 to the number of threads your CPU has
     * Threads are the number of CPU cores * 2.
   * Add ```ILoveCandy``` (it makes funny pacman progress bar)
   * Scroll down and uncomment ```[multilib]``` and ```Include ```right below it.
     * This allows us to install 32-bit applications like steam.
3. Save and exit the file.

## NVIDIA BS
Nvidia is kinda dumb, so you gotta do all of this stuff to install the proprietary NVIDIA Drivers.

**MAKE SURE** the "linux-headers" package is installed first.
1. Install all of the NVIDIA packages using this command

   ```
   sudo pacman -S nvidia-dkms libglvnd nvidia-utils opencl-nvidia lib32-libglvnd lib32-nvidia-utils lib32-opencl-nvidia nvidia-settings
   ```
   
2. Add nvidia modules to your mkinitcpio.
   * Use a text editor to open /etc/mkinitcpio.conf
   * Change ```MODULES=()```
     to be: ```MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)```.
   * Save and exit the file.
   * Run ``` mkinitcpio -P ``` just in case.

3. Ensure DRM (no not digital rights management) is loaded.
   * Using a text editor, edit /etc/default/grub.
   * In ```GRUB_CMDLINE_LINUX_DEFAULT=""```, add ```nvidia-drm.modeset=1``` to the end inside the quotes.
   * Save and exit the file.
   * Remake the grub config by typing ```grub-mkconfig -o /boot/grub/grub.cfg```.

4. Add a pacman hook.
   * Using a text edtior, make a new file at /etc/pacman.d/hooks/nvidia.hook
     * If /etc/pacman.d/hooks doesn't exist, just make the folder using ```mkdir /etc/pacman.d/hooks```
   * Type the following inside of the file.
     ```
     [Trigger]
     Operation=Install
     Operation=Upgrade
     Operation=Remove
     Type=Package
     Target=nvidia

     [Action]
     Depends=mkinitcpio
     When=PostTransaction
     Exec=/usr/bin/mkinitcpio -P
     ```
   * Save and exit the file.
5. Pat yourself on the back because you did it!
## Xorg stuff
1. Run this command to install all of the xorg packages.
```
sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xorg-xclock xterm
```
2. Type ```startx``` to see if everything works. You should see some windows pop up.


