# Unit 4: Management of Operating Systems

In this unit, we will learn how to use, configure and manage operating systems. We will start with the configuration of _MS Windows_ operating systems and then move on to _GNU/Linux_ operating systems.

## Booting the Operating System

The process of booting an operating system involves loading the necessary files and programs to start the system. The boot process is divided into two main stages:

<figure markdown="span">
```mermaid
flowchart LR
subgraph stage1["1st stage"]
    direction TB
    A[button] --> B
    B[Start firmware] --> POST
    subgraph POST["POST sequence"]
        direction LR
        C{power-on-self-test}
        C --> |POST fails| D
        C -->|POST succeeds| E
        D[Halt]
    end
    E[Load partition table] --> F
    F[Load Bootloader]
end
subgraph stage2["2nd stage"]
    direction TB
    H[Bootloader]
    H --> I[Load Kernel]
    I --> J[Mount file systems]
    J --> K[Start init process]
    K --> L[Start system services]
    L --> M[Start user interface]
end
stage1 --> stage2
style D stroke-dasharray: 5 2
```
    <figcaption>Boot sequence</figcaption>
</figure>

<!-- <figure markdown="span">
```mermaid
flowchart LR
subgraph stage1["1st stage"]
    direction TB
    A[fa:fa-power-off\nPower\nbutton] -- > B
    B[Start firmware] -- > POST
    subgraph POST["POST sequence"]
        direction LR
        C{fa:fa-list-check\npower-on-self-test}
        C -- > |POST fails| D
        C -- >|POST succeeds| E
        D[fa:fa-ban\nHalt]
    end
    E[Load partition table] -- > F
    F[Load Bootloader]
end
subgraph stage2["2nd stage"]
    direction TB
    H[Bootloader]
    H -- > I[fab:fa-linux / fab:fa-windows / fab:fa-apple\nLoad Kernel]
    I -- > J[fa:fa-folder-tree\nMount file systems]
    J -- > K[far:fa-circle-play\nStart init process]
    K -- > L[fa:fa-volume-low fa:fa-print fa:fa-wifi fa:fa-ellipsis\nStart system services]
    L -- > M[fa:fa-user fa:fa-display\nStart user interface]
end
stage1 -- > stage2
style D stroke-dasharray: 5 2
```
    <figcaption>Boot sequence</figcaption>
</figure> -->


- **1st stage**: When the power button is pressed, the system starts the firmware and performs a Power-On Self-Test (POST) sequence. If the POST sequence fails, the system halts. If the POST sequence succeeds, the system loads the partition table and then the bootloader.
- **2nd stage**: The bootloader loads the kernel, mounts the file systems, starts the init process, system services, and the user interface.

### Windows 11 operating system boot and shutdown process

To access the Windows 11 system boot options, go to `Start`/`Settings`/`Recovery`/`Advanced startup` and select `Restart now`.

Once the system restarts, we find a series of **boot options** if we select `Troubleshoot` / `Advanced options`.

![Windows 11 advanced startup options](ud4/w11_opciones_avanzadas.png){width=75%}

The Windows 10 boot options are as follows:

- **System Restore**. With this option we can use a restore point saved on the computer to restore Windows.
- **Command Prompt**. It allows us to use the command prompt to solve advanced problems.
- **System Image Recovery**. We can recover Windows with a specific system image.
- **Startup Settings**. This option allows us to change the startup behavior of Windows.
- **Startup Recovery**. We can fix problems that prevent Windows from starting.

When we access the **`Startup Settings`** we find different options that can be used to repair startup problems or run diagnostics.

![Windows 11 Startup Settings](ud4/w11_config_inicio.png){width=50%}

These options are the following:

