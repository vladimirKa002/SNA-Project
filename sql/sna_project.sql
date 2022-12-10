--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2022-12-10 11:21:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 68491)
-- Name: Answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Answers" (
    id integer NOT NULL,
    question_id integer NOT NULL,
    text character varying NOT NULL
);


ALTER TABLE public."Answers" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 68489)
-- Name: Answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Answers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Answers_id_seq" OWNER TO postgres;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 208
-- Name: Answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Answers_id_seq" OWNED BY public."Answers".id;


--
-- TOC entry 202 (class 1259 OID 68422)
-- Name: Courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Courses" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500) NOT NULL
);


ALTER TABLE public."Courses" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 68420)
-- Name: Courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Courses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Courses_id_seq" OWNER TO postgres;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 201
-- Name: Courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Courses_id_seq" OWNED BY public."Courses".id;


--
-- TOC entry 205 (class 1259 OID 68459)
-- Name: Progresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Progresses" (
    user_id character varying(250) NOT NULL,
    topic_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public."Progresses" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 68483)
-- Name: Questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Questions" (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    correct_answer_id integer NOT NULL,
    text character varying(150) NOT NULL
);


ALTER TABLE public."Questions" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 68481)
-- Name: Questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Questions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Questions_id_seq" OWNER TO postgres;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 206
-- Name: Questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Questions_id_seq" OWNED BY public."Questions".id;


--
-- TOC entry 204 (class 1259 OID 68430)
-- Name: Topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Topics" (
    id integer NOT NULL,
    course_id integer NOT NULL,
    name character varying(50) NOT NULL,
    content character varying NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public."Topics" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 68428)
-- Name: Topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Topics_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Topics_id_seq" OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 203
-- Name: Topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Topics_id_seq" OWNED BY public."Topics".id;


--
-- TOC entry 200 (class 1259 OID 68412)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    login character varying(250) NOT NULL,
    name character varying(250) NOT NULL,
    surname character varying(250) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 2883 (class 2604 OID 68494)
-- Name: Answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Answers" ALTER COLUMN id SET DEFAULT nextval('public."Answers_id_seq"'::regclass);


--
-- TOC entry 2880 (class 2604 OID 68425)
-- Name: Courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Courses" ALTER COLUMN id SET DEFAULT nextval('public."Courses_id_seq"'::regclass);


--
-- TOC entry 2882 (class 2604 OID 68486)
-- Name: Questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions" ALTER COLUMN id SET DEFAULT nextval('public."Questions_id_seq"'::regclass);


--
-- TOC entry 2881 (class 2604 OID 68433)
-- Name: Topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topics" ALTER COLUMN id SET DEFAULT nextval('public."Topics_id_seq"'::regclass);


--
-- TOC entry 3039 (class 0 OID 68491)
-- Dependencies: 209
-- Data for Name: Answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Answers" (id, question_id, text) FROM stdin;
1	1	Linux is a free and open source operating system.
2	1	It is a word which describes the internal system.
3	2	1509
4	2	2027
5	2	1973
6	1	Linux is a very useful thing.
7	19	CPU, GPU, GRU, FSB, FBI
8	19	Virtual Memory, Resident MemoryKernel I/O buffers and cache, Swap
9	19	Lego
10	19	Self-Monitoring, Analysis and Reporting Technology
11	20	Yes
12	20	“Everything is a file”
13	20	All of the above
14	21	Ctrl + D
15	21	Ctrl + C
16	21	Ctrl + B
17	21	Ctrl + A
18	22	Logs processing and aggregation
19	22	Bulk text processing
20	22	Masquerading sensitive information
21	22	All of the above
22	23	Regular Expression
23	23	Regular Exception
24	23	Irregular Expression
25	24	To avoid repetitive work and automation
26	24	System engineers use shell scripting for routine backups, daily tasks etc
27	24	System monitoring
28	24	Adding new functionality to the shell
29	24	Shell language is used in many DevOps technologies to execute tasks in the environment
30	25	Kirill Saltanov
31	25	CPU
32	25	#!/bin/bash
33	24	All of the above
34	26	Interactive, Non-interactive, Login, Non-Login
35	26	Interactive, Non-interactive
36	26	Interactive, Login
37	27	_etc_profile, _etc_bash.bashrc, ~_.profile, ~_bashrc, ~_.bash_logout
38	27	/etc/profile, /etc/bash.bashrc, ~/.profile, ~/.bashrc, ~/.bash_logout
39	27	No such types
40	29	New
41	29	Ready
42	29	Running
43	29	Sleeping
44	29	Terminated
45	29	Stopped
46	29	All of the above
47	30	A signal is a short messages sent to a process, or group of processes, containing the number identifying the signal.
48	30	Signal is a cross-platform centralized encrypted instant messaging service developed by the non-profit Signal Foundation and its subsidiary, the Signal Messenger LLC. Users can send one-to-one and group messages, which can include files, voice notes, images and videos.
49	31	Cron - is a finite state automata created by using Java AWT.
50	31	Cron - is the a simple storage service (S3).
51	31	Cron - is software that is used for text extraction and processing.
52	31	Cron - is the common name for the service to schedule tasks such as regular backups, system updates etc. 
53	32	Systemd - is a software suite that provides an array of system components for MacOS.
54	32	Systemd - is a software suite that provides an array of system components for Linux operating systems.
55	32	Systemd - is a very useful Haskell program,
56	33	/run/systemd/system/
57	33	/etc/systemd/system/
58	33	/usr/lib/systemd/system/
59	33	All of the above
60	34	timestamp, hostname, service name, message
61	34	timestamp, hostname, service name, massage
62	34	timestamp, hostname
63	35	Protocol for multiple servers communication, which allows to minimize side-effects of network partitions.
64	35	It is a networking protocol for clock synchronization between computer systems over packet-switched, variable-latency data networks.
65	35	It is a networking protocol for distributed, decentralized computers.
66	35	Laptop.
67	36	Yes
68	36	No
69	37	Containerization is a software kit for managing the power of solar batteries.
70	37	Containerization is an opportunity to run isolated processes in a protected environment.
71	37	Containerization is when you are putting your useless stuff into boxes to free the space in the room.
72	39	git reset --hard HEAD~2
73	39	git commit
74	39	git add
75	39	git track_pozalyista
\.


