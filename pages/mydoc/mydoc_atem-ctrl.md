---
title: ATEM Software Control
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: July 3, 2016
summary: "Select [1] - [8] to bring inputs to preview. Hit [space] for cuts, and use [return] for dissolves."
sidebar: mydoc_sidebar
simple_map: true
map_name: usermap
box_number: 2
permalink: mydoc_atem-ctrl.html
folder: mydoc
---

## Switching Basics

We use [ATEM Software Control](https://www.blackmagicdesign.com/products/atemmini/software) to control the Blackmagic switchers in our spaces. We'll use the main switcher, [ATEM 1 M/E Constellation HD](https://www.blackmagicdesign.com/products/atemconstellation/techspecs/W-APS-25), as our example.

When you sit down at the broadcast booth, you will likely see the multiview on the monitor, and the ATEM software on the ATEM laptop.

<div style="display: flex; gap: 15px; align-items: flex-start;">
  {% include image.html file="multiview.png" alt="Multiview" caption="ATEM Multiview" max-width="400" %}
  {% include image.html file="atem-software.png" alt="ATEM Software" caption="ATEM Software" max-width="400" %}
</div>

### Inputs 

On the multiview, you will see a selection of `Inputs`, along with `Preview` and `Program`. Think of program as the end result, i.e., what shows up on the recording/livestream, and preview as the ''scene'' before program. We are using 8 out of 10 inputs on the switcher. They're:

| Input 1 | Input 2 | Input 3 | Input 4 | Input 5 | Input 6 | Input 7 | Input 8 | 
| :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | :-------- |
| House Left | House Center | House Right | Stage Right | Stage Left | Projector | QLab | Applebaum |

Input 1-5 corresponds to the 5 PTZ cameras in Kracum, and Input 8 corresponds to the PTZ camera in Applebaum. Input 7 mirrors the Kracum projector output, if applicable, and Input 7 is the graphics output from QLab. 


### Transitions

To control the switcher:
- Press any key from `1` through `8` to bring up a particular input to `Preview`. This allows you to make any adjustments to the image before you sends it to program. 
- Press `space` to **cut** `Preview` to `Program`; this immediately switches `Preview` and `Program`.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/atem-cut.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

- Press `return` to **dissolve** `Preview` to `Program`; this fades between `Preview` and `Program` at the rate specified below. The default rate is 1 second.

<!-- Container to hold the videos side-by-side -->
<div style="display: flex; gap: 10px; justify-content: center; align-items: start;">

  <video autoplay loop muted playsinline style="width: 49%; height: auto;">
    <source src="{{ '/videos/atem-dissolve2.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support the video tag.
  </video>

  <video autoplay loop muted playsinline style="width: 49%; height: auto;">
    <source src="{{ '/videos/atem-software-dissolve2.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support the video tag.
  </video>

</div>

{% include important.html content="While dissolving, if you select any other input to preview, the program will eventually **dissolve to the last selected preview**. For instance, if you had input 2 on preview and input 3 on program, and while dissolving, you selected input 4 to preview, the program will be input 4 as opposed to input 2 after transition. This might happen when there's a quick transition. Just keep in mind to only select previews **after** the transition is complete." %}

## Switcher Parameters

### Outputs

| Output 1 | Output 2 | Output 3 | Output 4 | Output 5 | Output 6 |
| :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | 
| Crestron DA | Hyperdeck Record | Preview | Output 4 | Output 5 | Output 6 | 

The switcher has 6 routable outputs. We're using at least 3. 

- Output 1 goes to a `Crestron` encoder that distributes broadcast video to the Lobby, Backstage, and Greenroom monitors. 
    - During rehearsals, this is set to `QLab`, which only displays the `Title` of the event, so the video engineers can set camera presets. 
    - About 30 to 15 minutes before show starts, this is set to `Program`, so the monitors can follow whatever the recording gets. 
    - After the show ends, this will be automatically set to `QLab` again, displaying the calendar program for upcoming events.

- Output 2 goes to our [Hyperdeck Recorder](https://www.blackmagicdesign.com/products/hyperdeckstudio/techspecs/W-HYD-11). This will always be set to `Program`.

- Output 3 goes to a confidence monitor in the broadcast booth. This will follow whatever output 1 gets, so the technicians have an idea of what the audience is seeing.

The rest of the outputs is defaulted to program. We sometimes use it for extra recording, a dedicated streaming feed into our [Pearl Nano](https://www.epiphan.com/products/pearl-nano/) streamer, etc.

### Keys

{% include important.html content="Make sure you have the **`Downstream Key`** set to the following parameters. <br>

        * You may adjust the **`Clip`** and the **`Gain`** to your liking, but these just affect the transparency of the lower thirds. <br>

        * The **`Rate`** for **`DSK 1`** controls the amount of time it takes to fade in/out the key; I recommend leaving this at 1 second. <br>

        * The **`Rate`** under **`Transition style`** controls the fade time for **`Dissolve`**.
" %}

{% include image.html file="atem-dissolve.png" alt="ATEM Parameters" caption="Downstream Key Parameters." %}

If you somehow messed up the parameters, check the `Document` folder for backup. Otherwise, download a copy [here](https://github.com/kwlyu/kph-documentation/raw/refs/heads/main/showfiles/KL%20ATEM+QLAB5%202026-05-07%2016-21-24.xml).

## Recording and Streaming

This part only applies to the ATEM Mini in Applebaum. You can ISO recording all inputs and outputs to an external drive through the USB-C port at the back of the ATEM. The `Record` button will show up on the right under output once the drive is plugged in. You may also stream to Carleton's IBM RTMP server. Refer to the `Stream Keys` document for details about the server and the key. We don't recommend streaming via any Blackmagic devices, because of [this](https://forum.blackmagicdesign.com/viewtopic.php?f=4&t=117185) issue here. Instead, see [this section](/index.html#recording-and-streaming-1) on how to set up recording and streaming.

{% include image.html file="atem-mini.png" alt="ATEM Mini" caption="ATEM Mini Record and Stream." %}