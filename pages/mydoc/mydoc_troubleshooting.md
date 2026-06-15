---
title: Troubleshooting
tags: [troubleshooting]
keywords: trouble, problems, support, error messages, problems, failure, error, #fail
# last_updated: July 3, 2016
summary: "This page lists common errors and the steps needed to troubleshoot them."
sidebar: mydoc_sidebar
permalink: mydoc_troubleshooting.html
folder: mydoc
---

## Video isn't working

### I can't see QLab / QLab is displaying this weird calendar thing

You might be presented with a calendar display when you approach the QLab computer. This is another small script I wrote [here](https://github.com/kwlyu/calendar-web). It pulls and displays the [Carleton Arts Calendar](https://www.carleton.edu/arts/events/arts-calendar/) and updates that at midnight. The program displays an HTML file in Firefox. What you're seeing is likely Firefox being full screened.

To get out of Firefox, simply press `command+q` (shortcut to quit apps on MacOS in general) to quit. Firefox will ask you to confirm. Hit `return` to confirm. You will then be presented with the QLab interface (hopefully). Hit `escape` to panic all cues to make sure the midnight update cue is not running anymore. You may now [resume](/index.html) to production.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/quit-calendar.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>


###  QLab lower thirds are displaying only to the QLab output / not overlaying on the program

Sometimes this happens after a power outage where everything is power-cycled. The ATEM switcher or the laptop controlling the ATEM refreshes its `Downstream Key` settings. Make sure the `Donstream Key` has the following settings:

<!-- {% include callout.html content="
Fill Source:  **QLAB** <br>
Key Source:   **QLAB** <br>
Top Mask:     **-6** <br>
Bottom Mask:  **-9** <br>
Left Mask:    **-16** <br>
Right Mask:   **16** <br>
Clip:   **0%** <br>
Gain:   **40%** 
 " type="danger" %}  -->


<style>
td, th {
   border: none!important;
}
</style>

| Fill Source | **QLAB** |
| Key Source | **QLAB** |
|Top Mask | **-6** |
|Bottom Mask | **-9** |
| Left Mask | **-16** |
| Right Mask | **16** |
| Clip | **0%** |
| Gain | **40%** |

{% include image.html file="atem-dissolve.png" alt="Downstream Key" caption="Downstream Key Parameters" %}


If after configuring the ATEM, the lower thirds are still not displaying on the program, the next step is to check the QLab settings. Click the gear icon at the bottom right of the QLab window, or click `cmd+,` to bring up the settings menu. Go to network, and you should see the network connections configured like the following.

{% include image.html file="qlab-network.png" alt="QLab Network Settings" caption="QLab Network Settings" %}

Lastly, on the same computer, open AV Bridge (formerly atemOSC) from the dock. This program receives OSC messages from QLab and convert and transmit to ATEM. Make sure the destinations have the correct IP's.

{% include image.html file="atemOSC.png" alt="ATEM OSC" caption="ATEM OSC" %}

###  QLab credits aren't playing

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/qlab-mult-workspace.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

This is an instance where there might be **multiple** QLab workspaces open, and the program is having trouble discerning which workspace to prioritize. Close any additional workspace and trigger the cue again.





## Sound isn't working

### No sound?

At this point, you should hear sound from the booth speakers. If you don’t hear sound, check whether the L/R meters are moving in the METER field of the **QL**.

- If the L/R meters are moving on **BOTH the QL and the ATEM**:

It may be that the **MONITOR** channel hasn't been turned on. Make sure you're actually in **SCENE A**, and the Master section has **ST L** and **MONIT** as opposed to **ST L** and **MONO**. You're likely in **SCENE B** if you see **MONO**. In that case, Press the **1–32** key and **MIX/MATRIX** key simultaneously to switch between fader bank A and custom fader bank B.

{% include image.html file="ql1-fader-select.png" alt="QL 1" caption="Fader Bank Select Keys" %}

- If the L/R meters are moving on **the QL BUT NOT the ATEM**:

It may be that the Aux cable behind the ATEM got detached, or that the connection has come loose somewhere along the snake. Check the STEREO connection in the back.

- If the L/R meters are not moving:

Make sure that signals are being routed correctly to the patched input channels.


### I can't move the faders

This is because the console is locked. If you see a black console screen with `CONSOLE LOCK` text on it, touch anywhere on the touchscreen to unlock. Then proceed with production.


### I can't control the headamps/phantom power

I will show this for QL/CL and DM series, since the interfaces are different. If you still can't see headamp on the console, make sure the channels are ***patched in DANTE Controller***.


#### Mounting DANTE I/O on QL/CL

We use an I/O device to remotely control head amp that is connected to the QL/CL console.

1. Go to `SETUP`, `DANTE SETUP`, and press the `DEVICE MOUNT` tab in the lower part of the window.
2. Press any of the I/O device select button (the box after #x). A connected I/O device should indicate green. If you see a yellow bar with `virtual` text, you need to remount this device.
3. In the DEVICE SELECT window, press the `ONLINE DEVICE LIST`.
4. Use the [TOUCH AND TURN] knob to select devices within the network, e.g., RIO1608, Shure receivers, etc..
5. When you have finished making settings, press the OK button to close the window.
6. Reboot the I/O devices (first) and the Console (last), in that order.

<div style="display: flex; gap: 20px;">

  <div style="flex: 1;">
    {% include image.html file="ql1-device.jpeg" alt="QL 1" caption="Device Mount" %}
  </div>

  <div style="flex: 1;">
    {% include image.html file="ql1-online.jpeg" alt="QL 1" caption="Online Device" %}
  </div>

</div>


#### Mounting DANTE I/O on DM3




#### Note on R I/O Dip Switch settings

Long story short, here's the dip switches settings for 

- Kracum: **only 2 and 4 down**, the rest is up
- Applebam: **only 2 and 7 down**, the rest is up.

Here's what each dip switch does.

- Switch 1 (Unit ID)
This switch determines whether the hex setting of the UNIT ID Switch will range from 0 to F or from 10 to 1F.

{% include image.html file="rio-dip-1.png" alt="RIO Dip Switches" caption="RIO Dip Switches" %}

- Switch 2 and 3 (IP Select Mode)

These switches specify (basically) the ranges/type of IP addresses used when communicating. This is what we were having trouble with before.

{% include image.html file="rio-dip-23.png" alt="RIO Dip Switches" caption="RIO Dip Switches" %}

To confuse their users, Yamaha uses 3 different IP schemes: DHCP, Auto IP, and Static IP. Older devices, such as the first generation of RIOs, don't have the ability to specify this themselves, so you'll have to set this manually. DHCP (the Yamaha setting) is when the IP addresses are handed out by an external DHCP (the technology) server (e.g., 10.210.x.x); this is what we're using, so you should put **2 down and 3 up**.

Auto IP is a Yamaha setting. It can be DHCPed (the technology). This is when IP's are in the 192.168.x.x range, which is typical for a home router. Follow this if you're using this range.

To further confuse you, you can set it to STATIC IP Auto, so the IP of each device will be 192.168.0.x, where x is the unit ID.

Lastly, you can always set IP's statically. 

- Switch 4 (Secondary Port)

{% include image.html file="rio-dip-4.png" alt="RIO Dip Switches" caption="RIO Dip Switches" %}

For places with a dedicated secondary Dante network (i.e., Kracum), you want to have the switch on redundant mode. For places without a secondary network (Appleabaum), it's best to leave this on daisy chain mode. 

Always check if you have a secondary network in place. If you daisy chain two separate networks together when they're not supposed to, you can create a broadcast (network) storm. This is true for consoles as well. Make sure they're set to redundant mode when they have a redundant network connected.

- Switches 5 and 6 (Remote)

Set this to NATIVE since we only use Yamaha consoles.

{% include image.html file="rio-dip-56.png" alt="RIO Dip Switches" caption="RIO Dip Switches" %}

- Switches 7 and 8 (Start up)

You can leave this the way it is. Whenever you recall a scene on a console, you'll recall the headamp settings, so it's not a huge deal if the headamp gets refreshed.

{% include image.html file="rio-dip-78.png" alt="RIO Dip Switches" caption="RIO Dip Switches" %}





## I can't see the NAS

On the Mac you wish to connect to the NAS, go to `Finder`, hit `cmd+k`. You should see the following.

{% include image.html file="smb.png" alt="Mount Network Drive" caption="Mounting Network Drives" %}

Enter this [smb://colossus.its.carleton.edu/kracum](smb://colossus.its.carleton.edu/kracum) into the address bar. It'll then ask you to authenticate:

{% include image.html file="smb-login.png" alt="Mount Network Drive" caption="NAS LDAP Authentication" %}

Enter your full Carleton email and password. You may remember this in the keychain if you don't want to re-enter this information. You should be able to see this folder.

{% include image.html file="nas-folder.png" alt="Mount Network Drive" caption="Kracum Folder" %}

If you want to have this folder open automatically when the computer boots up, go to `System Settings`, `General`, and `Login Items & Extensions`. Then click the `+` icon and select the Kracum folder from the sidebar. If you've remembered your credentials in the keychain, the folder will launch at system start up.