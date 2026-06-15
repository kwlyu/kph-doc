---
title: Broadcast Video
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
# last_updated: July 3, 2016
summary: "Complete graphics. Set camera/audio levels. Bring Title graphics to program. Start recording/streaming."
sidebar: mydoc_sidebar
simple_map: true
map_name: usermap
box_number: 5
permalink: mydoc_broadcast_video.html
folder: mydoc
---

## Recording and Streaming

We use an [Blackmagic Hyperdeck Studio Mini](https://www.blackmagicdesign.com/products/hyperdeckstudio/techspecs/W-HYD-11) as our recorder. It takes SDI input from `output 2` of the Constellation switcher, which is always set to `Program`.

You should format an SD Card via its front LCD based menu settings. To plug in an SD card:

1. Hold the SD card with the gold connectors facing your HyperDeck’s LCD and align it with the media slot. Now gently push the card into the slot until you feel it lock firmly into place.
2. Your HyperDeck will verify the SD card. This is shown by an illuminated green indicator above the SD card slot. When the indicator turns off and the stop button on the control panel is illuminated, your HyperDeck is ready to record.

{% include image.html file="hyperdeck-sd.png" alt="Hyperdeck" caption="Gently push the SD card into the slot until you feel it click into place" %}

### Formatting SD cards

Media used by HyperDeck must be formatted as either HFS+ or exFAT. HFS+ is also known as Mac OS Extended and is the recommended format for HyperDeck as it supports journaling. Data on a journaled disk is more quickly recovered in the rare event it becomes corrupted, and less likely to be corrupted in the first place. HFS+ is natively supported by Mac OS. To format using your HyperDeck:

{% include image.html file="hyperdeck-format.png" alt="Hyperdeck" caption="the **format card** setting is in the **record** menu." %}

1. Insert the media you want to format into either of the SD card or SSD slots.
2. Press the "menu" button on your HyperDeck’s control panel.
3. On HyperDeck Studio Mini, turn the jog/shuttle wheel and use the set button to enter the "record" menu on the LCD and select format card.
4. Select the SD card or SSD you want to format on the LCD using the jog/shuttle wheel. Remember to press the ‘set’ button to confirm your selection.
5. Now set your desired format from the ‘HFS+’ or ‘exFAT’ options.
6. A warning message will appear on the LCD asking you to confirm the format. Make sure you have backed up any important data before you confirm as this action cannot be undone. Confirm the format by selecting ‘format’ for SD cards using the jog/shuttle wheel and pressing the ‘set’ button.

<div style="display: flex; gap: 20px;">

  <div style="flex: 1;">
    {% include image.html file="hyperdeck-osextend.png" alt="Hyperdeck" caption="On HyperDeck Studio Mini, HFS+ is labeled **OS X Extended**" %}
  </div>

  <div style="flex: 1;">
    {% include image.html file="hyperdeck-confirm.png" alt="Hyperdeck" caption="Confirm the format by using the jog/shuttle wheel and pressing the set button" %}
  </div>

</div>

A progress bar will show you the formatting progress. When your HyperDeck has finished formatting, ‘formatting complete’ will display on the LCD. Press the ‘set’ button again to return to the menu.


### Recording Video

To record video:
1. Insert your formatted SD card into either of the SD card slots. The indicator above the slot will illuminate green as your HyperDeck reads the card. When the indicator turns off, HyperDeck Studio Mini is ready to record.
2. HyperDeck Studio Mini automatically detects when SDI video is connected and displays the image on the control panel LCD. If you want to change the codec, you can choose from a variety of codecs using the control panel LCD menu or the Blackmagic HyperDeck Setup utility software. We use **H.264 Low**, which records at 22 Mbps, or about **9.9 GB per hour** of recording.
3. Press the ‘record’ button and the indicator above the slot will illuminate red. As your HyperDeck is recording, the slot indicator on the control panel LCD will alternate between displaying the active slot, and record time remaining on the card.
4. Press the ‘stop’ button to finish recording.

{% include image.html file="hyperdeck-record.png" alt="Hyperdeck" caption="The indicator above the SD card slot illuminates red when recording video" %}


### Streaming

We use an [Epiphan Pearl Nano](https://www.epiphan.com/products/pearl-nano/) to stream to Carleton's IBM server at [https://go.carleton.edu/carletonlive](https://go.carleton.edu/carletonlive).

{% include image.html file="nano-front.jpeg" alt="Pearl Nano" caption="Pearl Nano front panel" %}

To start/stop streaming:

- Press the **Streaming control key (6)**. The button glows blue when the device is streaming. Flashing means that user action is required and streaming has either stopped or won't start. Color is white when the system is powered on and not streaming.

The Nano can also record to its internal SD/SSD. To start/stop recording:

- Press the **Recording control key (5)**. The button glows red when the device is recording. Flashing means that user action is required and recording has either stopped or won't start. Color is white when the system is powered on and not recording.


#### Configuring the Nano

The Nano has an HTML interface where you can configure its settings. Open a browser, and go to [http://kracum-stream.south.carleton.edu/](http://kracum-stream.south.carleton.edu/). You can configure various settings here once you log in. I note a few features here.

- You can preview the livestream/recording at [URL below](http://10.130.19.222/preview.cgi?channel=1). You'll need to log in.

{% include image.html file="nano-status.png" alt="Pearl Nano" caption="Pearl Nano Status" %}

- Layout is where you choose where the inputs are coming from. The video is coming from the SDI loop out of the Hyperdeck (`Output 2` of ATEM, always set to `Program`). The audio takes the dedicated livestream feed from the QL1 (**MTRX 1 and 2**); this comes out of the XLR omni ports from the QL to the Nano. If you don't want to use livestream audio (and want clean audio instead), this is where you'll need to select **SDI audio** and deselect **XLR/RCA audio**.

{% include image.html file="nano-layout.png" alt="Pearl Nano" caption="Pearl Nano Layout" %}

- You can change the [encoder settings](http://kracum-stream.south.carleton.edu/admin/channel1/codecsetup), enter the [RTMP server information](http://kracum-stream.south.carleton.edu/admin/channel1/streamsetup), and the [automatic file upload location](http://kracum-stream.south.carleton.edu/admin/afucfg) in the following locations.

<!-- <div style="display: flex; gap: 10px; justify-content: center; align-items: start;">

  <div style="flex: 1; width: 33%;">
    {% include image.html file="nano-encoding.png" alt="Pearl Nano" caption="Pearl Nano Encoder Seetings" %}
  </div>

  <div style="flex: 1; width: 33%;">
    {% include image.html file="nano-streaming.png" alt="Pearl Nano" caption="Pearl Nano Stream Settings" %}
  </div>

  <div style="flex: 1; width: 33%;">
    {% include image.html file="nano-nas.png" alt="Pearl Nano" caption="Pearl Nano NAS connection" %}
  </div>

</div> -->

<div style="display: flex; gap: 10px; justify-content: center; align-items: stretch; width: 100%;">

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/nano-encoding.png' | relative_url }}" alt="Pearl Nano Encoder Settings" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Pearl Nano Encoder Settings</p>
  </div>

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/nano-streaming.png' | relative_url }}" alt="Pearl Nano Stream Settings" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Pearl Nano Stream Settings</p>
  </div>

  <div style="flex: 1; text-align: center;">
    <img src="{{ '/images/nano-nas.png' | relative_url }}" alt="Pearl Nano NAS connection" style="max-width: 100%; height: auto; display: block;">
    <p style="font-size: 0.9em; margin-top: 8px;">Pearl Nano NAS connection</p>
  </div>

</div>

## Preshow checklist

By this point, you should be able to start a show. Typically, this is what a tech shift will look like. (Your exact responsibilities will depend on the shift you're assigned to.)

### Arrival

You're typically scheduled to arrive **1-2 hours before** the event. Performers typically arrive 15-30 minutes after you arrive.

1. Video: You should use the time before artists arrive to start building the QLab graphics. At the very least, you sould be able to complete the **Title** page. 
2. After completing the title page, you should run the cue with `space`. This brings it onto `Input 7` of the ATEM. 
3. **Set Output 1 (Crestron DA) to QLab**. (You can also achieve this via `Macro 2` in ATEM.)

### Rehearsals:

Rehearsals start **1-1.5 hours before** the event. Performers may run pieces according to the program, but they may not.

1. Video: LBOs should bring the stage to their actual lighting cues during the show. You can use this opportunity to adjust the camera exposure and save any presets if needed.
2. Use this rehearsal time to finish any lower-thirds and credits.
3. Adjust the audio levels during run-throughs.

### Preshow:

1. **30 minutes before** the event, you should finish all prep work, including any graphics, presets, and audio levels.
2. When done, bring the QLab input (`Input 7`) to `Program`, and set **Output 1 (Crestron DA) to `Program`**. (You can also achieve this via `Macro 1` in ATEM.)
3. We typically start and end transitions with a wide shot; you can use `House Center` for this. Once you've done that, wait until the house opens, and bring `Input 2` to `Preview`.
4. **15 minutes before** the event, format an SD card and start the stream, if applicable. You can greet the audience in the [livestream chat](https://go.carleton.edu/carletonlive), if you want. You should use one of the Carleton computers, so you're logged in as `Carleton College`.
5. **5 minutes before** the event, start the recording.

### During the show
- Have fun?

### Postshow:
1. The postshow sequence in QLab will automatically stop the Hyperdeck recording. The Pearl Nano recording needs to be stopped manually.
2. When the indicator light on the Hyperdeck stops being red, this means the deck has finished writing to the disk. Only take out the SD card until **AFTER** the disk has finished writing.
3. The Pearl Nano will automatically transfer its recording to our NAS.
4. Manually transfer the Hyperdeck recording to the Mac Studio in the recording booth (M102A). Give the file a legible name consistent with our naming convention, and store it under the `Pre-Edited Media` folder in the `KPH Team Drive`.
5. Shut down and leave.

