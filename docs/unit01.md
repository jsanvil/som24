# Unit 1: Characterization of Operating Systems

- [Introduction to Computer Systems](#introduction-to-computer-systems)
    - [Computer Science](#computer-science)
- [Computer Equipment](#computer-equipment)
    - [Computer System](#computer-system)
    - [Von Neumann Architecture](#von-neumann-architecture)
    - [Physical Components. *Hardware*](#physical-components-hardware)
    - [Logic components. *Software*](#logic-components-software)
    - [The *base* software](#the-base-software)
    - [Classification of computer systems](#classification-of-computer-systems)
- [Information representation systems](#information-representation-systems)
    - [Measurement of information](#measurement-of-information)
- [The operating system](#the-operating-system)
    - [Elements of the operating system](#elements-of-the-operating-system)
    - [Types of operating systems](#types-of-operating-systems)
- [Functions of the operating system](#functions-of-the-operating-system)
- [Process management](#process-management)
    - [Process states](#process-states)
    - [Process scheduling](#process-scheduling)
        - [First-come, first-served (FCFS)](#first-come-first-served-fcfs)
        - [Shortest job first (SJF)](#shortest-job-first-sjf)
        - [Shortest remaining time first (SRTF)](#shortest-remaining-time-first-srtf)
        - [Round-robin (RR)](#round-robin-rr)
    - [Process communication](#process-communication)
    - [Services](#services)
- [Memory](#memory)
    - [Memory paging](#memory-paging)
    - [Memory segmentation](#memory-segmentation)
    - [Virtual memory](#virtual-memory)
- [File System Management](#file-system-management)
    - [Objectives](#objectives)
    - [Key Components and Functions](#key-components-and-functions)
    - [File](#file)
    - [Directory](#directory)
    - [Metadata](#metadata)
    - [File System Types](#file-system-types)
    - [File System Compatibility](#file-system-compatibility)
    - [Comparison of File Systems](#comparison-of-file-systems)
    - [File System Operations](#file-system-operations)
    - [File System Permissions](#file-system-permissions)
    - [Data integrity](#data-integrity)
    - [Hierarchical Structure](#hierarchical-structure)
    - [Path](#path)
        - [Absolute path](#absolute-path)
        - [Relative path](#relative-path)
- [User interfaces](#user-interfaces)
    - [Origin of graphical user interfaces](#origin-of-graphical-user-interfaces)
    - [Current graphical interfaces](#current-graphical-interfaces)
    - [:material-console: Command-line interface CLI](#material-console-command-line-interface-cli)
    - [Windows command line interface](#windows-command-line-interface)
    - [The GNU/Linux text interface](#the-gnulinux-text-interface)
- [Operating System Licenses](#operating-system-licenses)
    - [Proprietary Software Licenses](#proprietary-software-licenses)
- [Current Operating Systems](#current-operating-systems)
    - [Microsoft Windows :material-microsoft-windows:](#microsoft-windows-material-microsoft-windows)
    - [GNU/Linux Distributions :simple-linux:](#gnulinux-distributions-simple-linux)
    - [Ubuntu :material-ubuntu:](#ubuntu-material-ubuntu)
- [Vocabulary](#vocabulary)

## Introduction to Computer Systems

### Computer Science

It is the field of study related to the **automatic processing of information**, with the aim of **storing**, **processing**, and **transmitting** data and information through **electronic devices**.

```mermaid
flowchart LR
    A[⌨️ 🖱️ Input data] --> B((⚙️ 🧮 Process))
    B --> C[🖥️ 🎧 Output information]
    S[( 💾 🗃️ Storage)] <.-> B
```

Data Processing Scheme:

- Data input. User interaction.
- Process. Data processing.
- Storage (save and/or load). Data could be stored or loaded.
- Information output. User feedback.

The **input** data is **processed** and **information** is obtained as **output**. Also, the data could be loaded and saved in the storage.

!!! note
    **Computer science** is the set of knowledge and techniques that make **automatic information processing** possible through computers.

    The Spanish word ***informática*** is an acronym of the words INFORmation autoMATIC.

## Computer Equipment

A computer, also known as PC, is a programmable digital electronic machine that executes a series of commands to process input data, obtaining information that is sent to output devices. They can perform various tasks with great speed.

They are composed of a physical part or hardware (electronic circuits, cables, peripherals, etc.), and a logical part or software (programs, applications, data, information, files, etc.).

### Computer System

A **computer system** allows for **storing and processing** information. It consists of ***hardware***, ***software***, and **Users**.

!!! note
    Currently, computer systems play a crucial role in organizing production and leisure processes around the world. They enable users to exchange information over virtually any distance.

    A **computer system** is the **set of elements** that makes it possible to **store and process** information automatically.

All computer systems consist of three fundamental parts:

- ***Hardware***. *Hardware* refers to the collection of electronic devices that provide the function of storing and processing information. *For example, this category includes computer equipment, peripherals, and wiring*.
- ***Software***. *Software* is the set of programs and applications that computer systems use to perform tasks required by users. *For example, this includes the operating system, web browser, office applications, etc.*
- ***Users***. This includes the people associated with the computer system, including both the users who operate it and the technical staff who create and maintain the computer system.

---

<figure markdown="span">
  ![Operating system structure. @wikipedia](unit01/Operating_system_placement.png){ width=60% }
    <figcaption>Operating system structure. @wikipedia</figcaption>
</figure>

!!! note
    Therefore, an example of a computer system could be a personal computer with its peripherals, the person using it, and the programs it contains.

    The purpose of a computer system is to optimally manage information. The computer system allows for storing and processing information and can also perform functions ranging from facilitating work for businesses to providing entertainment for users.

### Von Neumann Architecture

The **_Von Neumann_ architecture** is a model for computer systems that was proposed by the mathematician and physicist **_John von Neumann_** in 1945. This model is based on the idea that the computer system should have a **central processing unit (CPU)** that can execute instructions, a **memory** that can store data and programs, and **input/output devices** that can communicate with the user and other devices.

<figure markdown="span">
    ![Von Neumann architecture. @wikipedia](unit01/von_neumann.png){ width=60% }
    <figcaption>Von Neumann architecture. @wikipedia</figcaption>
</figure>

The _Von Neumann_ architecture consists of the following components:

- **Central Processing Unit (CPU)**. This is the part of the computer system that executes instructions. It consists of an **arithmetic logic unit (ALU)** that performs arithmetic and logical operations, a **control unit** that manages the execution of instructions, and a **register** that stores data temporarily.
- **Memory**. This is the part of the computer system that stores data and programs. It consists of **main memory**, which is used to store data and programs that are currently being executed, and **secondary storage**, which is used to store data and programs that are not currently being executed.
- **Input/Output Devices**. These are the parts of the computer system that allow the user to interact with the computer system. Examples include storage drives, keyboards, mice, screens, printers, and speakers.

### Physical Components. *Hardware*

***Hardware*** refers to the set of components that make up the **physical part** of a computer system and enable its operation.

We can categorize *hardware* components based on their location in the computer system. This results in a division between ***internal hardware***, which is usually included within the main unit and typically constitutes the *primary hardware*, and ***external hardware*** or **peripherals** of the system.

---

**Internal Components**:

- **Motherboard**. This is the main board of the computer system where different printed circuits are located to connect other *hardware* elements.

    It's called the *main board* or *motherboard*.

- **Microprocessor**. This component is responsible for executing computer programs.

    It performs instructions through simple arithmetic and logical operations.
    
    It is also known as the **Processor** or **CPU** (*Central Processing Unit*).

- **Main Memory**. This is the memory where data and programs currently being executed by the processor are temporarily stored.

    It is a **volatile memory**, meaning that it loses its contents when the computer is turned off.
  
    Another term for main memory is **RAM** (*Random Access Memory*).

- **Power Supply**. This component is used to transform the energy required by the other system components.

- **Internal Storage Devices**. These allow for the permanent storage of data and programs. Examples include an internal hard drive or a DVD/Blu-ray drive.

- **Expansion Cards**. These elements allow for the expansion of a computer system’s functions. Common types include graphics cards, network cards, and sound cards.

- **Cooling System**. These components are responsible for dissipating the heat generated by various parts of the computer system.

---

**External elements** or **peripherals**:

- **Screen**. Main **information output** device that displays the data processed by the system to the user.
- **Keyboard** and **Mouse**. Main devices that allow **input of information**.
- **Microphone** and **speakers**. They convert electrical signals into sound waves and vice versa.
- **Printer** and **scanner**. Items used for printing and scanning text or graphic data.
- External **storage** devices**. These store data permanently and can be easily moved from one system to another.
Typical examples are USB external hard drives, *pendrives* or SD cards.
- **Other** devices: game controllers, digitizing tablets, virtual reality glasses, barcode scanners, projectors, etc.

---

<figure markdown="span">
  ![Main hardware of a computer](unit01/Personal_computer_exploded.png){width=60%, height=60%}
  <figcaption>Main hardware of a computer: 1. Screen. 2. motherboard 3. CPU. 4. Main memory. 5. Expansion cards. 6. Power supply. 7. Optical disk drive. 8. Internal disk drive. 9. Keyboard. 10. Mouse.</figcaption>
</figure>

### Logic components. *Software*

The ***software*** of a computer system is the set of necessary logical components that make it possible to carry out specific tasks.

It is an indispensable part of a computer system, as it is necessary for the user to be able to perform the desired tasks comfortably.

---

Generally, *software* can be classified into two broad groups:

- **Base or system software**. This is basic to the system. It allows users and most of the *software* to communicate with the *hardware*. Without this type of *software* the computer system could not function. Examples of this type of *software* are the operating system or drivers for peripheral devices.
- **Application software**. These are programs or applications that perform specific tasks. Examples are office packages, video games or antivirus software.
In addition, application software can be classified into horizontal and vertical:
    - **Horizontal software** is that which is available to the user with predetermined characteristics and is of a generic type, such as, for example, office packages or web browsers.
    - **Vertical software** is more specific and is created to solve a specific need of a user or company.

### The *base* software

The **base** or **system software** allows users and applications to communicate with the *hardware*.

There are different types of base *software* depending on the function they perform within the computer system: **operating systems**, **peripheral drivers**, and **firmware**.

---

- The **operating system** allows the user and applications to interact with the computer system hardware. **It is the most important *software*** of a computer system, since it allows **communication between the user and the *hardware***, and **management of all system resources**, such as processes or files and directories.

- The **device driver**, or ***driver***, is the *software* that enables communication between the computer system's input/output devices and the other *software*.

- The ***firmware***, such as BIOS or UEFI, runs before the rest of the computer system's *software*. One of its most important functions is to initialize the hardware during the boot process and to manage power and temperature control.

### Classification of computer systems

Because of the great variety of computer systems we can classify them according to various criteria, such as their architecture or their function. One of the most popular classifications is the one that organizes computer systems according to their size and the resources they offer.

- Supercomputer
- Mainframe
- Server
- Microcomputer
- Mobile device
- Embedded systems

- **Supercomputer**. These computer systems have a **high computing power**, can process a large amount of data per second, and are mainly used in the world of research and development. Supercomputers can handle billions of operations per second simultaneously, as they consist of a large number of very powerful processors working as one. These computer systems are located in special facilities, usually occupy more than one room and require special cooling.

- **Mainframe**. These computer systems are typically used for companies that need to process and store a large amount of data, such as a bank's transactions or an airline's reservation management. They are computer systems with very powerful processors and a large number of storage devices. These systems can take up an entire room, but they no longer need special facilities as supercomputers do. Although their primary function is to store corporate transactions and data, in some cases they are also used, especially by large-scale e-commerce companies, as high-capacity web servers.

- **Server**. These computer systems are larger than personal computer systems but smaller than mainframe computers. They are mainly used by businesses and their main function is to process information while allowing a large number of users to be connected simultaneously. These computer systems serve users through a network and allow the sharing of resources between them.

- **Microcomputer**, **Personal Computer** or **Laptop**. They provide service to the user and are typically used for office tasks, Internet access, small business tasks and personal entertainment. These computer systems are small in size. Portable computing systems are easy to transport as they are small in size and weight and can be operated using batteries without the need to be plugged into the mains.

- **Mobile devices**. Tablets, smartphones, smartwatches, etc. Small computers with touch screens, batteries and wireless connectivity. They can do the same tasks as a personal computer but with some limitations.

- **Embedded systems** in some industrial equipment, household appliances, vehicles, home automation, etc. They are part of the systems known as ‘Internet of Things’ IoT (*Internet of Things*). This type of system is intended for personal use and allows access to the internet, receiving calls or e-mails and other more specific functions of the system in question. These computer systems allow applications to be installed and run in a similar way to other computer systems.

## Information representation systems

Computer systems are machines that automatically process information, but all the information managed by this equipment is represented by only two symbols, namely `0` and `1`, which correspond to two electrical states or two voltage levels. In electronic circuits, from a logical point of view, it is customary to represent the presence of voltage at a point in the circuit by means of the number 1, while 0 represents the absence of voltage. This terminology is known as positive logic. Negative logic can also be applied, where the meaning of these two digits is interchanged.

Each of these symbols is referred to as a **binary number** or **bit**. A *bit* is the smallest unit of information representation in a computer system.

!!!abstract "Bit"
    The **bit** is the base unit of measurement of information, indicating the minimum amount that makes up the information. It can be represented by two symbols, `0` or `1`.

Information** is the way of representing facts, objects, values or ideas that enables communication between people and the acquisition of knowledge about things. All **information consists of data**. Data are all facts or objects that have not been manipulated and once processed form information.

---

We can classify data according to the following types:

- **Numeric**. This data consists solely of numbers (0, 1, ..., 9). All kinds of mathematical operations can be performed with this data.
- **Alphanumeric**. These data are made up of a combination of letters and numbers. With this type of data, even if they are only made up of numbers, mathematical operations cannot be performed.

---

In order for this information to be understood by the computer system, a correspondence must be established between the data and these two electrical states. This correspondence is known as **information coding**. All data used by computer systems are encoded. Different computer systems may use different codes; indeed, the same computer system may use different encodings for the different electronic devices that make it up.

---

An **encoding** is a way of interpreting information. For example, the symbol `X`, using the alphabetic code, is a letter, but, if we apply the encoding of the Roman numeral system, it is the number 10.

The encoding also depends on the use to which the data will be put. For this reason, standardized codes, such as the *Unicode*, are usually used for alphanumeric data input and output, while encodings based on the binary, octal or hexadecimal numbering system are used for numeric data because of the ease with which they can be transformed into decimal or binary to perform mathematical operations.

### Measurement of information

**`bit`** (`b`) - **minimum unit of information**. May represent `0` or `1`.

**`byte`** (`B`) - base information unit. It is a **set of 8 bits**. It can represent 256 values, from 0 to 255.

| $2^8$ | $2^7$ | $2^6$ | $2^5$ | $2^4$ | $2^3$ | $2^2$ | $2^1$ |         |
|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|--------:|
|**128**| **64**| **32**| **16**| **8** | **4** | **2** | **1** |   Value |
|  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |   **0** |
|  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `1`  |   **1** |
|  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `1`  |  `0`  |   **2** |
|  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `1`  |  `1`  |   **3** |
|  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `1`  |  `0`  |  `0`  |   **4** |
|  `0`  |  `0`  |  `0`  |  `0`  |  `0`  |  `1`  |  `0`  |  `1`  |   **5** |
|       |       |       |       |  ...  |       |       |       |         |
|  `0`  |  `1`  |  `0`  |  `1`  |  `0`  |  `1`  |  `0`  |  `1`  |  **85** |
|       |       |       |       |  ...  |       |       |       |         |
|  `1`  |  `1`  |  `1`  |  `1`  |  `1`  |  `1`  |  `1`  |  `1`  | **255** |

---

If we join 8 bits we get a byte (B), which is also a very small unit of storage. With one byte we can represent 256 different combinations, from `00000000` to `11111111`.

For large volumes of information we use **multiples of the byte**.

| Name | Symbol | Base 10 |
|:--|:--:|--:|
| byte | B | $10^{0}$ = 1 |
| [kilobyte](https://es.wikipedia.org/wiki/Kilobyte "Kilobyte") | kB | $10^{3}$ = 1 000 |
| [megabyte](https://es.wikipedia.org/wiki/Megabyte "Megabyte") | MB | $10^{6}$ = 1 000 000 |
| [gigabyte](https://es.wikipedia.org/wiki/Gigabyte "Gigabyte") | GB | $10^{9}$ = 1 000 000 000 |
| [terabyte](https://es.wikipedia.org/wiki/Terabyte "Terabyte") | TB | $10^{12}$ = 1 000 000 000 000 |
| [petabyte](https://es.wikipedia.org/wiki/Petabyte "Petabyte") | PB | $10^{15}$ = 1 000 000 000 000 000 |
| [exabyte](https://es.wikipedia.org/wiki/Exabyte "Exabyte") | EB | $10^{18}$ = 1 000 000 000 000 000 000 |
| [zettabyte](https://es.wikipedia.org/wiki/Zettabyte "Zettabyte") | ZB | $10^{21}$ = 1 000 000 000 000 000 000 000 |
| [yottabyte](https://es.wikipedia.org/wiki/Yottabyte "Yottabyte") | YB  | $10^{24}$ = 1 000 000 000 000 000 000 000 000 |

_Table: Multiples using the International System prefixes_

---

Traditionally, in the computer world, 1 kB (kilobyte) corresponded to 1024 bytes, but according to the international system of units, 1 kB (kilobyte) corresponded to 1000 bytes, as with all other units of measurement. This generated some controversy and it was easy to make mistakes. To solve this confusion, in 1998 the _International Electrotechnical Commission_ published an appendix in the **ISO/IEC 80000** standard defining the binary prefixes, thus giving birth to the unit **kibibyte** (KiB) to designate the correspondence between 1 KiB and 1024 bytes; from this moment on, the kilobyte unit is considered valid only for the correspondence between 1 kB and 1000 bytes.

| Name | Symbol | Factor [ISO/IEC 80000](https://es.wikipedia.org/wiki/ISO/IEC_80000 "ISO/IEC 80000")\-13 |
|:--|:--:|--:|
| byte | B | $2^{0}$ = 1 |
| [kibibyte](https://es.wikipedia.org/wiki/Kibibyte "Kibibyte") | KiB | $2^{10}$ = 1024 |
| [mebibyte](https://es.wikipedia.org/wiki/Mebibyte "Mebibyte") | MiB | $2^{20}$ = 1 048 576 |
| [gibibyte](https://es.wikipedia.org/wiki/Gibibyte "Gibibyte") | GiB | $2^{30}$ = 1 073 741 824 |
| [tebibyte](https://es.wikipedia.org/wiki/Tebibyte "Tebibyte") | TiB | $2^{40}$ = 1 099 511 627 776 |
| [pebibyte](https://es.wikipedia.org/wiki/Pebibyte "Pebibyte") | PiB | $2^{50}$ = 1 125 899 906 842 624 |
| [exbibyte](https://es.wikipedia.org/wiki/Exbibyte "Exbibyte") | EiB | $2^{60}$ = 1 152 921 504 606 846 976 |
| [zebibyte](https://es.wikipedia.org/wiki/Zebibyte "Zebibyte") | ZiB | $2^{70}$ = 1 180 591 620 717 411 303 424 |
| [yobibyte](https://es.wikipedia.org/wiki/Yobibyte "Yobibyte") | YiB | $2^{80}$ = 1 208 925 819 614 629 174 706 176 |

_Table: Multiples using ISO/IEC 80000-13_

---

!!! note "Curiosity"

    As a curiosity, most manufacturers of storage devices express the capacity in the International System. For example, a USB *pendrive* of ***64 GB***, when connected to our computer will show ***59.6 GiB***.

    A similar case occurs with Internet connection providers, who express transfer speeds in Mbps (Megabits per second). For example, a connection of ***100 Mbps*** in a speed test will show ***11.9 MiBps*** (Mebibytes per second).

## The operating system

The **operating system** is the most important ***software* of a computer system**. This *software* gives the user the possibility to **interact with the computer system in an easy way**, giving the user the possibility to **manage the information and resources** available on the computer system.

Operating systems has **two basic functions**.

- **Abstraction**. Hide details of hardware configuration and provide a simple interface for users.
- **Arbitration**. To manage access to shared resources.

### Elements of the operating system

- **Kernel**. The core of the operating system. It is responsible for managing the computer system's resources, such as the processor, memory, and input/output devices. It also provides the interface between the *hardware* and the rest of the *software*.
- **Services**. These are the functions that the operating system provides to the user and other *software*. Examples include file management, printing, and network access.
- **File system**. It is responsible for managing the computer system's files and directories. It allows the user to store, organize, and access information.
- **User interface**. It is the part of the operating system that allows the user to interact with the computer system. It can be graphical, text-based, or voice-based.

<figure markdown="span">
  ![GUI (Graphical User Interface)](unit01/Budgie_Desktop_Environment.png){ width=70% }
  <figcaption>GUI (Graphical User Interface)</figcaption>
</figure>

---

<figure markdown="span">
  ![CLI (Command Line Interface)](unit01/Bash_demo.png){ width=70% }
  <figcaption>CLI (Command Line Interface)</figcaption>
</figure>

---

### Types of operating systems

- By the number of simultaneous users

    - **Single-user**. These operating systems are designed to be used by a single user at a time. Examples include Windows, macOS, and Linux.
    - **Multi-user**. These operating systems are designed to be used by multiple users at the same time. Examples include Unix and Linux.

- By the number of tasks

    - **Single-task**. These operating systems can only run one task at a time. Examples include MS-DOS.
    - **Multi-task**. These operating systems can run multiple tasks at the same time. Examples include Windows, macOS, and Linux.

- By the purpose

    - **General-purpose**. These operating systems are designed to be used for a wide range of tasks. Examples include Windows, macOS, and Linux.
    - **Special-purpose**. These operating systems are designed for a specific task. Examples include real-time operating systems and embedded operating systems.

- By licensing

    - **Proprietary**. These operating systems are owned by a company and cannot be modified by the user. Examples include Windows and macOS.
    - **Open-source**. These operating systems are developed by a community of users and can be modified by the user. Examples include Linux.

## Functions of the operating system

The **operating system** manages the computer system's resources to ensure that the user and other *software* can use them efficiently. The main functions of the operating system are:

- **Process management**. The operating system manages the computer system's processes, which are the programs that are running. It allocates resources to processes, schedules them to run on the processor, and provides mechanisms for processes to communicate with each other.
- **Memory management**. The operating system manages the computer system's memory, which is used to store data and programs. It allocates memory to processes, swaps data between memory and storage, and provides mechanisms for processes to share memory.
- **File system management**. The operating system manages the computer system's files and directories, which are used to store data. It provides mechanisms for creating, reading, writing, and deleting files, and for organizing files into directories.
- **Input/output management**. The operating system manages the computer system's input/output devices, which are used to communicate with the user and other devices. It provides mechanisms for reading data from and writing data to devices, and for controlling the flow of data between devices.
- **Security management**. The operating system manages the computer system's security, which is used to protect the system from unauthorized access and to ensure the privacy and integrity of data. It provides mechanisms for controlling access to the system, for encrypting data, and for detecting and preventing security threats.
- **Network management**. The operating system manages the computer system's network connections, which are used to communicate with other systems. It provides mechanisms for connecting to networks, for sending and receiving data over networks, and for controlling the flow of data between systems.

## Process management

A **process** is a program that is running on the computer system. The operating system manages processes to ensure that they can run efficiently and that they do not interfere with each other.

Formally a **process** is ‘A unit of activity characterized by the execution of a **sequence of instructions**, with a **current state**, and a set of associated **system resources**’.

---

In order to better understand what a process is and the difference between a program and a process, *A. S. Tanenbaum* proposes the following analogy.

> A cook bakes a birthday cake for his daughter; he has the recipe for a birthday cake and a well-equipped kitchen with all the necessary ingredients, flour, eggs, sugar, milk, etc.’.

Situating each part of the analogy it can be said that the *recipe* represents the **program** (instructions), the *cook* is the **processor** and the *ingredients* are the **data** of the program. The **process** is the *activity* of the cook reading the recipe, obtaining the ingredients and baking the cake.

---

To represent a process, the operating system uses the following information:

- **Process ID (identifier)**. This is an integer number used to identify each process.
- **Process status**. This is used to indicate the status in terms of its life cycle.
- **Resource usage**. It allows to check the use of resources used by the process, the execution time, maximum time assigned, priority, etc. This information is useful for planning the next process to be executed by the processor.
- **Process context**. For each process, the operating system stores the processor status, memory information and input/output requests.

### Process states

A process can be in one of the following states:

- **Created**. The process has been created but has not yet started running.

- **Waiting**. The process is ready to run but is waiting for the processor to become available. Reach this state when created or when it has been interrupted or the blocking condition is fulfilled.

- **Running**. The process is currently running on the processor.

- **Blocked**. The process is waiting for a resource to become available, such as a file or a network connection.

- **Terminated**. The process has finished running and has been removed from the system.

```mermaid
flowchart LR
    C((Created)) --> W((Waiting))
    W --> R((Running))
    R --> W
    R --> T((Terminated))
    R --> B((Blocked))
    B --> W
```

<!-- ```mermaid
flowchart LR
    C((Created)) --|Ready| W((Waiting))
    W --|Selected by scheduler| R((Running))
    R --|Paused| W
    W --|By other process| T((Terminated))
    R --|End| T
    R --|I/O or event| B((Blocked))
    B --|I/O or event finished| W
    B --|By other process| T
``` -->

### Process scheduling

The **process scheduler** is responsible for **deciding which process to run on the processor** at any given time. The process scheduler uses **algorithms** to determine the order in which processes are run, based on factors such as the **priority** of the process, the amount of **time** the process has been **waiting**, and the amount of time the process has been **running**.

Main goals of the process scheduler:

- **Maximize performance**. Ensure that the processor is always running a process.

- **Minimize latency or response time**. Ensure that processes are run **as soon as possible** after they are created and the waiting time is **as short as possible**. This is important for interactive applications, such as web browsers and video games.

- **Maximize fairness**. Ensure that all processes are given an equal opportunity to run.

---

!!! note "Analogy"
    Process management could be similar to **office work**. 
    
    You can have:
    
    - a list of **tasks** to be done
    - a set **priorities** for them: high, medium, low
    
    For example:
    
    You should start by doing the high priority tasks first, and when they are finished, move on to the medium priority tasks and then to the low priority tasks. Once the task is done, it is crossed out.

    This can lead to the **problem** that low priority tasks may never get done and remain on the list forever. To solve this, older tasks can be assigned high priority.

    Although process scheduling is rather more complex, to get an idea, we could compare process scheduling with the **service in a restaurant**. Service is considered **optimal when waiting times** for customers are as short as possible and no one **starves** to death.

!!! note "Algorithm"
    An **algorithm** is a **set of instructions** that are used to **solve a problem**.
    
    It can be compared to a cooking recipe, which is a set of instructions that are used to prepare a meal.

The scheduling algorithms can be classified into two **types**:

- **Non-preemptive**. The process scheduler **cannot interrupt a process that is running** to run another process. This is useful for ensuring that low-priority processes are run to completion.

- **Preemptive**. The process scheduler **can interrupt a process** that is running to run another process. This is useful for ensuring that high-priority processes are run as soon as possible.

Let's study the following scheduling algorithms:

- **Non-preemptive**:
    - **First-Come, First-Served (FCFS)**. The process that arrives first is the first to be run.
    - **Shortest Job First (SJF)**. The process with the shortest execution time is run first.
- **Preemptive**:
    - **Shortest Remaining Time First (SRTF)**. The process with the shortest remaining execution time is run first.
    - **Round-Robin (RR)**. Each process is run for a fixed amount of time, called a time slice or quantum, and then the next process is run.

---

#### First-come, first-served (FCFS)

This is the simplest scheduling algorithm. The process that arrives first is the first to be run. This algorithm is non-preemptive, meaning that once a process starts running, it cannot be interrupted until it finishes.

- Non-preemptive.
- Simple and easy to implement.
- Large waiting times.
- Slow performance.

#### Shortest job first (SJF)

This algorithm runs the process with the shortest execution time first. This algorithm is non-preemptive, meaning that once a process starts running, it cannot be interrupted until it finishes.

- Non-preemptive.
- Waiting times are smaller than FCFS.
- **Starvation**. Long processes can block the execution of short processes.
- Minimum performance.

#### Shortest remaining time first (SRTF)

This algorithm runs the process with the shortest remaining execution time first. This algorithm is preemptive, meaning that a process can be interrupted while it is running to run another process.

- Preemptive.
- Waiting times depend on arrival and duration.
- **Starvation**. Short processes can block the execution of long ones.
- Preference for short processes.

#### Round-robin (RR)

This algorithm runs each process for a **fixed amount of time**, called a time slice or **quantum**, and then runs the next process. This algorithm is **preemptive**, meaning that a process can be interrupted while it is running to run another process.

- Preemptive.
- Larger waiting times than SJF.
- Fair performance.

---

!!! note "Other scheduling algorithms"
    There are other scheduling algorithms that can be used to manage processes, such as:

    - **Priority scheduling**. The process with the highest priority is run first.
    - **FSS** (*Fair Share Scheduling*). The process is run based on the amount of resources it has used and users are given a fair share of resources.
    - **MQS** (*Multi-Queue Scheduling*). The process is run in different queues based on its priority.

    In general, operating systems use a combination of scheduling algorithms to ensure that processes are run efficiently and fairly.

### Process communication

Processes can communicate with each other in various ways. The operating system provides mechanisms for processes to communicate with each other, such as:

- **IPC** (*Inter-process communication*). Processes can communicate with each other using system calls provided by the operating system.
- **RPC** (*Remote Procedure Call*). Processes can communicate with each other over a network using remote procedure calls.

### Services

A service is a program that runs in the background and provides a specific function to the user or other programs. The operating system provides services to the user and other programs.

By example, printing service manages the printing of documents from each application.

In UNIX systems, services are called **daemons**.

## Memory

**Memory** is one of the most important resources in a computer. Memory must be **fast**, **high capacity** and **expensive**. Currently, no technology meets all three objectives simultaneously. A solution has been adopted where **the memory system is built hierarchically in layers**, where the higher layers have higher speed and cost per bit, but lower capacity than the lower layers.

<figure markdown="span">
  ![Memory hierarchy](unit01/ComputerMemoryHierarchy.png){ width=70% }
  <figcaption>Memory hierarchy</figcaption>
</figure>

There are four major storage levels:

- **Internal** – Processor registers and cache.
- **Main** – the system main memory (RAM).
- **Secondary**. Internal storage (or On-line storage). Hard drives, SSDs, etc.
- **Tertiary**. External storage (or Off-line storage). Pen drives, DVDs, cloud storage, magnetic tapes, etc.

In order for a program to run, its **instructions** and **data** must be present in the system's **main memory** (*RAM*). The **processor** can only access data that is in the main memory. The main memory is a **volatile memory**, meaning that it loses its contents when the computer is turned off.

**Memory management** refers to **operations that are responsible for optimizing memory usage** by organizing the processes running in such a way as to make the best possible use of the available space.

Main functions:

- **Allocate space to processes** that request it.
- **Virtual address space**. Separates the memory addresses used by a process from the actual physical addresses, allowing the separation of processes and increasing **security** and the effective amount of main memory.
- **Virtual memory**. When a process is too large to be loaded into memory, a part of the secondary memory (*hard disk*) is used as back-up memory. This often makes the system run much **slower**.
- **Garbage collector**. It is responsible for the automatic **release of memory** resources for a process that has terminated its execution or enters an inconsistent state.

<figure markdown="span">
  ![Virtual address space](unit01/Virtual_address_space_and_physical_address_space_relationship.png){ width=70% }
  <figcaption>Virtual address space</figcaption>
</figure>

Multitasking OS requirements:

- **Protection**. A process may not access the memory location of another process without permission.
- **Relocation**. On systems with virtual memory, programs during execution may leave memory for a time and then return, so they cannot be placed in the location they previously occupied. It must therefore be possible for them to reside in different parts of memory at different times.
- **Sharing**. It is possible for multiple processes to share information across a shared memory area.

If the system were to reserve physical memory by contiguously hosting processes, there would come a point where **external fragmentation** would occur, i.e. gaps where new processes could not be contiguously hosted.


!!! note "Tetris"
    We can compare this situation with the game of *Tetris*, where the objective is to fit the pieces together to form complete lines. In the case of memory, the pieces are the processes and the complete lines are the contiguous memory blocks. If the pieces are not placed correctly, gaps will appear that will prevent new pieces from being placed.

    <figure markdown="span">
    ![Memory fragmentation](unit01/tetris.png){ width=70% }
    <figcaption>Tetris</figcaption>
    </figure>

To solve this problem, the operating system uses **paging** and **segmentation** techniques.

<figure markdown="span">
  ![Memory fragmentation](unit01/External_fragmentation.png){ width=70% }
  <figcaption>Memory fragmentation</figcaption>
</figure>

### Memory paging

Physical memory is divided into parts of the same size called **frames**, in turn, processes are also divided into parts called **pages** of the same size as the *frames*.

A **page table** is needed to translate the logical addresses to physical addresses.

This way, processes do not need to be loaded contiguously in memory, as frames can be in different memory locations.

- Eliminates external fragmentation.
- Creates **internal fragmentation**.

**Internal fragmentation** occurs when a process page does not fill a frame of memory completely, so some memory is wasted.

!!! note "Hotel Analogy"
    Imagine a hotel where all the rooms have 4 beds. If a group of 3 people arrives, they will have to pay for the 4 beds, so one bed will be wasted.

    This is the same as internal fragmentation, where a process page does not fill a frame of memory completely, so some memory is wasted.

<figure markdown="span">
    ![Memory paging](unit01/Memory_paging.png){ width=70% }
    <figcaption>Memory paging</figcaption>
</figure>

### Memory segmentation

Memory is divided into segments of different sizes, each segment corresponds to a part of the process or a type of data.

- Eliminates internal fragmentation.
- Creates **external fragmentation**.

!!! note "Zoo Analogy"
    Imagine a zoo where are areas for different animals, such as lions, elephants, monkeys, etc. Each area is a segment of memory, and each animal is a process, so the animals are not in the same area. This is the same as memory segmentation.

### Virtual memory

Also known as **swap memory**, **swap space**, **paging file** or ***swap***, is a file or partition on disk (secondary storage or *hard disk*) that is used to temporarily store copies of processes that are removed from the main memory (RAM).

This technique allows the creation of a larger capacity virtual memory, `RAM + swap`.

Its main **disadvantage** is that it is a **slow** process (compared to using only main memory).

## File System Management

**File system management** is a crucial function of an operating system that handles the storage and retrieval of data on a computer's storage devices. It organizes data into logical units called files and directories, providing a structured way for users and applications to access and manipulate information.

### Objectives

* **Data Integrity:** Ensuring the **accuracy** and **consistency** of data stored in the file system.
* **Performance:** Optimizing file system operations for **efficient** data access and retrieval.
* **Security:** **Protecting** data from unauthorized access, modification, or deletion.
* **Reliability:** Ensuring the **availability** of data and **preventing data loss** due to system failures.

By effectively managing files and directories, the operating system provides a reliable and efficient way for users and applications to interact with data on a computer.

### Key Components and Functions

1. **File:** The **basic unit of data storage**. It contains a **collection of related information**, such as documents, images, or programs.
2. **Directory:** A **container for files and other directories**, creating a **hierarchical structure**. Directories are also known as **folders**.
    - **Subdirectories:** Directories contained within other directories. 
3. **Metadata:** Information **about files and directories**, including their **names**, **locations**, **size**, creation **date**, and access **permissions**.
4. **Storage Allocation:** **Assigning physical storage space** to files and directories on the underlying storage device (e.g., hard drive, SSD).
5. **File Access:** Handling requests from applications to **read, write or modify** files.
6. **File Deletion:** **Removing files** from the file system, often marking the storage space as available for reuse.
7. **File Recovery:** Attempting to **restore deleted** or corrupted files, **if possible**.
8. **File Sharing:** Allowing **multiple users or processes to access the same file** simultaneously, potentially with different permissions.

### File

A **file** is a **collection of data** stored on a computer system. Files can contain a wide variety of information, such as text, images, audio, video, or program code. Each file has a **unique name** that identifies it within the file system.

### Directory

A **directory** is a **container for files and other directories**. It provides a way to **organize and manage files** in a hierarchical structure. Directories can be nested within each other, creating a tree-like organization of files and directories.

### Metadata

**Metadata** is **data about data**, providing information about files and directories in the file system. Common metadata includes:

- **File Name:** The **unique identifier** for a file or directory.
- **File Size:** The **amount of storage space** occupied by the file.
- **Owner:** The **user** who created the file or directory.
- **Group:** The **group** to which the file or directory belongs.
- **Permissions:** The **access rights** granted to users or groups (e.g., read, write, execute).
- **Attributes:** Such whether the file is **read-only**, **executable**, **hidden**, etc.
- **Timestamps:** Indicating the **creation**, **modification**, and **access times** of the file.
- **Device type:** For special files like **devices** or **pipes**.
  
### File System Types

Some of most popular file systems are:

* **FAT (File Allocation Table):** A simple and widely used file system, often found in older devices. It uses a table to track the location of file on the disk.
* **NTFS (New Technology File System):** A more advanced file system developed by _Microsoft_, offering features like journaling, compression, and security.
* **ext2/3/4:** Common file systems used in _Linux_ and other _Unix_-like operating systems, known for their performance and reliability.
* **HFS+ (Hierarchical File System Plus):** The default file system for _macOS_, designed for efficient storage and retrieval of files.
* **ZFS (Zettabyte File System):** A modern file system with features like data integrity, RAID, and snapshots.

### File System Compatibility

Different operating systems support different file systems, and not all file systems are compatible with each other. For example, a USB drive formatted with _NTFS_ may not be readable on a _macOS_ system, which typically uses _HFS+_. To ensure compatibility, it is essential to choose a file system that is supported by the operating systems you plan to use.

Each operating system supports one or more file systems, depending on its design and requirements. For example:

| Operating System | File System                          |
|---------|-----------------------------------------------|
| MS-DOS  | **FAT12**, FAT16, FAT32...                    |
| Windows | **NTFS**, FAT, exFAT, ReFS...                 |
| macOS   | **HFS+**, HFS, AFP...                         |
| Linux   | **ext4**, ext2, ext3, btrfs, ReiserFS, NFS... |
| Android | **ext4**, F2FS, YAFFS, ReiserFS...            |
| Servers | **ZFS**, XFS, Btrfs, JFS, UFS...              |

### Comparison of File Systems

Each file system has its own characteristics and limitations, making it suitable for different use cases. Common factors to consider include **file size limits**, **partition size**, **permissions**, **journaling**, and **encryption**.

Here's a comparison of some popular file systems:

|File system|Filenames|File size|Partition|Permissions| Journaling | Encrypt |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| FAT32 | 8.3 | 4 GiB   | 2 TiB |  ❌ | ❌ | ❌ |
| exFAT | 255 | 127 PiB | 512 TiB |  ❌ | ❌ | ❌ |
| NTFS  | 255 | 18 EiB  | 75 ZiB |  ✅ | Partial | ✅ |
| ReFS  | 255 | 16 EiB  | 256 ZiB |  ✅ | Partial | ✅ |
| ext3  | 255 | 2 TiB   | 32 TiB |  ✅ | ✅ | ✅ |
| ext4  | 255 | 16 TiB  | 1 EiB |  ✅ | ✅ | ✅ |
| ReiserFS | 226 | 8 TiB | 16 TiB |  ✅ | ✅ | ❌ |
| HFS+  | 255 | 8 EiB   | 8 EiB |  ✅ | Partial | ✅ |

### File System Operations

File systems support a variety of operations to manage files and directories. Some common operations include:

* **Create:** Creates a new file or directory.
* **Delete:** Removes a file or directory.
* **Read:** Retrieves data from a file.
* **Write:** Stores data in a file.
* **Rename:** Changes the name of a file or directory.
* **Move:** Relocates a file or directory to a different location.
* **Copy:** Duplicates a file or directory.
* **Modify:** Changes the content or attributes of a file, such as its name or permissions.
* **Check Integrity:** Verifies the correctness and consistency of data.
* **Compress / Decompress:** Reduces or expands the size of a file.
* **Encrypt / Decrypt:** Secures data by encoding or decoding it.

### File System Permissions

File systems use **permissions** to control access to files and directories. Permissions specify which users or groups can **read**, **write**, or **execute** files, and can be set for the **users** and/or **groups**.

Common basic permission levels include:

- **Read:** Allows users to view the contents of a file.
- **Write:** Allows users to modify the contents of a file.
- **Execute:** Allows users to run a file as a program.

<figure markdown="span">
    ![File permissions](unit01/windows_permissions.png)
    <figcaption>Example of file permissions in _Microsoft Windows_</figcaption>
</figure>

In most systems, the graphical representation for **users** and **groups** is as follows:

- **User**: 👤 a person silhouette.
- **Group**: 👥 two (or more) people silhouettes.

### Data integrity

File systems use various techniques to ensure data integrity, such as:

- **Journaling:** Recording changes to files and directories in a **journal** to recover from system crashes or power failures.
- **Checksums:** Calculating a **checksum** for files to verify their integrity and detect data corruption.
- **Redundancy:** Storing multiple copies of data to protect against data loss.

### Hierarchical Structure

We need to consider a storage device must contain millions of files, so it is necessary to organize them in a hierarchical structure. This structure is similar to a tree, where the **root** is the main directory and the **branches** are the subdirectories.

- **Root directory:** The main directory of the file system.
- **Subdirectory:** A directory contained within another directory.

In a graphical representation, the hierarchical structure looks like this:

<figure markdown="span">
    ![Hierarchical structure](unit01/FilesAndFolders.png)
    <figcaption>Hierarchical structure</figcaption>
</figure>

An example of a hierarchical structure is shown below:
    
```
RootDirectory/
├── Directory1/
│   ├── File1
│   ├── File2
│   └── Directory2/
│       ├── File3
│       └── File4
└── Directory3/
    ├── File5
    └── File6
```

### Path

A **path** is a string that specifies the location of a file or directory in the file system. Paths can be **absolute** or **relative**.

- **Absolute path:** Specifies the location of a file or directory from the **root directory**.
- **Relative path:** Specifies the location of a file or directory **relative to the current directory**.

For example, in the hierarchical structure above, the absolute path to `File3` would be `/RootDirectory/Directory1/Directory2/File3`, while the relative path would be `Directory2/File3`.

In Microsoft Windows, the **backslash** **`\`** is used as the directory separator, while in Unix-like systems, the **forward slash** **`/`** is used.

An example of absolute path in _Microsoft Windows_ is `C:\Users\John\Documents\file.txt`. Where `C:` is the drive letter and root directory, `Users` is the user directory, `John` is the user name, `Documents` is a directory, and `file.txt` is a file name.

#### Absolute path

An **absolute path** is a complete path that specifies the location of a file or directory from the **root directory**. It includes all the directories and subdirectories leading to the file or directory.

Examples:

- In Microsoft Windows: `C:\Users\John\Documents\file.txt`
- In Unix-like systems: `/home/john/documents/file.txt`

Note that the root directory is represented by a **forward slash** `/` in Unix-like systems and a **backslash** `\` in _Microsoft Windows_.

#### Relative path

A **relative path** specifies the location of a file or directory **relative to the current directory**. It does not include the root directory and starts from the current working directory.

- **`.`** represents the current directory.
- **`..`** represents the parent directory.

Examples:

- `.\Documents\file.txt`
- `..\images\picture.jpg`
- `..\..\data\data.csv`

Relative paths are often used when referring to files or directories within the same directory or in a nearby directory.

## User interfaces

The user can communicate with the operating system mainly through three non-exclusive interfaces:

- **Command line interface** (**CLI** - *Command Line Interface*). Users use commands, which are nothing more than orders written in a language that the operating system understands. They consist of an order and, optionally, some parameters.
- **Graphical user interface** (**GUI** - *Graphical User Interface*). Most current operating systems provide a graphical user interface that presents a visual environment with elements such as desktops, windows, menus, icons or buttons with which the user interacts, thus sending orders to the operating system.
- **Natural language interface** (**NUI** - *Natural User Interface*). Interaction with computer equipment is carried out by recognizing the user's natural movements or actions, which it interprets as orders. *For example, Siri (macOS), Cortana (Microsoft Windows) or Google Now (Android)*.

There is no better interface than another, and their advantages and disadvantages depend on the purpose for which they are going to be used:

| Interface | Advantages | Disadvantages |
|-|-|-|
|:material-console: **CLI**| Access to all the system's functionalities. | Knowledge of the commands |
| | Ease of automation | Complexity |
| | Reduced resource consumption | |
|:material-button-cursor: **GUI**| Ease of use | Actions limited to the interface |
| | Standardized | Consumes more resources |
| | Used in most programs | |
|:material-account-voice: **NUI**| Ease of use | Inaccurate |
| | Intuitive | Simple actions |

**The most common way of interacting with operating systems is through their graphical interface**, also called **GUI** (*Graphical User Interface*). In reality, it is nothing more than a program that **facilitates communication between the computer and the user** by manipulating graphic elements **using a series of predefined actions** carried out with the mouse and and the keyboard.

> Nowadays, the use of touch screens is growing, which can complement, or even replace, the use of the mouse and the keyboard.

Before the arrival of graphical interfaces, computer systems were used through a **text interface** that basically consisted of a screen that offered only one color (on a black background) and where **only characters were displayed**. At that time, the only way for users to interact with the computer system was to know the syntax of a considerably large **set of written commands**.

As you can imagine, the visual environment offered by GUIs is a much simpler, and more intuitive, way of learning how to use a computer.

For security reasons, server systems do not usually use a graphical interface.

### Origin of graphical user interfaces

<figure markdown="span">
    ![IBM PC AT with MS-DOS Operating System (1981)](unit01/ibm_pc_at.jpg){ width="50%" }
    <figcaption>_IBM PC AT_ with _MS-DOS_ Operating System (1981)</figcaption>
</figure>

First home computers used a text interface, where the user had to type commands to interact with the computer.

The first graphical user interface was developed by researchers at _Xerox PARC_ and included in the _Xerox Star 8010_ computer in 1981. However, the design was based on the studies of scientist _Douglas Engelbart_ and on the first mouse, also designed by him.

<figure markdown="span">
    ![Prototype of the first computer mouse (1967)](unit01/first-computer-mouse.jpg){ width="50%" }
    <figcaption>Prototype of the first computer mouse (1967)</figcaption>
</figure>

<figure markdown="span">
    ![Xerox Star 8010 (1981)](unit01/xerox-star-8010.jpg){ width="40%" }
    <figcaption>_Xerox Star 8010_ (1981)</figcaption>
</figure>

On this computer, text characters were replaced by bitmaps, icons, windows, etc.

The next step was taken by Apple, which, after a visit by some of its executives to Xerox in 1979, began the development of its Apple Lisa, the first desktop computer that included a graphical interface and which began to be sold in 1983. However, it was the Apple Macintosh of 1984 that marked a before and after.

<figure markdown="span">
    ![Apple Macintosh (1984)](unit01/apple-lisa.jpg){ width="50%" }
    <figcaption>_Apple Lisa_ (1983)</figcaption>
</figure>

The following year, in 1985, Microsoft began marketing _MS Windows 1.0_, a graphical interface that ran on _MS-DOS_, the operating system that, until then, only worked with a text-based interface.

<figure markdown="span">
    ![Microsoft Windows 1.0 (1985)](unit01/windows1.png){ width="70%" }
    <figcaption>_Microsoft Windows 1.0_ (1985)</figcaption>
</figure>

### Current graphical interfaces

Today, all desktop operating systems have a graphical interface:

In **MS Windows 10**, after the paradigm shift that MS Windows 8 and 8.1 represented, with a clear orientation towards touch environments, there has been a reconciliation with environments oriented towards the use of the mouse.

The *Fluent Design* interface has been developed, which makes a transition between both types of interface (touch / mouse) in a dynamic way and adapts to different types of devices (computers, tablets, video game consoles, smartphones, embedded systems, augmented reality, etc.).

In addition, the _Start menu_ has been updated, which now combines functionality equivalent to MS Windows XP and the MS Windows 8.1 Start screen in addition to other complementary functions.

<figure markdown="span">
    ![MS Windows 10 (2014)](unit01/windows-10.jpg){ width="60%" }
    <figcaption>_MS Windows 10_ (2014)</figcaption>
</figure>

**MS Windows 11** features a user interface based on *Fluent Design* including translucency, shadows, a new color palette, new icons, and rounded edges throughout the system interface. Other system changes include new system icons, animations, and sounds. MS Windows 11 updates several system dialog boxes, such as the "battery is running out" alert, among others.

The _Start menu_ undergoes a significant redesign, eliminating the use of the *live tiles* used by MS Windows 8.x and 10 with a grid of "pinned" applications and a list of recent applications and documents.

Microsoft has also introduced a new feature called **Snap Layouts**, which allows users to quickly arrange multiple windows on the screen in predefined layouts.

The **Taskbar** has been centered by default, with the Start button and the search box in the center, and the system tray on the right.

<figure markdown="span">
    ![MS Windows 11 (2021)](unit01/windows-11.jpg){ width="60%" }
    <figcaption>_MS Windows 11_ (2021)</figcaption>
</figure>

> Unlike GNU/Linux, in Windows the graphical interface is integrated into the operating system.

In **GNU/Linux** there are a multitude of graphical environments that offer a wide range of possibilities for users. The reason is that in Unix family operating systems, the graphical interface runs as a layer above the text interface.

In Linux, the structure of the graphical interface is as follows:

```mermaid
flowchart LR
    O(Operating System) <-.-> X
    subgraph GUI
        direction TB
            X[Graphical Server] <--> W[Window Manager]
            W <--> D[Desktop Environment]
    end
    D <-.-> U[User]
```

- **Graphical Server** is the program that manages the graphical interface and is responsible for drawing windows, buttons, text boxes, etc., as well as managing the events that affect them (mouse clicks, key combinations, etc.).

    The most used are:

    - **X Windows System**. The most used graphical server in Unix-like systems.
    - **Wayland**. A new graphical server that is gradually replacing X Windows System.

- **Window managers** run on the graphical server, which are responsible for specifying how each element should be drawn. The appearance, the ability to customize, etc. depend on the window manager.
Some examples are: Kwin, Fluxbox, Openbox, Metacity or Icewm among others. To facilitate the use of window managers, libraries called toolkits have been created. The most used are:

    - GTK (Gimp toolkit)
    - QT (Cute)

- **Desktop environments**, which rely on the toolkits to offer the final appearance that the user gets. The integration between applications and the general behavior of the interface depend on them. In addition, they include a series of applications that are usually integrated into the environment, such as file managers, text editors, image viewers, etc.

    Most common desktop environments are:

    - **Gnome**. Used by default in many distributions.
    - **KDE Plasma**. The most complete and configurable. It's more similar to MS Windows.
    - **Xfce**. A lightweight desktop environment.
    - **LXDE**. Another lightweight desktop environment.
    - **E17**. A desktop environment with a futuristic appearance.
    - **Cinnamon**. Tries to emulate the appearance of MS Windows.

<figure markdown="span">
    ![Ubuntu 22.04 LTS Jammy Jellyfish with Gnome 42 environment](unit01/Ubuntu_2204_LTS_Jammy_Jellyfish.png){ width="60%" }
    <figcaption>_Ubuntu 22.04 LTS Jammy Jellyfish with Gnome 42 environment_</figcaption>
</figure>

<figure markdown="span">
    ![KDE Plasma 5.24](unit01/KDE_Plasma_524.png){ width="60%" }
    <figcaption>_KDE Plasma 5.24_</figcaption>
</figure>

### :material-console: Command-line interface CLI

The text interface was the method used by early computers to communicate with the user. It allowed users to type commands that the computer executed when the `Enter` key was pressed.

The text interface is often referred to as **Console**, **Terminal**, ***Shell***, **Command interpreter** or **Command-line interface** (even **CLI**).

Nowadays, operating systems facilitate the use of the text interface through a window, although in some cases, such as the server versions of Ubuntu and MS Windows, can operate without a graphical interface. However, it is often used in professional environments and for advanced users.

One of the **advantages** of the text interface is that it allows you to **automate the execution of several commands** by grouping them in a text file called a **script** (sometimes they are also called batch files or batch processes).

In addition, it is common for the **user to have more options** when using the text interface than when using the graphical interface.

The main drawback of the text interface is the **difficulty of learning** it for novice users.

On the other hand, **graphical interfaces** also have some **drawbacks**, especially when they are installed on computers that act as servers:

- When the computer is not serving a local user, the graphical interface **consumes resources** even if it is not used.
- **Updates** will **take longer**, because more programs need to be updated.
- The system is **more complex**, so there is a greater chance that it will offer **vulnerabilities** against possible security attacks.

The character, or set of characters, that is displayed in the text interface to indicate that it is waiting for a new command is called ***prompt*** and its content will depend on the operating system and the configuration made by the user.

By default, the MS Windows command line displays the current disk path.

```PowerShell
C:\Users\username> _
```

In Linux, although it is easily modifiable and depends on the distribution, the user name, computer name and current path are normally displayed. In addition, if it ends in a dollar sign (**`$`**), it indicates that we are acting as a normal user and if it ends in a hash sign (**`#`**), we are working as a privileged user (an administrator).

```shell
user@pc01:~$ _
```

Finally, note that the tilde character **`~`** is an abbreviation used by Linux to represent the **user's default folder**.

### Windows command line interface

In Microsoft systems, the command line interface has been changing and evolving.

- **`COMMAND.COM`** was the first text interface used in MS-DOS.
- **`CMD.EXE`** was incorporated in MS Windows NT-based systems
- **`PowerShell`**, advanced text interface for MS Windows.
- **`Windows Subsystem for Linux`** or **`WSL`**, is a compatibility layer developed by Microsoft to run Linux executables natively starting with MS Windows 10.

### The GNU/Linux text interface

Although there are many command interpreters for GNU/Linux systems, the most widely used is ***Bash*** (*Bourne again shell*). It was written by *Brian Fox* for the GNU project in 1987. It was based on *Bourne*, the most common text interface for *Unix* systems. Hence its name, which comes from a play on words, since born-again means rebirth.

As we already mentioned, this was the shell chosen by Linus Torvalds to include with his kernel, which has led to it being found in practically all distributions. In addition, it is included in many other systems, such as Apple macOS, Solaris, IBM AIX, HP UX, FreeBSD, etc.

> Other command interpreters for GNU/Linux are: Korn shell (ksh), zsh and C shell (csh).

To access the command interpreter in Ubuntu 24.04 LTS, simply click on the *Show applications* icon on the desktop and start typing the word ``Terminal``. It is usually accessible with the key combination `Ctrl` + `Alt` + `T`. Each desktop environment uses a different terminal emulator, although we can install others such as *GNOME Terminal, Konsole, xterm, aterm, eterm, Terminator, Guake, st, etc*.

---

## Operating System Licenses

When a computer user installs a specific program, they are directly or indirectly accepting **terms of use** stated in a software license.

A **license** is a **contract** between the **provider** of a software program and the **user** (or company) who uses it, establishing the conditions to which both parties commit during the period the software is in use.

Some aspects regulated by a software license include:

- The **binding** of the software to specific ***hardware***.
- The **number of copies** of the software that the user can use.
- The **rights** that the user has **over the software**.
- The **period** during which these rights are granted.
- The **responsibility** of the provider for the product's defects.
- The **possibility of transferring** the usage rights to others.
- Etc.

Based on the rights retained by the provider over their product, we have the following types of software licenses:

- **Open Source Software Licenses**
    - **Permissive**
    - **Non-permissive**
- **Proprietary Software Licenses**
- **Freeware**
- **Shareware**
- **Public Domain**

Descriptions of each type of license are provided below:

- **Open Source Software Licenses**: These licenses refer to software that makes its **source code** available to users. This type of license is usually associated with the concept of **_Free Software_**. Within this category, there are **two subtypes**:

    - ***Permissive***: Programs with this type of license **can be modified** or used to create new programs **without** the resulting software needing to maintain the **conditions of the original license**.
        Examples of this type of license include:
        - Apache Software License
        - PHP License
        - Perl License
        - Python License
        - W3C Software Notice and License
        - BSD License
        - MIT License
        - Open LDAP License
        - Etc.
    
    - **_Non-permissive_**: Programs with this type of license **can be modified** or used to create new programs, but the resulting software must generally be published **under the same terms as the original license**.
        Examples of this type of license include:
        - GNU General Public License (GPL)
        - Common Public License
        - OpenSSL License
        - Eclipse Public License
        - Affero General Public License
        - Etc.

- **Proprietary Software Licenses**: This refers to software that **does not distribute its source code**. It is also commonly known as **closed source** or **private** software.
  
    These licenses **limit the users' ability** to use, copy, modify, redistribute, or transfer the software.

    An example is the **EULA** (*End User License Agreement*), (**CLUF** *Contrato de Licencia para Usuario Final* in Spanish).

In addition to the previous types of licenses, there are some other common variations:

- **Freeware**: This type of license applies to software that is distributed **free of charge** and for an **indefinite time**. **Redistribution** is typically allowed, but modification and sometimes commercial use are not. Freeware usually does not include the source code.
- **Shareware**: This type of license allows the software to be **evaluated**, although usage may be **limited in time** or in **functionality**. To fully use the product without limitations, a payment is required.
- **Public Domain**: Software in this category is released **without any license**. This type of software can be used, modified, redistributed, or relicensed **without restrictions**.

### Proprietary Software Licenses

Proprietary software licenses can be acquired through different methods:

- ***Retail***
- ***OEM***
- **Volume licenses**

Let's describe each in more detail:

- **Retail** (Individual Sales)

    This is the typical way a user purchases software in a store. It is generally **targeted at users who do not need more than five licenses**, and it comes in two variants:

    - *Full Product*: Does not require a previous version of the product for installation.
    - *Upgrade*: Builds upon a previously licensed version. Typically, upgrade licenses are lower in cost.

- **OEM** (Original Equipment Manufacturer)
  
    Software that comes **pre-installed** when purchasing a new computer includes an *OEM* license. This distribution method ensures proper installation and configuration.

    Usually, **the license is bound to the hardware** with which it is acquired, meaning it **cannot be uninstalled and used on another computer**. However, transferring the entire system (hardware and software) to a different user is often allowed.

- **Volume Licenses**
  
    Software manufacturers often have contracts tailored **for organizations** or **companies needing more licenses** than an average user. The contract may include specific rights, such as transfer rights to certain users meeting specific conditions.

    In this type of licensing, there are also options for full products or upgrades. It is common to have downgrade rights to support older systems as well.

## Current Operating Systems

### Microsoft Windows :material-microsoft-windows:

*Microsoft* offers a full range of operating systems covering mobile devices, embedded systems, desktops, and servers.

When the **first version** of _MS Windows_ was released in 1985, it **wasn't an operating system**. **It was just a graphical interface** running on top of a text-based operating system called **MS-DOS** (*Microsoft Disk Operating System*).

Despite its success as a graphical interface, Microsoft Windows continued to rely on MS-DOS until the release of **MS Windows 95** in 1995. Though _MS Windows 95_ brought significant advancements, it still internally included the *MS-DOS kernel*.

This situation persisted until **MS Windows XP**, which was the first version to include the kernel from Microsoft's professional line, specifically from Windows 2000, which featured the **NT kernel** (*New Technology*). This convergence has continued to the present day.

The next significant change came with **MS Windows 8**, which saw a major overhaul of its graphical interface. It removed the _Start button_ and added a _Start screen_ intended to facilitate use on touch devices. The new interface was called *Metro UI*.

This drastic change led to some user dissatisfaction, prompting Microsoft to reconsider and restore the *Start button*, initially partially with Windows 8.1 and then fully with **MS Windows 10**.

Another change introduced by MS Windows 8 was support for a processor architecture other than x86 from Intel and AMD. From this version onwards, MS Windows has been available on phones and tablets equipped with **ARM processors**.

Microsoft offers different editions for each Windows version. For Windows 11, they are:

- MS Windows 11 **Home** - For **home** PCs.
- MS Windows 11 **Pro** - Advanced features for **businesses**.
- MS Windows 11 **Education** - For **educational** environments, may include fewer features.
- MS Windows 11 **Enterprise** - Extra features for **large organizations**.
- MS Windows 11 **Pro Education** - Pro version with **additional features for education** and some restrictions.
- MS Windows 11 **Pro for Workstations** - For **high-computational workloads**.
- MS Windows 11 **Mixed Reality** - Designed for devices like Microsoft **HoloLens**.

### GNU/Linux Distributions :simple-linux:

Characteristics of Linux OS:

- **GPL License** (GNU General Public License)
- **Free of charge**
- **Open source** - Usage, modification, and distribution are allowed.
- **Stable**
- **Secure**
- **Multitasking**
- **Multiuser**

A **Linux distribution**, commonly known as a **_distro_**, is a software distribution that includes the **Linux kernel** and a set of **software packages**, aimed at meeting the needs of a group of users.

For a list of major distributions: [https://distrowatch.com/](https://distrowatch.com/)

Components:

- **Kernel**
- **Tools and libraries**
- **Documentation**
- **Package manager**
- **Desktop environment** (optional)

History:

- **1970**: Ken Thompson and Dennis Ritchie create ***Unix***, a commercial operating system by _Bell Labs_.
- **1978**: University of Berkeley creates ***BSD***, a _Unix_ derivative for teaching.
- **1983**: _Richard Stallman_ starts the **GNU project** with the intention of creating a free operating system.
- **1987**: _Andrew S. Tanenbaum_ creates ***Minix***, based on _Unix_ version 6, for teaching purposes.
- **1991**: _Linus Torvalds_ creates the ***Linux*** kernel, based on _Minix_.
- **1992**: _Linux_ adopts the **GPL license** from the **GNU** project.
- **1993**: _Ian Murdock_ founds the **Debian project**.

Advantages:

- **Economic**: Spain spends over 1 billion euros annually on _Microsoft_ licenses. With _Linux_, this cost could be reduced to maintenance costs creating more jobs.
- **Local support**: Reduces dependency on a foreign company and boosts the local economy.
- **Open formats**: Non-proprietary, they allow interoperability between systems, independent of hardware, applications, or OS.
- **Open source**: The source code is available to everyone, allowing for improvements and customization.
- **No planned obsolescence** or commercial interests.
- **Security**: Does not include malicious software.
- **Repositories**: Access to thousands applications for free.

Disadvantages:

- **Aesthetic quality** often lower than proprietary software.
- **Proprietary formats**: Some applications are not available for _Linux_ or are not compatible, like MS Office, AutoCAD, Photoshop, etc..
- **Proprietary applications and games**: Today, with Proton, it is possible to run many _MS Windows_ games on Linux, with minimal performance loss.
- **Lack of familiarity**: Users are accustomed to _MS Windows_ and need to learn new ways of doing things.
- **Compatible hardware**: Some devices do not have drivers for _Linux_ or are not supported.

### Ubuntu :material-ubuntu:

**Ubuntu** is a distribution **based on Debian**, one of the oldest distributions that has remained true to _Linux_'s original pillars.

In this course, we will work with _Ubuntu_ for three main reasons:

- It is **user-oriented**, making it easier to use.
- It is one of the **most widely adopted** distributions, with a **large supportive community**.
- It serves as a **base for many distributions**, such as _Linux Mint_, _Zorin OS_, _Pop!_OS_, _Elementary OS_, _Linux Lite_, _Lubuntu_, _Feren OS_, _KDE Neon_, and others.

_Ubuntu_ is offered **freely and at no cost**, but have the option to obtain **technical support** via subscription payment.

It is offered in a **open source** and relies on the collaboration of a large community of developers. In this regard, _Ubuntu_ makes some exceptions:​

- It includes certain **proprietary hardware drivers**, as well as **some parts** of the kernel that **are not free**.​
- It also includes in its repositories some **applications that are not free**, although they are free.​

In both cases, the objective is to **facilitate the user experience** for the end user.​

- The distribution is sponsored by a british company called **Canonical** which is owned by the South African *Mark Shuttleworth*.​
- Canonical's **business model** is based on **technical support and user services**.
- To adapt to different contexts, it offers different versions for domestic and professional environments.

    !!! note "Ubuntu flavors"
        **Ubuntu** is the main distribution, but there are other versions called **flavors** that use different desktop environments. Can be found at [https://ubuntu.com/download/flavours](https://ubuntu.com/download/flavours)

- **Stable versions** are released every **six months**, in the months of **April** and **October**.​
- In their **version number**, the first two digits refer to the **year** and the next two to the **month** of release.​

    > - **Ubuntu 24.04 LTS** was released in **April 2024**.
    > - **Ubuntu 23.10** was released in **October 2023**.
    > - **Ubuntu 23.04** was released in **April 2023**.

- The **version name** has two words: the first is an adjective and the second is the name of an animal.​

    >  - Ubuntu 24.04 LTS (**Noble Numbat**).
    >  - Ubuntu 22.04 LTS (**Jammy Jellyfish**).
    >  - Ubuntu 20.04 LTS (**Focal Fossa**).

- **Technical support** and **security updates** of **18 months** for most versions.​
- **LTS** (*Long Term Support*) versions are released every **two years** and currently offer **5 years of technical support** and later an extended **security maintenance** of **5 more years**.​

    > **Ubuntu 24.04 LTS** is the **current LTS version** and will be **supported** until **2029** and will have **security updates** until **2034**.

    It's recommended to use the **LTS** versions for **production environments**, like servers, educational centers, companies, etc., due to their **longer support** period.

---

## Vocabulary

- _Computer equipment_ = Equipo informático
- _Computer Science_ = Informática
- _Computer system_ = Sistema informático
- _Cooling system_ = Sistema de refrigeración
- _Device_ = Dispositivo
- _Embedded system_ = Sistema embebido
- _Expansion card_ = Tarjeta de expansión
- _Fairness_ = Equidad
- _Fairness_ = Equidad
- _File system_ = Sistema de archivos
- _General-purpose_ = Propósito general
- _Input_ = Entrada
- _Interface_ = Interfaz
- _Kernel_, _Core_ = Núcleo
- _Main memory_ = Memoria principal
- _Motherboard_ = Placa base
- _Multi-task_ = Multitarea
- _Multi-user_ = Multiusuario
- _Open-source_ = Código abierto
- _Operating system_ = Sistema operativo
- _Output_ = Salida
- _Performance_ = Rendimiento
- _Peripheral_ = Periférico
- _Power supply_ = Fuente de alimentación
- _Preemptive_ = Apropiativo
- _Process management_ = Gestión de procesos
- _Process scheduling_ = Planificación de procesos
- _Proprietary_ = Propietario
- _Scheduling algorithm_ = Algoritmo de planificación
- _Screen_ = Pantalla
- _Shared resources_ = Recursos compartidos
- _Single-task_ = Monotarea
- _Single-user_ = Monousuario
- _Special-purpose_ = Propósito específico
- _Storage_ = Almacenamiento
- _User interface_ = Interfaz de usuario
- _Swap_ = Intercambio