- **Enable debugging**. Starts Windows in debug mode for troubleshooting purposes.
- **Enable boot logging**. Creates a file that includes all drivers installed during startup that can be useful for troubleshooting.
- **Enable low resolution video**. Starts Windows using the video driver defined with a low resolution and refresh rate. This mode is useful if the screen has been configured with a value that the monitor cannot display.
- **Enable safe mode**. It uses a minimal set of device drivers and services to start Windows.
- **Enable Safe Mode with Networking**. Adds the network services and drivers we need to access the Internet and other computers on the network.
- **Enable Safe Mode with Command Prompt**. Performs the same function as Safe Mode, except it starts in text mode instead of graphical mode.
- **Disable Enforce Signed Drivers**. Allows drivers that contain incorrect signatures to be installed.
- **Disable Early-Launch Antimalware Protection**. Prevents the driver from starting against malicious software, allowing drivers that may contain malware to be installed.
- **Disable Automatic Restart After Error**. Prevents Windows from automatically restarting if a failure causes the system to fail. This option should be selected when Windows is stuck in a loop where an error is generated, the system restarts, and the error is generated again.

The usual way to stop Windows is by selecting the option to shut down the operating system, there are also other options. In the taskbar, specifically on the Windows start button, we find the following:

- **Shutdown**. This option causes an orderly shutdown of the system.
- **Restart**. It is used when you want to turn off and turn on the computer. The operating system closes all open programs and restarts itself. This operation is usually performed when we install new hardware or software and the system has to activate the changes made.
- **Suspend**. It is an option similar to turning off the computer, with the difference that the power keeps the information in the memory active and allows the computer to restart at the same point where we were when pressing any key. When we suspend the system we have to make sure that the computer has a power supply, since otherwise all the information from the session would be lost.
- **Hibernate**. Similar to the suspend option, but it dumps the information from the memory to the hard disk so that if the computer runs out of power we do not lose the information. This option is not available by default, and is enabled and disabled in Control Panel / Power Options.

![Windows shutdown options `Alt`+`F4`](ud4/w11_cerrar.png)

## User sessions

A **session** is the set of processes and system objects that represent a single user who is using a system at a given time.

In order to **log in** to the operating system, the user has to go through this process, which consists of identifying the user, usually by means of a user name and subsequently certifying that the user who wants to use the computer is who he really says he is. To do this certification, it is usual to use a password, although it can also be certified by means of biometric elements or other types.

![Options menu `Ctrl`+`Alt`+`Del`](ud4/w11_ctrl_alt_supr.png)

Operating systems can allow the execution of one or more sessions, either in graphical mode or in text mode, simultaneously.

Once the user has finished working with the system, the most convenient option is to close the session or stop the system, although in operating systems we also find other options, such as:

- **Close session**. This option is used when we want to end the active work session. With this option **all open programs are closed** and the computer is left ready to be used by another user **without turning it off**.
- **Change user**. It closes the session of the active user **without closing the programs** but allowing another user to start a new work session. The **first user can always resume his work** with the programs in the same state as when he changed users.
- **Lock**. If we click on this option we lock the computer leaving the programs that are running in memory running and preserving the information. This option allows the user to move away from the computer without putting the security of the system at risk. It is also possible to configure the system to automatically lock after a period of user inactivity.

### Session management in Windows 11

In the Windows 11 operating system we can manage the way we log in to the computer. Normally, the system identification method consists of entering a password, but currently Windows also offers identification through *Hello. To do this, go to Start and right-click on the active user and select Change account settings / Sign-in options

![Windows 11 sign-in options](ud4/w11_opciones_inicio_sesion.png){width=50%}

The available sign-in options are:

- **Facial recognition (Windows Hello)**. This identification is done using a special camera that scans the user's face using infrared rays.
- **Fingerprint recognition (Windows Hello)**. It allows access to the system using a fingerprint reader connected to the computer. We can find laptops that have this sensor built-in from the factory.
- **PIN (Windows Hello)**. Allows you to create a PIN to log into Windows.
- **Security key**. Allows you to use a physical device, similar to a USB flash drive, which is used instead of using the user name and password. These security keys usually have a fingerprint or a PIN associated with them in case the user loses the device.
- **Password**. This is the most well-known login system. In addition to the password, there is also the possibility of creating a hint to remember it in case of forgetting it.
- **Image password**. Allows you to choose an image and the gestures that the user will make on it to create their own password.

