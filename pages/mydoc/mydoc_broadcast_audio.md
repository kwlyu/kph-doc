---
title: Broadcast Audio
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: July 3, 2016
summary: "Bring faders to unity and adjust the analog gain. Keep levels between -20dB to -10dB."
sidebar: mydoc_sidebar
simple_map: true
map_name: usermap
box_number: 4
permalink: mydoc_broadcast_audio.html
folder: mydoc
---

We use the [Yamaha QL1](https://usa.yamaha.com/products/proaudio/mixers/ql_series/index.html) as our broadcast audio mixer. 

{% include image.html file="ql1.jpeg" alt="QL 1" caption="QL 1" %}

## Patching

The QL1 receives (and can transmit) audio signal via [Dante](https://www.getdante.com/), as it is with all audio devices in our space. By default, it has the following patches:

### Inputs

| Input 1 | Input 2 | Input 3 | Input 4 | Input 5 | Input 6 | Input 7 | Input 8 | 
| :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | :-------- |
| CL 5L | CL 5R | DPA L | DPA R | KM 184 L | KM 184 R | Choir L | Choir R |

Inputs 1-8 are inputs for Kracum. 

- Inputs 1-2 are coming from a stereo mix from the [CL 5](https://usa.yamaha.com/products/proaudio/mixers/cl_series/index.html) at Front of House (FoH). 
- Inputs 3-4 are the omnidirectional mics hanging close to the stage.
- Inputs 5-6 are room mics hanging from the balcony.
- Inputs 7-8 are room mics placed upstage, behind the towers.


| Input 9 | Input 10 | Input 11 | Input 12 | Input 13 | Input 14 | Input 15 | Input 16 | 
| :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | :-------- |
| ARH L | ARH R| DM3 L | DM3 R | ARH Pdm |  | ARH HDMI | ARH HDMI |

Inputs 9-16 are inputs for Applebaum, though they can be used for other purposes. 

- Inputs 1-2 are the room mics in Applebaum.
- Inputs 3-4 are the stereo mix coming from the [DM 3](https://usa.yamaha.com/products/proaudio/mixers/dm3/index.html) from the FoH in Applebaum.
- Inputs 5 is the Applebaum podium mic.
- Inputs 7-8 are the HDMI audio going to the Applebaum projector.

### Outputs

All inputs send to the **STEREO** bus, which goes to our ATEM switcher. The **MONITOR** outputs to a pair of stereo speakers in the broadcast booth; it outputs identical but separate audio as the STEREO bus. If you have more questions about the broadcast audio topology, contact [Matthew Zimmerman](mailto:mzimmerman@carleton.edu).

## Adjusting the Analog Gain

You want to set the levels before you start any recording. This is done during rehearsals. 

- Press the **SEL** key for the channel that you want to adjust in the Channel Strip section.
{% include image.html file="ql1-chan-strip.png" alt="QL 1" caption="QL Channel Strip" %}

- Click the **GAIN** knob once to bring up the gain menu. While checking the sound level through the meters, adjust the channel **GAIN** knob of the Selected Channel section. Click Analog Gain, and use the **TOUCH AND TURN** knob to bring up/down the gain.

{% include image.html file="ql1-knobs.png" alt="QL 1" caption="Selected Channel Knobs" %}

- Adjust the gain level for other channels in the same way, by pressing their **SEL** keys, and then rotating the **GAIN** knobs.

## Sending an input channel signal to the STEREO bus

{% include image.html file="ql1-display.png" alt="QL 1" caption="Selected Channel Display" %}

1. Press the **SEL** key of the input channel you want to control.

2. Press one of the knobs in the Selected Channel section, to return to the SELECTED CHANNEL VIEW screen.

3. In the **TO ST PAN/BALANCE** field, make sure the **ST** button is on (lights in pink).

4. In the top panel, press the **ON** key of the corresponding input channel to turn it on.

5. In the Master section, turn on the **ON** key of the **STEREO** channel, and raise the STEREO channel fader to 0dB.

6. Raise the fader of the currently selected input channel to an appropriate volume. Ideally, the stereo levels should be in the -10dB to -20dB range. Turn down the gain if the mic starts clipping, i.e., meter level is **OVER**.

7. Turn on the **ON** key of the **MONITOR** channel, and raise the MONITOR fader to an appropriate volume.

### No sound?

At this point, you should hear sound from the booth speakers. If you don’t hear sound, check whether the L/R meters are moving in the METER field of the **QL**.

- If the L/R meters are moving on **BOTH the QL and the ATEM**:

It may be that the **MONITOR** channel hasn't been turned on. Make sure you're actually in **SCENE A**, and the Master section has **ST L** and **MONIT** as opposed to **ST L** and **MONO**. You're likely in **SCENE B** if you see **MONO**. In that case, Press the **1–32** key and **MIX/MATRIX** key simultaneously to switch between fader bank A and custom fader bank B.

{% include image.html file="ql1-fader-select.png" alt="QL 1" caption="Fader Bank Select Keys" %}

- If the L/R meters are moving on **the QL BUT NOT the ATEM**:

It may be that the Aux cable behind the ATEM got detached, or that the connection has come loose somewhere along the snake. Check the STEREO connection in the back.

- If the L/R meters are not moving:

Make sure that signals are being routed correctly to the patched input channels.
