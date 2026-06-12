---
title: Network isn't working
tags: [troubleshooting]
keywords: trouble, problems, support, error messages, problems, failure, error, #fail
last_updated: July 3, 2016
summary: "This page lists common errors and the steps needed to troubleshoot them."
sidebar: mydoc_sidebar
permalink: mydoc_troubleshooting_network.html
folder: mydoc
---

## I can't see the NAS

On the Mac you wish to connect to the NAS, go to `Finder`, hit `cmd+k`. You should see the following.

{% include image.html file="smb.png" alt="Mount Network Drive" caption="Mounting Network Drives" %}

Enter this [smb://colossus.its.carleton.edu/kracum](smb://colossus.its.carleton.edu/kracum) into the address bar. It'll then ask you to authenticate:

{% include image.html file="smb-login.png" alt="Mount Network Drive" caption="NAS LDAP Authentication" %}

Enter your full Carleton email and password. You may remember this in the keychain if you don't want to re-enter this information. You should be able to see this folder.

{% include image.html file="nas-folder.png" alt="Mount Network Drive" caption="Kracum Folder" %}

If you want to have this folder open automatically when the computer boots up, go to `System Settings`, `General`, and `Login Items & Extensions`. Then click the `+` icon and select the Kracum folder from the sidebar. If you've remembered your credentials in the keychain, the folder will launch at system start up.