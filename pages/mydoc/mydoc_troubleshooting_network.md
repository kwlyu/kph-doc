---
title: Network isn't working
tags: [troubleshooting]
keywords: trouble, problems, support, error messages, problems, failure, error, #fail
# last_updated: July 3, 2016
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


## How do I transfer files from the hyperdeck to the NAS?

Our BMD Hyperdeck supports FTP, which means we can download and upload its recordings without having to remove the media. To do this, launch **Cyberduck** {% include inline_image.html file="cyberduck_size.png" alt="Cyberduck button" %} in the dock.

{% include image.html file="cyberduck-bookmark.png" alt="Cyberduck" caption="Cyberduck Bookmark" %}

1. If you don't see a bookmark called **KPH Hyperdeck** already, click the `+` icon on the bottom left to create a connection. If you do, skip the follow step.
2. Enter the **nickname**, **server address** ([10.130.18.106](10.130.18.106)), and enable **anonymous login** like below. You can now connect to the hyperdeck.

{% include image.html file="cyberduck-new-bookmark.png" alt="Cyberduck" caption="Create Cyberduck Bookmark" %}

Now you should see a bookmark like that in step 1. You can double-click the bookmark to view the files inside the Hyperdeck. 

{% include image.html file="cyberduck-filetree.png" alt="Cyberduck" caption="Cyberduck File Tree" %}

You can now open our NAS and drag desired files from the Hyperdeck into a NAS folder. I recommend putting it inside a designated folder to keep things organized. An example would be `/Volumes/kracum/Recording Media/Video/1_Pre-Edit_Media/BMD`.

<div style="display: table; width: 100%; table-layout: fixed; border-spacing: 15px 0; margin-bottom: 20px;">

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/nas-bmd-folder.png' | relative_url }}" alt="BMD NAS Folder" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">BMD NAS Folder</p>
  </div>

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/cyberduck-transfer.png' | relative_url }}" alt="Cyberduck File Transfer" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Cyberduck File Transfer</p>
  </div>

</div>

While you're transferring, Cyberduck will show you the real-time statistics and give you a confirmation when done.


## How do I use the iPad to control the light board?

On the iPad, make sure your Wi-Fi is connected to `Kracum Lighting`. Go to the lighting folder, open `MobileRFR`. It should connect to `WCC ION (10.101.100.101)` automatically. You can then use the `Facepanel` or the `Channel Check` function to control the light board.

After you're done, switch the Wi-Fi back to `eduroam`.