## Graphical user interface

In an operating system that starts in graphical mode, if the installation has been correct, the first thing that appears on the screen when we log in is the desktop. This desktop is made up of a background image where we normally find icons, windows and a task bar.

In a graphical operating system, the desktop is the main work screen. This screen is the starting point for doing any activity within the operating system.

The main objects on the desktop are:

- **Icons**. Icons are symbols that are used to represent objects, which can be files, disk drives, a printer, etc. When we double-click on an icon, a window opens that shows the related information or runs the linked application. Icons can be selected by clicking. Once selected, we can move them from one place to another, copy them, delete them, etc. We can also change the name of the icon, customize it, and create new ones.
- **Task bar** or ***dock***. It shows the quick-start applications and those that are currently open. It can be found anywhere on the screen, although it is usually at the bottom.
- **Notification area**. The notification area shows data such as the time, sound icons, active applications, etc. This area also allows us to check messages from the applications that we have installed in the operating system. To reduce the accumulation of elements, operating systems usually hide the icons in the notification area when they have not been used for a certain time. In Windows systems, we can find it at the far right of the taskbar.
- **Dialog box**. Dialog boxes are a type of window that allow communication between the user and the computer system. The most common type of dialog box is the one that only informs the user and only offers the option of accepting the message, although there are also question or confirmation dialog boxes, which in addition to showing information offer alternatives to the user.
- **Contextual menu**. To access the contextual menu we use the *right mouse button*. Depending on the type of object selected, the contextual menu options vary.
- **Windows**. The elements of the windows are:
- **Title bar**. This element *identifies the window* with a name.
- **Minimize, maximize and close buttons**. With these buttons we can minimize the window, that is, send it to the taskbar or *dock* to empty the desktop; Maximize it so that the window occupies the entire screen or the maximum size defined by this window, and close it, thus removing it from the desktop permanently. The size of the windows can be changed manually, just drag the edge (top, bottom or side) to expand that side. In Windows we find these three buttons in the upper right part of the window. Not all windows have them or allow changing the size; dialog boxes can only be closed and it is not possible to change the size.
- **Menu bar**. In Windows systems it is located under the title bar of the window and shows the options of the application opened in the same window.
- **Scroll bars** or ***scroll***. They can be found horizontally or vertically and appear when the content of the window is larger than this.

