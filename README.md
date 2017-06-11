# LAMPP Mini Control Panel
A simple Mini Control Panel for LAMPP (XAMPP for Linux)
Made with Love using Free Pascal and Lazarus. It can Start and Stop LAMPP server.

It is designed for XAMPP on Linux (LAMPP). But I guess the code can be used to implement this for Windows XAMPP too.

It asks for sudo password before Starting and Stopping.
It does so by utilizing pkexec, kdesu or gksu -- whichever it finds in the system.

# Future plans
- To show status
- Single button for starting and stopping (if possible)
- Editing php.ini from within panel
- Individual modules start and stop
- Command line parameters
- GUI revamp
