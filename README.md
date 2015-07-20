# Packer-Windows81
A Packer build to make a pretty vanilla Windows 8.1 box for use with Vagrant.

There are a lot of really excellent projects out there to achieve something similar, but I found that most of them relied on SSH, which means they relied on installing SSH in Windows. Since Packer started supporting WinRM, I wanted to make a 'cleaner' Windows build for testing purposes. I like to start with things as vanilla as possible and go nuts from there. 

This build is very basic, but still needs some cleaning up. It is intended to:

* Use an existing, vanilla, Windows 8.1 Enterprise trial ISO
* Enable WinRM (in a slightly scary, Unauthenticated mode, for Packer to use)
* Create a Vagrant user (as is the style)
* Grab all the Windows updates is can
* Install VMWare Tools
* Turn off Hibernation
* Turn on RDP
* Set the network type for the virtual adapter to 'Private'

It does a couple of little extra things I may turn off, like making the vagrant account auto-login, but that's the meat-and-potatoes of the thing. 

This thing takes a REALLY LONG TIME TO BUILD because of all the updates. As of today (7/19/2015) there's something like 123 updates for it to go out and grab. The update grabbing script is a bit of a grey-box, as I basically just hijacked it (as well as lots of other code) from [this awesome project](https://github.com/joefitzgerald/packer-windows) - which I think is the defacto standard for Windows / Packer relations - but I wanted a leaner build. I will review the code in the Windows Update script as time goes on, as well as clean up a lot of odds and ends (such as the fact that the Windows ISO stays mounted in the VM after it is built!). 

This is currently useable but there are some minor issues. You can track my action-item list by checking out [the open issues](https://github.com/luciusbono/Packer-Windows81/issues). 