!!!tip "**Windows Keyboard Shortcuts**"

    Windows operating systems have a series of **keyboard shortcuts** that **allow you to perform tasks more quickly**. Some of the most common are the following page: [Keyboard shortcuts in Windows](https://support.microsoft.com/en-us/windows/windows-keyboard-shortcuts-dcc61a57-8ff0-cffe-9796-cb9706c75eec)

!!!note "**The *Windows key***"

    The vast majority of keyboards sold have a key with the *Windows* logo on it. Its main function is to open the operating system's start menu.

    It is not unique to *Windows* systems. In 1984, the *X Window System*, the graphical standard for *Unix* systems, implemented support for the modifier keys `Meta`, `Super`, `Hyper`, `Shift`, `Control`, `Alt` and `AltGr`. On personal computers, the number of keys was reduced.

    The *Windows* key, as we know it, appeared in 1994 on the *Microsoft Natural Keyboard* and quickly became a de facto standard adopted by most manufacturers.

    On operating systems other than *Windows*, this key is referred to as `Super` or `Meta`.

### Virtual desktops

Virtual desktops allow users to organize themselves better when they have many windows open at once. It's like having different monitors than the operating system, but they are not real and, in fact, they are all on the same monitor. We can have a desktop with the programs we are using, for example a virtual machine and other tools such as a text editor, and another desktop with leisure applications, so that we do not have so many applications visible at the same time so as not to lose concentration.

To create virtual desktops in Windows 11, press the key combination `Win` + `Tab`. To add a new desktop, click on the `New desktop` option, and you can repeat the process to add all the necessary desktops.

To delete a virtual desktop, click the button to close the desktop; in this case, the applications will not close, but will move to another desktop that is active.

Keyboard shortcuts for virtual desktops in Windows 11:

| Keyboard shortcut | Function |
|:-:|:-|
| `Win` + `Tab` | Open virtual desktop view |
| `Win` + `Ctrl` + `D` | Add new virtual desktop |
| `Win` + `Ctrl` + `F4` | Close active virtual desktop |
| `Win` + `Ctrl` + `->` | Switch to right desktop |
| `Win` + `Ctrl` + `<-` | Switch to left desktop |

### Accessibility

Some people may have physical limitations in using computer systems, both with hardware and software.

The accessibility tools of an operating system are those that make it easier to help people with visual, auditory, motor, or cognitive disabilities to use the computer.

The most important accessibility options in the Windows 11 operating system are the following:

- **Make the mouse and keyboard easier to use**. It allows you to change the color and size of the pointers and control the mouse with the keyboard. You can also configure the primary and secondary mouse buttons, adjust the speed, etc. In the case of the keyboard, we find options to use shortcuts such as `Ctrl` + `Alt` + `Del` with a single key and to increase or decrease the speed of key repetition. It is also possible to control the keyboard with the mouse using the on-screen keyboard.
- **Speech and sound recognition**. In cases where it is not possible to access the computer using the keyboard and mouse, the voice recognition options can be used. This allows us to use the microphone to control programs and use the voice assistant, called *Cortana*, which will help us to do tasks with the computer. Audible alerts can be replaced by visual alerts. Windows 11 also allows computer sounds to be sent through a single channel, instead of both the right and left channels, which is useful for people with partial hearing loss or deafness in one ear.
- **Cognitive improvements**. In these cases, _Windows 11_ allows you to eliminate animations to minimize distractions. You can also change the fonts to use less congested ones, improving the space between lines and words.

Other options that we can use to facilitate the use of the operating system are:

- Change the **contrast**, since there are themes available to suit all needs.
- Use the **reading** app, which lets you choose speed, pitch, or volume, and is known as Narrator in Windows 11.
- Use **Braille** displays and keyboards.
- **Magnify** objects on the screen and adjust color, window transparency, and effects using screen magnification apps like Magnifier.

## Directory tree structure

Automatic information processing is one of the fundamental elements in the computer world, so it is very important to have the data you want to work with organized in a logical and coherent way so that you can easily access it at the desired time. Structures such as **files and directories** are used to carry out this organization.

A file is a set of structured data that is stored on a device and can be used by applications. They are named this way in reference to traditional office files, written on paper, since they are similar to their paper equivalent.

These files can be created, deleted, relocated, compressed, executed, etc. There are different types of files, depending on the content of the information they store, from program files to common data files.

When we organize the information on a storage device into directories, we can separate the files from different programs and group files with similar content. If there are many files within a directory, they can be grouped by creating subdirectories. In reality, directory and subdirectory are two ways of referring to the same concept, the difference is that subdirectory is used to refer to a directory that has been created within another.

::: note
A file is a set of data that is stored on a device. A directory is a set of files or other directories that are grouped according to their content following certain criteria.
:::

To perform operations on a file or directory we need to refer to them. To refer to a file or directory we have to tell the operating system the path it has to follow to get there. This path is called the access path or path or, in English, *Path*.

![File path](ud4/w11_archivos_ruta.png)

An absolute path is the path that must be followed from the root directory to a certain directory or file. The root directory is the first directory in a hierarchy.

A path can be relative, in which case the path from the directory we are in to the directory we want to access is indicated, or absolute, where the entire path of the file is indicated including the root directory.
