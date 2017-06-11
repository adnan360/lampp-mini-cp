# LAMPP Mini Control Panel
A simple Mini Control Panel for LAMPP (XAMPP for Linux)
Made with Love using Free Pascal and Lazarus. It can Start and Stop LAMPP server.

It is designed for XAMPP on Linux (LAMPP). But I guess the code can be used to implement this for Windows XAMPP too.

It asks for sudo password before Starting and Stopping.
It does so by utilizing pkexec, kdesu or gksu -- whichever it finds in the system.

![alt text](https://github.com/adnan360/lampp-mini-cp/raw/master/common/screenshots/lampp-mini-cp-1.png "LAMPP Mini Control Panel - free and open control panel for LAMPP - Screenshot after starting server")

# Download
Please see the Releases section

# Usage
Just copy the binary somewhere and then run. It should work. It just requires that a LAMPP installation is installed on /opt/lampp directory.

You can also create a .desktop file and run it, then use as usual.
The most basic form of a .desktop file would be (~/.local/share/applications/lampp_mini_cp.desktop):
```
[Desktop Entry]
Comment=LAMPP Mini Control Panel
Name=LAMPP Mini Control Panel
Exec=/path/to/lampp_mini_cp
Icon=/path/to/some/icon.png
Encoding=UTF-8
Terminal=false
Type=Application
```

It does not require sudo password when starting the program, but asks when Starting and Stopping. This way it is more secure (due to xorg security issues). Just run and enter when password is asked:

```
/path/to/lampp_mini_cp
```

or

```
cd /path/to/binary
./lampp_mini_cp
```

But you can surely run the program with sudo (convenient, but not recommended):

```
sudo /path/to/lampp_mini_cp
```

This will only ask for the sudo password at the beginning and not again when starting or stopping.

# Future plans
~~- To show status~~
- Single button for starting and stopping (if possible)
- Editing php.ini from within panel
- Individual modules start and stop
- Command line parameters
- GUI revamp
