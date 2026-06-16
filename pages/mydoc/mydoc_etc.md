---
title: Fun Tricks for EOS
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
# last_updated: July 3, 2016
summary: "Some fun tricks for EOS."
sidebar: mydoc_sidebar
permalink: mydoc_etc.html
folder: mydoc
---

Before things get crazy, it's always a good idea to know how to get back to a known stage. `Macro 1` is the startup macro that restores every tab to their default location. If you're ever lost in the tabs and wants to get back to a familiar place, press:

- **\[Macro\] \[1\] \[Enter\]**

{% include image.html file="eos-macro.png" alt="ETC ION Classic" caption="Run EOS Macros" %}

The content below assumes you have some basic understanding of EOS programming. If you're unsure of how to get started, consult

## Pixel Mapping

There's a pixel map already configured for this hall. It represents a 1-1 map of the LED Wall Panels. To make our lives easier, you can use `Macro 2` to view and edit those channels. You monitors will instead look like this.

- **\[Macro\] \[2\] \[Enter\]**

<div style="display: table; width: 100%; table-layout: fixed; border-spacing: 15px 0; margin-bottom: 20px;">

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/eos-screen-1.jpeg' | relative_url }}" alt="ION Screen 1" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">ION Screen 1</p>
  </div>

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/eos-screen-2.jpeg' | relative_url }}" alt="ION Screen 2" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">ION Screen 2</p>
  </div>

</div>

### Virtual Channels

You will notice immediately five hidden channels: **\[911\] \[Thru\] \[915\]**. These are **virtual** channels corresponding to the **physical** channels of the wall. We use these virtual channels to create layouts of fixtures, known as pixel maps, which then applies media content (images, movies, text, and procedurally generated effects) by way of virtual media layers to the pixel map. A pixel map is a layout of fixtures onto a grid, which determines order of playback and how the data will be interpreted and outputted to create the desired image or effect. A virtual media layer contains one piece of media content.

<div style="display: table; width: 100%; table-layout: fixed; border-spacing: 15px 0; margin-bottom: 20px;">

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/eos-magic-pixel.png' | relative_url }}" alt="Magic Sheet Pixel Map Channels" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Magic Sheet Pixel Map Channels</p>
  </div>

  <div style="display: table-cell; text-align: center; vertical-align: top; width: 50%;">
    <img src="{{ '/images/eos-patch-pixel.png' | relative_url }}" alt="Patch Pixel Map Channels" style="width: 100%; max-width: 100%; height: auto; display: block; margin: 0 auto;">
    <p style="font-size: 0.9em; margin-top: 8px; line-height: 1.2;">Patch Pixel Map Channels</p>
  </div>

</div>

From the patch above, you can see that 
- **Chan \[911\]** is a **virtual server**; think of this as the **master layer**.
- **Chan \[912 + 913\]** are **media layers**; these channels are where you load images or videos.
- **Chan \[914 + 915\]** are **effect layers**; these channels have some built-in stock effects.

Our wall is a **74 (width) x 4 (height)** grid, so it doesn't have high enough resolution for media layers to appear properly. So for our purposes, we will be mostly using the effect layers.

### Effect Layer

To apply a pixel map effect, you need both the virtual server (911) and an effect layer (i.e. 914) to be on. Press:

- **\[911\] \[Full\] \[Full\]** to turn Channel 911 to full.

Use Moving Light (ML) Controls (**\[Tab\] \[5\]**) on your left screen to turn `Crossfade` to `-100` (by pressing `Min`). This will ensure the virtual channels takes control *over* the physical channel. If `Crossfade` is set to `100`, then the physical channels will take over the virtual channels.

{% include image.html file="eos-ml-crossfade.png" alt="ETC ION Classic" caption="ML Control - Crossfade" %}

Then turn the one of the effect layers on:

- **\[914\] \[Full\] \[Full\]**

In ML Controls, set:

- **\[914\] \[Width\] \[74\] \[Enter\]**
- **\[914\] \[Height\] \[04\] \[Enter\]**

{% include image.html file="eos-ml-width-height.png" alt="ETC ION Classic" caption="ML Control - Width & Height" %}

You will need to enter the leading 0 before 4. EOS omits trailing zeros, so if you just enter `4`, EOS will interpret it as `40`. Now we can start setting the effects. There are three main effect types:

1. Two color gradients - adjustable gradients with start and end colors
2. Rainbow gradients - fixed gradient, full hue spectrum
3. Perlin noise - good for animating random color effects, adjustable gradients

{% include image.html file="eos-pixel-rainbow-effect.png" alt="ETC ION Classic" caption="Effect Files" %}

The effects are stored in file 1. File 1:0 is a home position of no effect. 1 through 3 are perlin noise effects, 4 is a perlin noise/ rainbow gradient, 5 through 9 are rainbow gradients, and 10 through 19 are two color gradients. We will demonstrate two types:

##### Rainbow Gradients
For instance, if we select `File 8` in ML Controls, you will see the following rainbow effect radiating from the center.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/eos-pixel-rainbow.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

You may adjust any non-intesity parameter from the ML Controls tab, including playback speed.



{% include image.html file="eos-ml-playback-speed.png" alt="ETC ION Classic" caption="Effect Playback Speed" %}


##### Two Color Perlin Noise
{% include image.html file="eos-pixel-two-color.png" alt="ETC ION Classic" caption="Two Color Effects" %}

Any file with only red and blue icons are *two-color* effects, where you can set a start and an end color. For instance, `File 2` is a two color Perlin noise effect. This is what it looks like:

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/eos-pixel-ab-color.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

You can save these channels just like you would with other channels. Check [here](https://www.etcconnect.com/WebDocs/Controls/EosFamilyOnlineHelp/en/Content/12_Cues_and_Cue_Lists/CUES_AND_CUE_LISTS.htm?tocpath=Cues%20and%20Cue%20Lists%7C_____0) if you're unsure how to record them into cues.

## Effects




## Discrete Timing



## Offset vs. Fan