--
-- TOC entry 3032 (class 0 OID 68422)
-- Dependencies: 202
-- Data for Name: Courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Courses" (id, name, description) FROM stdin;
1	System & Network Architecture	This course lets you to:\n➢ Get overview of system and network administration field\n➢ Learn about existed principles and techniques\n➢ Develop critical mindset towards different tools and methods\n➢ Be ready to audit, design, configure and troubleshoot modern systems
\.


--
-- TOC entry 3035 (class 0 OID 68459)
-- Dependencies: 205
-- Data for Name: Progresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Progresses" (user_id, topic_id, course_id) FROM stdin;
vlad_ka	1	1
vlad_ka	6	1
vlad_ka	7	1
vlad_ka	15	1
vlad_ka	20	1
vlad_ka	3	1
vlad_ka	18	1
\.


--
-- TOC entry 3037 (class 0 OID 68483)
-- Dependencies: 207
-- Data for Name: Questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Questions" (id, topic_id, correct_answer_id, text) FROM stdin;
31	15	52	What is cron?
32	16	54	What is systemd?
33	16	59	Systemd target is?
34	17	60	Typical structure for system logs:
35	18	64	What is Network Time Protocol (NTP)?
36	18	67	chronyc is command-line interface for chronyd daemon.
37	19	70	What is Containerization?
39	20	74	The command ... makes files to be tracked by git from the working directory.
1	1	1	What is Linux?
2	1	5	When Unix was rewritten in C?
19	2	8	What are the integral parts of Memory Management?
20	2	12	What is a "Main principle"?
21	3	17	Select the shortcut which will move you to the beginning.
22	4	21	Where SED and AWK can be useful?
23	4	22	Regex stand for...
24	5	33	Why do we need shell scripts?
25	5	32	Who tells to invoke /bin/bash?
26	6	34	What are the main definitions of shell?
27	6	38	What are the correct types of shell configuration files?
29	7	46	What are the process states?
30	7	47	What is Posix signal?
\.


