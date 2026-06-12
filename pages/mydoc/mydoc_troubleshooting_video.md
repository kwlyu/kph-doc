---
title: Video isn't working
tags: [troubleshooting]
keywords: trouble, problems, support, error messages, problems, failure, error, #fail
last_updated: July 3, 2016
summary: "This page lists common errors and the steps needed to troubleshoot them."
sidebar: mydoc_sidebar
permalink: mydoc_troubleshooting_video.html
folder: mydoc
---

## I can't see QLab / QLab is displaying this weird calendar thing

You might be presented with a calendar display when you approach the QLab computer. This is another small script I wrote [here](https://github.com/kwlyu/calendar-web). It pulls and displays the [Carleton Arts Calendar](https://www.carleton.edu/arts/events/arts-calendar/) and updates that at midnight. The program displays an HTML file in Firefox. What you're seeing is likely Firefox being full screened.

To get out of Firefox, simply press `command+q` (shortcut to quit apps on MacOS in general) to quit. Firefox will ask you to confirm. Hit `return` to confirm. You will then be presented with the QLab interface (hopefully). Hit `escape` to panic all cues to make sure the midnight update cue is not running anymore. You may now [resume](/index.html) to production.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/quit-calendar.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>


##  QLab lower thirds are displaying only to the QLab output / not overlaying on the program

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

##  QLab credits aren't playing

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/qlab-mult-workspace.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

This is an instance where there might be **multiple** QLab workspaces open, and the program is having trouble discerning which workspace to prioritize. Close any additional workspace and trigger the cue again.


