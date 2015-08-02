# Packer-Windows81
A Packer build to make a pretty vanilla Windows 8.1 box for use with Vagrant.

There are a lot of really excellent projects out there to achieve something similar, but I found that most of them relied on SSH, which means they relied on installing SSH in Windows. Since Packer started supporting WinRM, I wanted to make a 'cleaner' Windows build for testing purposes. I like to start with things as vanilla as possible and go nuts from there. 

This build is very basic. It is intended to:

* Use an existing, vanilla, Windows 8.1 Enterprise trial ISO
* Enable WinRM (in a slightly scary, Unauthenticated mode, for Packer/Vagrant to use)
* Create a Vagrant user (as is the style)
* Grab all the Windows updates is can
* Install VMWare Tools
* Turn off Hibernation
* Turn on RDP
* Set the network type for the virtual adapter to 'Private' and not bug you about it

## Requirements

* **A copy of the [Windows 8.1 Enterprise Trial](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-8-1-enterprise)** - although any valid Windows 8.1 ISO will work - just change the product-key in the Autounattend.xml file. 
* **Packer / Vagrant** - Duh. Tested with Packer 0.82 and Vagrant 1.7.2. 
* **VMWare Workstation or Fusion** - warning: I have only tested this build on Fusion 7.1.2
* **The [Vagrant VMWare Provider](http://www.vagrantup.com/vmware)**

## Other things to note

You will, of course, have to change the `iso_url` and `iso_checksum` values in the `packer.json` file to pertain to your own personal Windows ISO. The MD5 that is in this repo is not likely to be a stock ISO MD5, as I've slip-streamed updates into my own ISO. 

This thing takes a REALLY LONG TIME TO BUILD because of all the updates. As of today (7/19/2015) there's something like 123 updates for it to go out and grab. The update grabbing script is a bit of a grey-box, as I basically just hijacked it (as well as lots of other code) from [this awesome project](https://github.com/joefitzgerald/packer-windows) - which I think is the defacto standard for Windows / Packer relations - but I wanted a leaner build. This project started as a frankenstein build, but is turning more into a ground-up rewrite of a lot of other projects' scripts and code. With the exception of the `update-windows.ps1` script, which I only modified very slightly, I will slowly go through all the code in this project and make sure I kill all the cruft. 