--
-- TOC entry 3034 (class 0 OID 68430)
-- Dependencies: 204
-- Data for Name: Topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Topics" (id, course_id, name, content, number) FROM stdin;
18	1	Time configuration + Software update management	Time and timezone are very important while searching through logs, synchronize with the remote distributed systems and keepeverything up to date\n\ntimedatectl - is a utility for controlling the system time and date. \nThe timedatectl command allows you to query and change the configuration of the system clock and its settings, you can use this command to set or change the current date, time, and timezone or enable automatic system clock synchronization with a remote NTP server.\n\n❏ RTC time - hardware clock from motherboard, it works regardless of the state of OS (even during turn off)\n❏ $tzselect - select a time zone interactively (can be used instead of timedatectl list-timezones)\n❏ for some weather seasons there are switching time in hours, -> it's better to always use NTP\n❏ $timedatectl set-ntp false OR true - to enable system clock synchronization\n\nThe Network Time Protocol (NTP) - is a networking protocol for clock synchronization between computer systems over packet-switched, variable-latency data networks. \n\nchrony is a pair of programs (NTP client/server) for maintaining the accuracy of computer clocks\nchronyd is a background daemon program that can be started at boot time\nConfiguration file: /etc/chrony.conf\n\nInstallation and configuring chronyd as an NTP client:\n❏ $yum install chrony\n❏ $systemctl start chronyd.service\n❏ $systemctl enable chronyd\n❏ $systemctl daemon-reload\n❏ $timedate set-ntp true # enable synchronization via chronyd\n❏ $timedate set-ntp false # disable synchronization via chronyd\n\nchronyc is command-line interface for chronyd daemon\n❏ chronyc sources -v # check NTP sources with description\n❏ chronyc tracking # displays parameters about the system’s clock performance\n\nThe RPM Package Manager (RPM) is a package management system used by Red Hat Linux and its derivatives such as CentOS and Fedora.\nRPM also refers to the $rpm command and .rpm file format. An RPM Package consists of an archive of files and metadata. It can contain the following:\n❏ Binary files, also known as executables (nmap, stat, xattr, ssh, sshd, etc.)\n❏ Configuration files (sshd.conf, updatedb.conf, logrotate.conf, etc.)\n❏ Documentation files (README, TODO, AUTHOR, etc.)\nThe name of an RPM package follows this format:\n<name>-<version>-<release>.<arch>.rpm\n\nYum - is the Red Hat package manager that can query for information about available packages, fetch packages from repositories, install and uninstall them, and update an entire system to the latest available version. \nYum performs automatic dependency resolution on packages you are updating, installing, or removing, and thus it can automatically determine, fetch, and install all available dependent packages \n\nA Debian "package", or a Debian archive file is an analog of RPM package, but for Debian based system, like Ubuntu. These packages contain the executable files, libraries, and documentation associated with a particular suite of program or set of related programs. \nNormally, a Debian archive file has a filename that ends in .deb	11
4	1	File manipulation and text processing	Stream text editors\n❏ SED\t❏ AWK\nCan be used in:\n- Logs processing and aggregation (e.g. IPs, user accounts etc)\n- Bulk text processing (changing a variable in the code repo)\n- Masquerading sensitive information (e.g. find and substitute user names, private data etc)\n\nAWK\n❏ Powerful tool for processing and analyzing text of data files which are organized by lines  (rows or records) and columns (fields)\n❏ Stream editor that allows to aggregate data with predefined actions/patterns before and  after text is processed\n❏ May match regular expressions (but SED is more popular for it)\n❏ Variables (including lists and dicts) – may be used for data analysis\n❏ Splits line by a field separator (FS)\n❏ Allows to use fields as variables – $0, $1, …, $NF\n❏ Has various useful String-Manipulation Functions\n❏ Full info - https://www.gnu.org/software/gawk/manual/html_node/index.html\n\nSED\n❏ SED - works by making only one pass over the input(s), and is consequently more efficient. But it is sed’s ability to filter text in a pipeline which particularly distinguishes it from other types of editors.\n❏ Print lines with a specific pattern\n❏ Remove lines that contain a specific pattern\n❏ Print/remove specific range of lines\n❏ Various substitutions\n❏ Rewrite initial file\n❏ Capture groups \n❏ https://www.gnu.org/software/sed/manual/sed.html\n\nRegular Expression - Regex\nA regular expression is a sequence of characters that specifies a search pattern in text. Usually such patterns are used by string-searching algorithms for "find" or "find and replace" operations on strings, or for input validation.	4
17	1	Logging and auditing the system	Logging: /var/log/\n❏ historically, Linux has a special directory for storing logs called /var/log\n❏ It contains logs from the OS, services, and various applications running on the system.\n\nMost of the log can be splitted as:\nSystem logs: syslog, messages(Redhat), dmesg \nApplication logs: apache/httpd, nginx, vbox\nEvent Logs: auth.log, boot.log\nService Logs: cron\n\nTypical structure for system logs includes:\n❏ timestamp\n❏ hostname\n❏ service name (facility)\n❏ message\n\nExamples:\nAuth.log:\n❏ Keep authentication logs for both successful or failed logins, and authentication processes (such as switching users, using sudo etc) \n❏ Storage depends on system type. For Debian/Ubuntu, look in /var/log/auth.log. For Redhat/CentOS, go to /var/log/secure.\nlastlog:\n❏ /var/log/lastlog: holds every user’s last login. A binary file you can read via lastlog command. (only works when logged into login tty, Gnome based login is not shown\n\nLogin, logouts, failure attempts, tty \nThere are 3 files that records relevant information:\n❏ /var/run/utmp will give you complete picture of current users logins at which terminals, logouts, system events and current status of the system, system boot time (used by uptime) etc.\n\t❏ $w and $who - uses utmp to provide relevant data\n❏ /var/log/wtmp gives historical data of utmp\n\t❏ $last - uses wtmp by default\n❏ /var/log/btmp records only failed login attempts\n\t❏ $lastb - uses btmp	10
1	1	Introduction to Linux	Linux is a free and open source operating system.\n❏ At it’s core, the Linux operating system is derived from the Unix OS.\n❏ Unix was created in the 1960s by Dennis Ritchie and Ken Thompson\n❏ both of them also invented the C programming language (Unix was rewritten in C in 1973)\n\n1. Modularity: Write simple parts connected by clean interfaces\n2. Clarity: Clarity is better than cleverness\n3. Composition: Design programs to be connected with other programs\n4. Simplicity: Design for simplicity; add complexity only when you must\n5. Transparency: Design for visibility to make inspection and debugging easier\n6. Robustness: Is the child of simplicity and transparency\n7. Diversity: Distrust all claims for “one true way”\n8. Extensibility: Design for the future, because it will be here sooner than you think\n\nGNU - is a Unix-like operating system. The development of GNU, started in January 1984, is known as the GNU Project. That means it is a collection of many programs: applications, libraries, developer tools, even games. Originally they were developed for UNIX kernel	1
2	1	Linux Main Component	Network engineers design and implement network configurations, troubleshoot performance issues, carry out network monitoring and configure security systems such as firewalls.\n\nOS Boot Process\nBIOS/UEFI(Platform init) -> POST(Power on Self Test) -> Bootloader(Find and load OS kernel) -> Kernel(Initialize HW for kernel space)\n\nMost storage devices (HDDs, SSDs, flash drives, CD/DVD, etc) write and read data in blocks. \nS.M.A.R.T. (Self-Monitoring, Analysis and Reporting Technology) is an internal monitoring and reporting technology built into most modern hard drives. Its main purpose is to detect anomalies and predict failure.\n\nMemory Management:\nVirtual Memory - OS shows the process that it owns all memory on the computer\nResident Memory - part of the real, physical memory that consumed by the process\nKernel I/O buffers and cache - memory used for I/O data storage/caching\nSwap - on-disk additional memory emulation (optional)\n\nVirtual file systems:\nVirtual files represent objects that are not files, but can be managed like files. Examples:\n❏ named pipes\n❏ unix socket files\nVirtual file systems are used to represent object hierarchies using virtual files. Examples:\n❏ /proc/self/fd/0 - standard input\n❏ /dev/stdin - standard input\nMain Principle - “Everything is a file”\n❏ Sysfs(/sys) - kernel parameters (sysctl)\n❏ Procfs(/proc) - processes and process management related parameters\n❏ Devfs(/dev) - devices as files\n❏ Named pipes and sockets	2
3	1	Basic command line and File manipulation	The Bash shell - /bin/bash\n❏ Bash GNU Bourne-Again SHell\n❏ <Command> <Options> <Arguments> \n❏ --help\n❏ man <command>\n\nHelpers\n\n* Tab completion\n\n* Extra completions\n❏ Bash-completion\n❏ Bash-completion-extras \n\n* Command history\n❏ history\n❏ !\n❏ !! (previous cmd)\n❏ !a (previous cmd starts with a)\n❏ !5 (command indexed 5 in the history file)\n❏ Ctrl + R (search)\n❏ Ctrl + S (freeze output)\n\n* Shortcuts\n❏ Ctrl + A (go to beginning)\n❏ Ctrl + E (go to end)\n❏ Ctrl + Z (stop and put in the bg)\n❏ Ctrl + C (terminate process)\n❏ Ctrl + D (terminate gracefully)\n❏ etc…\n\nLinux most popular commands:\n* ls - The most frequently used command in Linux to list directories\n* pwd - Print working directory command in Linux\n* cd - Linux command to navigate through directories\n* mkdir - Command used to create directories in Linux\n* mv - Move or rename files in Linux\n* cp - Similar usage as mv but for copying files in Linux\n* rm - Delete files or directories\n* touch - Create blank/empty files\n* ln - Create symbolic links (shortcuts) to other files\n* cat - Display file contents on the terminal\n* clear - Clear the terminal display\n* echo - Print any text that follows the command\n* less - Linux command to display paged outputs in the terminal\n* man - Access manual pages for all Linux commands\n* uname - Linux command to get basic information about the OS\n* whoami - Get the active username\n* tar - Command to extract and compress files in Linux\n* grep - Search for a string within an output\n* head - Return the specified number of lines from the top\n* tail - Return the specified number of lines from the bottom\n* diff - Find the difference between two files\n* cmp - Allows you to check if two files are identical\n* comm - Combines the functionality of diff and cmp\n* sort - Linux command to sort the content of a file while outputting\n* export - Export environment variables in Linux\n* zip - Zip files in Linux\n* unzip - Unzip files in Linux\n* ssh - Secure Shell command in Linux\n* service - Linux command to start and stop services\n* ps - Display active processes\n* kill and killall - Kill active processes by process ID or name\n* df - Display disk filesystem information\n* mount - Mount file systems in Linux\n* chmod - Command to change file permissions\n* chown - Command for granting ownership of files or folders\n* ifconfig - Display network interfaces and IP addresses\n* traceroute - Trace all the network hops to reach the destination\n* wget - Direct download files from the internet\n* ufw - Firewall command\n* iptables - Base firewall for all other firewall utilities to interface with\n* apt, pacman, yum, rpm - Package managers depending on the distro\n* sudo - Command to escalate privileges in Linux\n* cal - View a command-line calendar\n* alias - Create custom shortcuts for your regularly used commands\n* dd - Majorly used for creating bootable USB sticks\n* whereis - Locate the binary, source, and manual pages for a command\n* whatis - Find what a command is used for\n* top - View active processes live with their system usage\n* useradd and usermod - Add new user or change existing users data\n* passwd - Create or update passwords for existing users	3
5	1	Intro to Bash scripting	Why do we need shell scripts:\n❏ To avoid repetitive work and automation\n❏ System engineers use shell scripting for routine backups, daily tasks etc\n❏ System monitoring\n❏ Adding new functionality to the shell\n❏ Shell language is used in many DevOps technologies to execute tasks in the environment\n\nWhat are the limitations of shell scripts:\n❏ Prone to costly errors, a single mistake can change the command which might be harmful\n❏ Slow execution speed\n❏ Not well suited for large and complex task\n❏ Provide minimal data structure unlike other scripting languages\n\nDefine a bash script \n❏ You can use plain Bourne shell (/bin/sh) when special features of Bash (/bin/bash) are not needed\n❏ Bourne shell is proprietary code, whereas Bash is open source\n❏ Note that Bourne shell (/bin/sh) is usually just a symlink to dash (/usr/bin/dash) on Linux systems\n❏ dash is a POSIX-compliant implementation of /bin/sh that aims to be as small as possible\n\n❏ Bash script is a just a list of consequent commands\n❏ The #!/bin/bash tells the shell to invoke /bin/bash to run  the script\n❏ Use it at the beginning of the script file\n❏ Script Execution:\n❏ $ bash script_name\n❏ $ chmod u+x First.sh && ./script_name.sh	5
7	1	Processes and Signals	Process is:\n❏ the instance of a computer program that is being \nexecuted by one or many threads.\n\nProcess encapsulates:\n❏ Process memory space:\n❏ Text - code of the program\n❏ Data - global vars \n❏ Heap - dynamically allocated global vars during run time\n❏ Stack - function params, return addresses, local variables\n❏ Operating system\n❏ File descriptors (FDs)\n❏ Security attributes - process owner and the process' set of permissions (allowable operations).\n❏ Processor state (context) - reserved registers (e.g. Program Counter that stores next instruction to execute\n\nProcess \nOS abstraction is used to encapsulate all of the required process data in an address  space. The address space is defined by a range of address from V0 to some Vmax, and different types of process state will appear in different part of this address space. The page table maintains the mapping from virtual address to the physical address (RAM or Disk), it also validates whether a particular memory access request by a process is allowed to perform or not.\n\nProcess Control Block (PCB) - data structure that operating system maintains for every single process to maintain all of the process data for every single processPCB is created at the very moment a process is created with some initializations like PC points to the first instruction that needs to be executed.\nPCB must contain process states like: program counter, stack pointer, all the value of the CPU register, various memory mapping from virtual to physical memory, it may also include a list of open files etc.\nDuring interrupts when OS wants to switch from one process to another - loading and restoring values of fields of PCB to registers (for both processes) is happening, which is also known as context switchingOS maintains pointers to each process’s PCB in a process table so that it can access the PCB quickly.\n\nProcess states\n❏ New - initial state when process first run (allocation of PCB)\n❏ Ready (runnable) - waiting in a queue to be assigned to a processor\n❏ Running - once assigned by the OS scheduler, the processor executes its instructions\n❏ Sleeping (waiting) - waiting for some events such as I/O, keyboard interrupts etc\n❏ Terminated - once process finishes execution or encounters some errors, then is moved to be removed from the main memory\n❏ Stopped - once process receive the signal to stop its execution\n\nPOSIX signals\nAn IPC mechanism used in Unix to indicate that a particular event has occurred. A signal is a short messages sent to a process, or group of processes, containing the number identifying the signal. No data is delivered with traditional signals.	7
6	1	Bash scripting - best practices	Main definitions of shells:\n❏ Interactive - means that the commands are run with user-interaction from the keyboard (e.g. prompt the user to  enter input)\n❏ Non-interactive - type of shell that doesn’t interact with the user. We can run it through a script or similar. Also, it  can be run through some automated process. \n❏ Login - shell is run as part of the login of the user to the system (e.g. ssh), Typically used to do any configuration that  a user needs to establish shell environment\n❏ Non-login - any other shell run by the user after logging on, or which is run by any automated process which is not  coupled to a logged in user\n\nTypes of shell configuration files:\n❏ /etc/profile: - sets the environment information for each user of the system. When the user logs in for the first time, the fileis run. The shell options are collected from a configuration file in the /etc/profile.d directory\n❏ /etc/bash.bashrc:- run this file for every user running a bash shell. When the bash shell is opened, the file is read\n❏ ~/.profile:- each user can use this file to enter shell information for their own use. When the user logs in, the file is executedonly once! By default, it sets some environment variables and runs the user's .bashrc file.\n❏ ~/.bashrc:- this file contains information about bash specific to your bash shell, which is read at login and every time you opena new shell\n❏ ~/.bash_logout:- every time you logout (logout from the bash login shell) file is run. It clears the screen whenever you logout. Without .bash_logout whatever you were working on could be visible for the next user\n\n$set - Setting your shell environment, allows you to control the behavior  of your scripts by managing specific flags and properties.\n❏ Use $set - to view your current local shell settings and  environment variables (not exported). Including exported use  $env\n❏ Assign your positional parameters (e,g, $1 $2 $3) that you can use  in the scripts\n❏ Use $set -C - prevent to writing to a file (to prevent possible  accident)\n❏ Use $set -x and $set +x to debug your script. Additionally can  include $set -e so script exists on the first failure.	6
15	1	Scheduling tasks (cron, anacron, at)	Cron - is the common name for the service to schedule tasks such as regular backups, system updates etc. \nThe cron daemon (cron.service) is the background service that enables cron functionality.\n\nThe cron daemon checks for special files called “crontabs” as follows:\n1. /var/spool/cron/crontabs/ - individual user tasks\n❏ $crontab -e - put tasks here under current user\n❏ $crontab -l - display current tasks for the user in std output \n❏ $crontab -u <username> - run crontab under specific user (require root privileges)\n2. /etc/cron.d/ - placement for system services and applications that will put crontabs there\n3. /etc/crontab - system-wide tasks, usually only used by root user or daemons to configure system wide jobs.\n\nTo configure system wide jobs with the crontab file:\n❏ First, the environment must be defined. SHELL=/bin/bash. If the SHELL line is omitted, cron will use the default, which is sh\n❏ PATH=/where/the/executable. If the PATH variable is omitted, no default will be used and file location to be executed will need to have an absolute path \n❏ HOME=/where/the/app. If HOME is omitted, cron will use the invoking user home directory. Some programs require additional files to be read for execution and use $HOME env.\n❏ MAILTO=”” value can be empty, root or contains particular email where to send notifications\n\nBy the initial design crontab file will run as follows:\n❏ /etc/cron.*/ {cron.hourly|cron.daily|cron.weekly|cron.monthly}\n- in the /etc/crontab file, cron will run scripts timely in accordance with the directories. \n❏ Scripts should be defined as executables without *.sh extension as they will be processed by run-parts command that takes directory as the argument where those executables are\n\n Limit access to the crontab executable (cron jobs)\n❏ Based on existence of /etc/cron.allow and /etc/cron.deny, user is allowed or denied to edit the crontab in below sequence:\n\t❏ If cron.allow exists - only users listed into it can use crontab\n\t❏ If cron.allow does not exist - all users except the users listed into cron.deny can use crontab\n\t❏ If neither of the file exists - only the root can use crontab\n\t❏ If a user is listed in both cron.allow and cron.deny - that user can use crontab.\n\nDaemon (anacron.service) - performs the same function as cron, but it adds the ability to run jobs that were skipped, such as if the computer was off. \nThe syntax of anacron is as follows:\n❏ period - is the frequency of the task execution, specified in days or as @daily, @weekly, or @monthly for once a day, week, or month, respectively. You can also use numbers: 1 for daily, 7 for weekly, 30 for monthly, and N for the number of days.\n❏ delay - is the number of minutes to wait before executing the job.\n❏ job-id - is the name for the job, as will be recorded in the log files.\n\nThe scheme of the anacron work is the following:\n❏ On Debian systemd-based systems, anacron daemon as defined in /lib/systemd/system/anacron.service will run jobs in accordance with the schedule configured in /lib/systemd/system/anacron.timer - this file provides systemd timer for anacron. By default the service is triggered hourly through systemd timer	8
16	1	Services and Daemons	Systemd - is a software suite that provides an array of system components for Linux operating systems. In particular, it provides parallelization capabilities, activation for starting services, offers on-demand starting of daemons, keeps track of processes using Linux control groups, maintains mount and automount points, and implements dependency-based service control logic.\n\nSystemd's core components include the following:\n❏ systemd is a system and service manager for Linux operating systems.\n❏ systemctl is a command to introspect and control the state of the systemd system and service manager\n❏ systemd-analyze may be used to determine system boot-up performance statistics and retrieve other state and tracing information from the system and service manager.\n\nSystemd components\n❏ /lib/systemd - place for files which are default and pre-installed\n❏ /etc/systemd - place for user-defined custom configurations\n❏ man systemd.unit - main helper for systemd units configuration\n\nSystemd: main abstractions\nUnits - basic object that systemd manages and acts upon it. Can be as following:\n❏ Targets (.target)\n❏ Services (.service)\n❏ Slices (.slice)\n❏ Mount points (.mount)\n❏ others\n\nSystemd: targets\n❏ /usr/lib/systemd/system/ - units of installed packages\n❏ /run/systemd/system/ - runtime units\n❏ /etc/systemd/system/ - local configuration by administrator\n\n.target - a unit configuration file which is used for grouping units via dependencies and as standardized synchronization points during start-up.\n\nrunlevel vs targets\nrunlevel:\n❏ A runlevel is essentially a set of capabilities or running services that you can pre-define and set the system to boot to so you have a predictable set of services. \n❏ It defines the number and type of daemons that are loaded into memory and executed by the kernel on a particular system\n❏ Only one runlevel can be "active" at a time \n❏ It was used before systemd appeared\ntargets:\n❏ In systemd, targets are the new runlevels.\n❏ systemd provides a compatibility layer that maps runlevels to targets\n❏ systemd can activate multiple targets concurrently not as one runlevel at a time\n\nCreate custom target:\n❏ Describe the target and create the file in the /etc/systemd/system/<your_target>.target\n❏ Create directory /etc/systemd/system/<your_target>.wants\n❏ Symlink with the additional services from /lib/systemd/system/ that you wish to enable.	9
19	1	Containerization - Docker	Containerization is an opportunity to run isolated processes in a protected environment.\nA container is a sandboxed application with all of its dependencies included, so the application runs quickly and reliably from one computing environment to another.\n\nVirtualization \t\t\t\t\tContainerization\nHardware level virtualization   Operating system virtualization\nAbstracts OS from hardware \t\tAbstracts Application from OS\nHeavyweight \t\t\t\t\tLightweight\nMinutes to startup \t\t\t\tFew seconds to startup\nMore secure and isolated \t\tLess secure and isolated\n\n❏ Docker daemon (dockerd) - listens for docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services. \n❏ Docker client (docker) - is the primary way when users interact with Docker. \n❏ Docker registries - stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on DockerHub by default. \n❏ Images - an image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization.\n❏ Containers - is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI.\n\nContainerd - is a high-level container runtime that came from Docker, and implements the CRI spec. It pulls images from registries, manages them and then hands over to a lower-level runtime, which actually creates and runs the container processes (to runc). \nRunc - is an OCI-compatible container runtime. It implements the OCI specification and runs the container processes. \n\nAn image - is a read-only template with instructions for creating a Docker container.	12
20	1	DevOps tools: Git and Gitlab CI/CD	Version (Source) Control\nSet of tools and practices that allow to:\n❏ Track and manage changes to the software code\n❏ Provide changes with some kind of metadata (who, when and why)\n❏ Keep code in a centralized storage\n❏ Work concurrently on the same codebase\n❏ Create a foundation for DevOps\n\nSome software provides possibility to follow Version Control practices by:\n❏ A complete long-term change history of a file\n❏ Branching and merging (and similar concepts)\n❏ Having an annotated history of the code\nExamples: GIT, Subversion, Perforce\n\nGIT Repository\n❏ Object database\n❏ Snapshot-based SCM\n❏ Commit – recorded set of changes in the \nrepo:\n\t❏ Current state snapshot\n\t❏ Metadata\n\t❏ Link to previous commit\n\ngit add - makes files to be tracked by git from the working directory\n\nInitialize Repository:\n❏ $git init - initialize directory as a git repository’\n❏ $git clone <remote_repo> - create a local copy of a remote repository (i.e. download to your workspace)\nSetting up your git personal information - set name and email so that the commits can associate with your user account (this config will be a global and stored in the home dir of the user ~/.gitconfig). However, it can be replaced by the local git config configuration once you do it in the working directory without --global option. \n❏ $git config --global user.name “<name>”\n❏ $git config --global user.email “email@abc.com”\nSave the current index (staging) as a snapshot and commit to the project’s history\n❏ $git commit -m “description of the change” - commit the changes\n❏ $git commit -am “description of the change” - automatically add all modified files to the staging and commits\n❏ $git commit --amend - allows to modify last commit and log message (reverse it back)\n\ngit is a content-addressable filesystem - which stores data as a key-value pair. You can retrieve the content by the key\n\nCommit object type - the commit object contains the directory tree object hash, parent commit hash, author, committer, date and message.\nTree object type - tree object contains one line per file or subdirectory, with each line giving file permissions, object type, object hash and filename. Object type is usually one of “blob” for a file or “tree” for a subdirectory\nBlob object type - Blob is an abbreviation for “binary large object”. When we $git add <a file> such as test.txt, git creates a blob object containing the contents of the file. Blobs are therefore the git object type for storing files.\nTag object type (optional) - The tag object type contains the hash of the tagged object, the type of tagged object (usually a commit), the tag name, author, date and messae\n\nBranch - is a moving pointer to some commit. Each time you commit, the pointer moves forward to the last commit.\nTag - is a static pointer to some commit. It’s designed to be static and may be moved only forcefully (bad practice)	13
\.


--
-- TOC entry 3030 (class 0 OID 68412)
-- Dependencies: 200
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (login, name, surname, password) FROM stdin;
vlad_ka	Vladimir	Kalabukhov	$2b$12$0OuZZ/qzFqEZiusiqSvQgO86DLlpsFmil71jdKbGGqXV7nC4127DO
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 208
-- Name: Answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Answers_id_seq"', 3, true);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 201
-- Name: Courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Courses_id_seq"', 7, true);


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 206
-- Name: Questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Questions_id_seq"', 39, true);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 203
-- Name: Topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Topics_id_seq"', 21, true);


--
-- TOC entry 2895 (class 2606 OID 68496)
-- Name: Answers Answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Answers"
    ADD CONSTRAINT "Answers_pkey" PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 68427)
