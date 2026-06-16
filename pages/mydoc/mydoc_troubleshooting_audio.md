---
title: Sound isn't working
tags: [troubleshooting]
keywords: trouble, problems, support, error messages, problems, failure, error, #fail
# last_updated: July 3, 2016
summary: "This page lists common errors and the steps needed to troubleshoot them."
sidebar: mydoc_sidebar
permalink: mydoc_troubleshooting_audio.html
folder: mydoc
---


## No sound?

At this point, you should hear sound from the booth speakers. If you don’t hear sound, check whether the L/R meters are moving in the METER field of the **QL**.

- If the L/R meters are moving on **BOTH the QL and the ATEM**:

It may be that the **MONITOR** channel hasn't been turned on. Make sure you're actually in **SCENE A**, and the Master section has **ST L** and **MONIT** as opposed to **ST L** and **MONO**. You're likely in **SCENE B** if you see **MONO**. In that case, Press the **1–32** key and **MIX/MATRIX** key simultaneously to switch between fader bank A and custom fader bank B.

{% include image.html file="ql1-fader-select.png" alt="QL 1" caption="Fader Bank Select Keys" %}

- If the L/R meters are moving on **the QL BUT NOT the ATEM**:

It may be that the Aux cable behind the ATEM got detached, or that the connection has come loose somewhere along the snake. Check the STEREO connection in the back.

- If the L/R meters are not moving:

Make sure that signals are being routed correctly to the patched input channels.


## I can't move the faders

This is because the console is locked. If you see a black console screen with `CONSOLE LOCK` text on it, touch anywhere on the touchscreen to unlock. Then proceed with production.


## I can't control the headamps/phantom power

I will show this for QL/CL and DM series, since the interfaces are different. If you still can't see headamp on the console, make sure the channels are ***patched in DANTE Controller***.


### Mounting DANTE I/O on QL/CL

We use an I/O device to remotely control head amp that is connected to the QL/CL console.

