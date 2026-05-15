---
title: Sony PTZ Control
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: July 3, 2016
summary: "You can insert notes, tips, warnings, and important alerts in your content. These notes make use of Bootstrap styling and are available through data references such as site.data.alerts.note."
sidebar: mydoc_sidebar
simple_map: true
map_name: usermap
box_number: 3
permalink: mydoc_ptz.html
folder: mydoc
---

We use Sony's [RM-IP500](https://www.sony.com/electronics/support/ptz-and-remote-cameras-ptz-cameras/rm-ip500) to control the 6 [Sony PTZ Cameras](https://pro.sony/ue_US/products/ptz-network-cameras/srg-300se) we have in our space. 

{% include image.html file="ptz-ctrl-top.png" alt="Sony PTZ" caption="Sony PTZ Control" %}

{% include important.html content="Note that the camera selection in PTZ control is **separate** from the input selection in ATEM. To control a camera that's been put on `Preview`, you have to **first select the correct `Input` on the ATEM computer AND select the correct `Camera` on the PTZ control**. PTZ control and ATEM are separated. " %}

## Selecting a camera

You can select the camera you want to control using the `Camera Selection Block`. Camera 1-5 corresponds to Input 1-5 on the ATEM, and Camera 6 is the Applebaum camera (Input 8). If the network is set up correctly, the `buttons` for camera 1-6 should light in <span class="cb">blue</span>. Press the number of the CAMERA button to select. The selected button will light in <span class="cy">yellow</span>.

## Operating a camera

### Pan and tilt control

1. Select the target camera to control.
2. Make sure the ACTIVE button is lit on the joystick control block.
3. Adjust the PAN-TILT SPEED. Turning the PAN-TILT SPEED knob clockwise increases the speed, and turning counterclockwise decreases the speed.
4. Incline to the right/left to pan camera to the right/left. Push the joystick down to move the camera down, and pull the joystick up to move the camera up.

{% include image.html file="pan-tilt.png" alt="Sony PTZ" caption="Pan-Tilt Control" %}

### Zoom control

1. Select the target camera to control.
2. Make sure the ACTIVE button is lit on the lens control block.
3. Move the ZOOM lever left/right to make the subject appear smaller/larger.
4. Adjust the ZOOM SPEED as needed. Turning the ZOOM SPEED knob clockwise increases the zoom speed, and turning counterclockwise decreases the zoom speed.

{% include image.html file="zoom.png" alt="Sony PTZ" caption="Zoom Control" %}

### Adjusting the focus

1. Select the target camera to control.
2. Make sure the ACTIVE button is lit on the lens control block.
3. Leave the mode on AUTO FOCUS, making sure the button is lit yellow.

{% include image.html file="focus.png" alt="Sony PTZ" caption="Focus Control" %}

### Adjusting the brightness

We don't recommend the auto-exposure (AE) function. It simply looks bad.

1. Make sure the AE button is off (button is not lit).
2. Turn the IRIS knob counterclockwise until the iris is all the way up (F=1.6, lower is better).
3. Press the GAIN button in the menu control block to highlight the corresponding value on the camera image and turn the VALUE knob to adjust the value.

{% include image.html file="brightness.png" alt="Sony PTZ" caption="Brightness Control" %}

By opening up the iris to its max setting, we're letting as much light into the camera as possible. This reduces the level of noise in our video.

## Storing the Camera Presets

All camera parameters we just mentioned can be stored as presets to recall during the show. 

1. Make sure the ACTIVE button is on (button is lit) on the joystick control block and preset memory control block.
2. Select the camera whose status you want to store.
3. Operate the joystick to pan/tilt the orientation of the camera.
4. Perform zoom, focus, backlight compensation, flicker compensation, and white/black balance adjustments, as required.
5. Check that the DIRECT RECALL button is off.
6. Enter the preset number you want to store. Use the PRESET 10/0 button to enter a “0” digit. You can store up to 100 presets per camera.
7. Press and hold the STORE button. The preset number at the bottom right of the LCD panel is displayed highlighted, and storing is completed when the display disappears.

{% include image.html file="store-preset.png" alt="Sony PTZ" caption="Storing Presets" %}

### Recalling presets

There are two methods for recalling stored status: direct recall and number recall.

* Direct recall

1. Make sure the DIRECT RECALL button is on (button is lit yellow).
2. Press the PRESET 1 to PRESET 10/0 buttons to recall preset numbers 1 to 10. **Only preset numbers 1 to 10 can be recalled using direct recall**. 

We recommend this because it saves you a lot of time during the show. For this reason, we suggest you limit and store your presets to 1-10.

* Number recall

1. Make sure the DIRECT RECALL button is off (button is NOT lit yellow).
2. Enter the preset number using the PRESET 1 to PRESET 10/0 buttons, in the same way as when storing a preset.
3. Press the RECALL button. Preset numbers 1 to 100 can be recalled using number recall.