-- Name: Courses Courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Courses"
    ADD CONSTRAINT "Courses_pkey" PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 68463)
-- Name: Progresses Progresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Progresses"
    ADD CONSTRAINT "Progresses_pkey" PRIMARY KEY (user_id, topic_id, course_id);


--
-- TOC entry 2893 (class 2606 OID 68488)
-- Name: Questions Questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_pkey" PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 68438)
-- Name: Topics Topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topics"
    ADD CONSTRAINT "Topics_pkey" PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 68419)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (login);


--
-- TOC entry 2899 (class 2606 OID 68474)
-- Name: Progresses Progresses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Progresses"
    ADD CONSTRAINT "Progresses_course_id_fkey" FOREIGN KEY (course_id) REFERENCES public."Courses"(id);


--
-- TOC entry 2898 (class 2606 OID 68469)
-- Name: Progresses Progresses_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Progresses"
    ADD CONSTRAINT "Progresses_topic_id_fkey" FOREIGN KEY (topic_id) REFERENCES public."Topics"(id);


--
-- TOC entry 2897 (class 2606 OID 68464)
-- Name: Progresses Progresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Progresses"
    ADD CONSTRAINT "Progresses_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(login);


--
-- TOC entry 2896 (class 2606 OID 68439)
-- Name: Topics Topics_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Topics"
    ADD CONSTRAINT "Topics_course_id_fkey" FOREIGN KEY (course_id) REFERENCES public."Courses"(id);


-- Completed on 2022-12-10 11:21:11

--
-- PostgreSQL database dump complete
--

