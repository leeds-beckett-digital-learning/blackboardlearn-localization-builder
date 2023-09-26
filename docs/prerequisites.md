# Prequisites

To work with this project you need to install certain software on your computer.
This guide assumes you are using an LBU issue laptop or desktop running Windows.
Where there are alternative tools, those that can be installed without 
administrator access have been suggested.

## SSH

SSH is "Secure Shell". It is a network protocol and software suite that enables 
encrypted network connections between computers. You may be aware that in
web browsers HTTPS is the protocol for fetching web pages over encrypted
connections. SSH predates HTTPS and is more general purpose. It is often used
to connect to computers that host code repositories.

The OpenSSH suite of software is part of Windows itself so there is no installation
of software required. However, there is a little setting up to do if you 
want to use SSH with LBU's GitLab installation. For automatic authentication
you need create a cryptographic key pair and install the public key from the
public/private pair in the GitLab web site.  These instructions assume you
already have access to the LBU GitLab.

### Generate a key pair.

A cryptographic key pair consists of two mathematically related keys. When two
parties on the Internet communicate they first find out each other's public
keys and then some clever maths is used on both sides to prove that the 
parties have access to the corresponding private keys without revealing their contents.

The LBU GitLab site has generated its own key pair and you must also generate
a key pair. This is how:

- Open a Command Prompt Window (Start menu under Windows System)
- Type the following command;

		ssh-keygen -t ed25519 -C "your email address here - your PC serial no. here"

- The comment is used to help you tell keys apart.
- When prompted, accept the default location for the key files
- When prompted enter empty passphrase and confirm at next prompt
- Locate the two files in file explorer
- Open the public key file in notepad or notepad++
- Select all the file and copy to the clipboard

### Install public key in LBU GitLab

Here you give the GitLab site your public key so it can verify your identity
when you connect via SSH.

- Log in to LBU GitLab
- In the drop down menu in the top right of the page select Edit Profile.
- In the User Settings page select SSH Keys from the left side menu.
- Fill in the Add an SSH Key form;
- Paste the public key from the clipboard in the box labelled key.
- The title will be suggested based on the comment part of your key.
- Select Authentication in the usage type menu.
- The default expiry date will probably be suitable.
- Click on the Add button.

Now you can use your private key to authenticate to LBU GitLab.

### Test SSH

A simple verification step is this:

- Open Command Prompt Window
- Enter this command

		ssh git@gitlab.leedsbeckett.ac.uk

You are probably accessing gitlab.leedsbeckett.ac.uk for the first time from the computer you are using.
When this happens, the ssh command displays a 'fingerprint' for the remote
server for you to verify.

The correct server host key is:

	ecdsa-sha2-nistp256 SHA256:mE8X1QxVhw9m6zD+A6ZaOeiRSIp/lTaPxm0S8kYwFEo

- Check and accept the key this time and you won't be prompted again from this computer.

You should see a Welcome to GitLab message.

## GitHub Desktop

GitHub provides a web based git repository very similar to GitLab. GitHub also
provides a free desktop application for synchronizing disk based repositories
with web based repositories. It works just as well with GitLab web repositories
as it does with GitHub. It is simple and user friendly.

You can install GitHub Desktop into your personal file space without 
administrator access rights.

- Download the latest version from here:

https://desktop.github.com/

- Find the downloaded file in your Downloads folder and double click on it.
- Installaton will start
- Eventually you will be asked about signing in the GitHub.com - skip that
because we use GitLab for our origin repository.
- The software will launch with the Get Started screen.

### Clone this repository with GitHub Desktop

- Ensure you are connected to campus directly or with VPN.
- Navigate in browser to home page of the project.
- Find the Blue "Clone" button and click on it.
- Next to the SSH URL click on the clipboard copy button.
- Run GitHub Desktop
- File menu
- Clone repository command
- Select URL tab in dialog box
- Paste the URL you copied earlier.
- Choose a location on your hard disk for your local clone.
- Click the Clone button.

Note that GitHub desktop will automatically use the SSH key pair you created
earlier to authenticate you to the remote host and the remote host to you so
you won't be prompted for a username or password.

You now have a duplicate of the repository on your hard disk, whose files 
you can browse in File Explorer and edit with Notepad++. 

You can use GitHub Desktop to keep your copy synchronised. Use "Fetch" to synchronise
and use "Pull" to both synch and switch to the latest version. Fetch is safe to do 
at any time but beware of "Pull" if you have uncommitted edits locally.

## Java Development Kit

JDK needs to be installed because it is required by ant, the build tool.

- Download *version 17* from this page;

https://www.oracle.com/java/technologies/downloads/#jdk17-windows

- Choose the compressed archive because the other options require administrator
access to run.

- Use 7-Zip or other tool to extract the archive to, e.g.

		c:\Users\your user name here\Software\

You will end up with a directory called somthing like:

		c:\Users\your user name here\Software\jdk-17.0.8

An extra step of manual configuration is needed to ensure that when you run
software it can find the JDK.

- Open the Windows control panel (Start menu - Windows System).
- Select User Accounts
- Select User Accounts
- Select 'Change my environment variables'
- Use the panel for user variables - you aren't allowed to edit system variables without administrator access
- Add an environment variable name `JAVA_HOME` and set the value to the directory of the JDK installation using the browse button.
- Edit the environment variable named `Path`
- Add a directory to the list
- Add the 'bin' subdirectory of the JDK directory e.g.:

		c:\Users\your user name here\Software\jdk-17.0.8\bin

The JDK is now installed under your user account. Test the installation this way

- Open a command prompt window (usually found in start menu under Windows System)
- Enter the command

		%JAVA_HOME%\bin\java -version

You should see output something like this:

	P:\>java -version
	java version "17.0.3.1" 2022-04-22 LTS
	Java(TM) SE Runtime Environment (build 17.0.3.1+2-LTS-6)
	Java HotSpot(TM) 64-Bit Server VM (build 17.0.3.1+2-LTS-6, mixed mode, sharing)

## Ant

This is the tool that processes files to build a project. Download the latest stable
version from:

https://ant.apache.org/bindownload.cgi

The ZIP format archive is probably the best choice for Windows.

- Extract the files to a directory named after the ant version, e.g.

		c:\Users\your user name here\Software\apache-ant-1.10.13

As with JDK it is necessary to edit environment variables.

- Create a variable `ANT_HOME` pointing at the base directory of the ant installation.
- Add the bin subdirectory of ant to the `Path` variable.

Test using a command prompt window like this:

	P:\>ant -version
	ANT_OPTS is set to  -Djava.security.manager=allow
	Apache Ant(TM) version 1.10.13 compiled on January 4 2023

## Ant plugins.

Two java archives need to be added to the ant installation to provide ant plugin
functionality that the project relies on.

- Find the following files in our Teams Team. Blackboard Channel -> Files -> MyBeckett Language Packs

		jackson-core-2.15.2.jar

		lbu-filters.jar
	
- Download both to the lib subdirectory of your ant installation. E.g. to

		c:\Users\your user name here\Software\apache-ant-1.10.13\lib

## Meld

Meld is a utility that can compare files and large sets of files. It can be used to 
compare a base language pack with a customised language pack so that individual
customisations can be checked.

- Install Meld from the LBU Software Centre on your computer.
- Run Meld from start menu
- You are recommended to go to Preferences and switch on text wrapping without splitting words because some of the string properties you will examine are very long.