1. Go to `SETUP`, `DANTE SETUP`, and press the `DEVICE MOUNT` tab in the lower part of the window.
2. Press any of the I/O device select button (the box after #x). A connected I/O device should indicate green. If you see a yellow bar with `virtual` text, you need to remount this device.
3. In the DEVICE SELECT window, press the `ONLINE DEVICE LIST`.
4. Use the [TOUCH AND TURN] knob to select devices within the network, e.g., RIO1608, Shure receivers, etc..
5. When you have finished making settings, press the OK button to close the window.
6. Reboot the I/O devices (first) and the Console (last), in that order.

<!-- <div style="display: flex; gap: 20px;">

  <div style="flex: 1;">
    {% include image.html file="ql1-device.jpeg" alt="QL 1" caption="Device Mount" %}
  </div>

  <div style="flex: 1;">
    {% include image.html file="ql1-online.jpeg" alt="QL 1" caption="Online Device" %}
  </div>

</div> -->


<!-- <div style="display: flex; gap: 10px; justify-content: center; align-items: stretch; width: 100%;">

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/ql1-device.jpeg' | relative_url }}" alt="Device Mount" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Device Mount</p>
  </div>

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/ql1-online.jpeg' | relative_url }}" alt="Online Device" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Online Device</p>
  </div>

</div> -->

<div style="display: table; width: 100%; table-layout: fixed; border-spacing: 15px 0; margin-bottom: 20px;">

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/ql1-device.jpeg' | relative_url }}" alt="Device Mount" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Device Mount</p>
  </div>

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/ql1-online.jpeg' | relative_url }}" alt="Online Device" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Online Device</p>
  </div>

</div>


### Mounting DANTE I/O on DM3

DM3 will automatically mount any **patched and supported** DANTE I/O. If you have a patched I/O that's not showing up, check below for their Dip Switches settings.



### Note on R I/O Dip Switch settings

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



## I'm doing a separate broadcast mix from the FoH mix, and I can only hear audio coming out of one console

This happens when multiple consoles are sharing the same Dante channel, but the transmitting channel doesn't have `multicast` enabled. Before we begin, it's always good practice to check the Rx and Tx channels are patched correctly.

By default, Dante uses `unitcast` to transmit audio. You'll need to enable `multicast` manually if you want the same channel of audio to go to different devices downstream. To do this, first log into Dante Domain Manager.


<!-- <div style="display: flex; gap: 10px; justify-content: center; align-items: stretch; width: 100%;">

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/dante-unmanaged.png' | relative_url }}" alt="Dante" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Dante Controller</p>
  </div>

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/dante-ddm-login.png' | relative_url }}" alt="Dante" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">DDM Login</p>
  </div> -->



<div style="display: table; width: 100%; table-layout: fixed; border-spacing: 15px 0; margin-bottom: 20px;">

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/dante-unmanaged.png' | relative_url }}" alt="Dante Controller" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Dante Controller</p>
  </div>

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/dante-ddm-login.png' | relative_url }}" alt="DDM Login" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">DDM Login</p>
  </div>

</div>

1. Open up **Dante Controller**. Because we have **Dante Domain Manager** (DDM) installed, click the DDM icon on the toolbar to login.
2. You'll see the login interface. Enter our DDM server [dante.carleton.edu](dante.carleton.edu), and select **Next**. You'll then be asked to enter your credentials. Enter your Carleton username and password.
3. Once logged in, go to the domain selector and select `WCC-MUSC-Perform`.

<!-- <div style="display: flex; gap: 10px; justify-content: center; align-items: stretch; width: 100%;">

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/dante-managed.png' | relative_url }}" alt="Dante" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Dante Controller</p>
  </div>

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/dante-ddm-domain.png' | relative_url }}" alt="Dante" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">DDM Domains</p>
  </div>

</div> -->


<div style="display: table; width: 100%; table-layout: fixed; border-spacing: 15px 0; margin-bottom: 20px;">

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/dante-managed.png' | relative_url }}" alt="Dante Controller" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Dante Controller</p>
  </div>

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/dante-ddm-domain.png' | relative_url }}" alt="DDM Domains" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">DDM Domains</p>
  </div>

</div>

You should see the following devices:

{% include image.html file="dante-perform.png" alt="Dante" caption="Dante Performance Domain" %}

Now that you're logged in, choose the Transmitting device you wish to configure multicast on. In my example, I'll be using Kracum' Symetrix Prism DSP:

1. Double-click the transmitter to bring up the device view. Navigate to the transmit tab. Click the multicast icon, highlighted in red below.
2. This brings up the page to create multicast flows, if there isn't one already configured. Click `Dante`, choose `8` for max channels per flow, and select the channels. You may pick specific channels, but you can also simply `Select All`. Click `Create` to finish.

<!-- <div style="display: flex; gap: 10px; justify-content: center; align-items: stretch; width: 100%;">

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/dante-device-tx.png' | relative_url }}" alt="Dante" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Dante Device View</p>
  </div>

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/dante-multicast.png' | relative_url }}" alt="Dante" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Dante Multicast</p>
  </div>

</div> -->


<div style="display: table; width: 100%; table-layout: fixed; border-spacing: 15px 0; margin-bottom: 20px;">

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/dante-device-tx.png' | relative_url }}" alt="Dante Device View" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Dante Device View</p>
  </div>

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/dante-multicast.png' | relative_url }}" alt="Dante Multicast" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Dante Multicast</p>
  </div>

</div>


Note that if there is already a multicast flow containing a certain channel, you won't be able to create another flow containing the same channel. If you wish to re-create flows, first select the flows to the right on device view, delete, and then follow the steps above to create a new flow. Audio will be briefly interrupted while you do this.

<!-- <div style="display: flex; gap: 10px; justify-content: center; align-items: stretch; width: 100%;">

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/dante-device-tx-2.png' | relative_url }}" alt="Dante" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Dante Device view</p>
  </div>

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/dante-multicast-2.png' | relative_url }}" alt="Dante" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Dante Multicast</p>
  </div>

</div> -->

<div style="display: table; width: 100%; table-layout: fixed; border-spacing: 15px 0; margin-bottom: 20px;">

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/dante-device-tx-2.png' | relative_url }}" alt="Dante Device View" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Dante Device View</p>
  </div>

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/dante-multicast-2.png' | relative_url }}" alt="Dante Multicast" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Dante Multicast</p>
  </div>

</div>