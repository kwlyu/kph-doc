---
title: "Technical Documentation for Kracum Performance Hall"
keywords: homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: index.html
summary: These brief instructions will help you get started quickly with concert production in Kracum and beyond. The other topics on the side help provide additional information and detail about working with other aspects of technical theater.
---

{% include note.html content="If you're reading this documentation, you're probably doing concert/theater of some kind. I have a <a alt='KL-youtube' href='https://www.youtube.com/@kun-wulyu8071'> YouTube Channel</a> hosting some example work. " %}

## QLab Video Graphics

Follow these instructions to get started on the graphics side of production. We use [QLab](https://qlab.app/) for lower-thirds and credits, as well as video and audio playback.

### Open the template

If you haven't already, make sure you launch **QLab 5** {% include inline_image.html file="qlab-5-icon_size.png" alt="QLab5 button" %} as opposed to **QLab 4** {% include inline_image.html file="qlab-4-icon_size.png" alt="QLab4 button" %} in the dock. When you do, you will be greeted with an interface that asks you to select the template. You want to select ''**KL Template QLab5+ATEM+EOS**'':

{% include image.html file="QLab-Open-Screen.png" alt="QLab5" caption="This is a sample QLab Homescreen." %}

{% include note.html content=" Your home screen will look different from this depending on what has been opened in the past. QLab ranks the list of show files by how recently it was open (higher is more recent). If you can't find the template, you have a few options:

<br>1. Check the **desktop** of your computer.
<br>2. Select **New Workspace from template \"KL Template...\"**.
<br>3. Download from <a alt='KL-Showfile' href='https://github.com/kwlyu/kph-documentation/raw/refs/heads/main/showfiles/KL%20Template%20QLab5+ATEM+EOS.qlab5'>here</a>.<br>

Understand that option 2 and 3 might present you with obsolete show files." %}

Check [here](/mydoc_troubleshooting.html) for common troubleshooting techniques if you have trouble getting started.

### Save the template as a new file

Once you're in, you will see the following workspace:
{% include image.html file="qlab-workspace.png" alt="QLab5" caption="This is a sample QLab Workspace." %}

Check [here](/mydoc_troubleshooting.html) if you see <a href="#" data-toggle="tooltip" data-original-title="{{site.data.glossary.broken_cue}}">red X</a> warnings. (Your app title bar won't be purple. I remoted into the system when I wrote this, which is why it's showing purple.)

{% include important.html content="The first thing you want to do when you open a template is to **save it as a new file**, so you don't overwrite the template. " %}

To do this, go to `File` and select `Save As...`. Alternatively, press `command+shift+s`.
{% include image.html file="qlab-save-as.png" alt="QLab5"%}

For good practice, keep the files organized in a folder with consistent naming conventions. An example of such a folder/directory is `Documents → QLab Archive → 2025-2026 → 3. S26 QLab`. An example of a workspace name is `04262026_Kingston-Recital`.

### Edit the template

Now we're onto actually filling in the details according to a show. We will use several examples throughout to illustrate the different scenarios you might encounter. 

If you need a refresher navigating the workspace, check [here](mydoc_qlab.html#Workspace). For our purposes, the parts that matter to us the most are the `playheads`, which controls what `cue` is being selected/pending/on standby (highlighted in blue). 
* You can click to select any cue, and that puts in into standby. 
* To play a cue, hit `space` to play the cue on standby. 
* To stop cues, hit `escape` to ''**panic all**'' cues; this fades everything down in 1 second, making the stop seem intentional when it's not.

#### Title

First navigate to the **Text** column of the **Title** cue (cue name: `Title`; cue number: `A`). This is where you enter the appropriate information. Notice the {% include inline_image.html file="text-cue_size.png" alt="Text Cue"%} icon at the top of the playhead. This indicates that it is a *text* cue, which displays its content as a static png file onto the designated output. 

{% include image.html file="title-text.png" alt="QLab5" caption="Edit Title Cue" max-width="23px"%}

If the template is set up correctly, you should see the static image on `input 7` of the ATEM Multiview. Check [here](/mydoc_troubleshooting.html) if you're seeing otherwise. (You multiview will not look like this. I'm using the multiview here to show you both the QLab progress bars and the program output.)

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/title.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

Take a look at this following program.

<embed src="{{ site.baseurl }}/pdf/11.2.25_Joint Concert Program_FINAL 3.pdf" type="application/pdf" width="100%" height="1080px" />

Usually, there's just enough information to fill out the titles and subtitles (optional). In this case, we have too much information, so we have to make a decision. Typically, the title is the name of the concert, i.e., `Orchestra Concert`, `Jazz Area Concert`, etc.; the subtitle consists of the directors, soloists, etc. Here, we not only have the event name---`Fall 2025 Concert Collaboration`---but also the different ensembles and their respective directors. In this case, we omit the directors. The result would look something like this:

{% include image.html file="title-edit.png" alt="Title Slide" caption="Edited Title"%}

You can select the text and change its color however you desire using the `text color panel`. When we livestream an event, leave the Carleton Livestream URL [go.carleton.edu/carletonlive](go.carleton.edu/carletonlive) in. Otherwise, delete the link. Contact [Alexi Carlson](mailto:acarlson4@carleton.edu) if you don't know whether the event is being streamed or not.

{% include tip.html content=" If the texts exceeds the boundaries of the output screen, rather than adjusting the font sizes individually, you can adjust the **`Scale`** of the entire cue in the **`Geometry`** tab. You can also adjust the **`Translation`** and **`Rotation`** of cues, if the properties apply. All these parameters are ''draggable'', so you don't have to enter the values manually." %}

{% include image.html file="title-geometry.png" alt="Title Geometry" caption="Edit Cue Geometry"%}


#### Lower-Thirds

We want to give credits to all the performers that make events possible. We use lower thirds to indicate the *performers*, the *piece* they're performing, the *composer* of the piece, and any *group name* if applicable. There are a few different types of lower thirds, and we use them according to which scenario we encounter:

##### 1. When there's only one artist performing the concert, or when the artist or group has been introduced at a previous lower-third.

Typically, when there's only one artist performing, their name is introduced in the title or the subtitle. We avoid redundancy here by only introducing the piece they perform and the composer of that piece. (Similarly for when a group has been introduced.) Take a look at the following program.

<embed src="{{ site.baseurl }}/pdf/2.8.26_Park Program_FINAL.pdf" type="application/pdf" width="100%" height="1080px" />

The only two performers `Susie Park` and `Timothy Lovelace` are both introduced in the titles, so we use cue 1 as a template here. To edit a lower third, as it is the case with all other cues in this template, the only type of cues you need to edit is a **Text** cue. Go to the `Text` tab of the text cue, and enter the piece information.

{% include image.html file="basic-title-1.png" alt="Basic Title" caption="Title with Piece Information." %}

You will note that I also omitted the movements. This is because the sonata only contains three movements. The real-estate of a lower-third limits how much information we can put out. We only include movements when not all movements are being played. For instance, if an artist is play only the second movement, we would write `Sonata ...., Movt. II`. When there are multiple movements, we use dash to connect them: `..., Movt. I-III`.

{% include image.html file="rename-q.png" alt="Rename Cue" caption="Cues without names will display text content." %}

{% include note.html content="You can **rename** a cue by either double-clicking the `Name` tab or use the keyboard shortcut **`Q`**. The keyboard shortcut for **renumbering** is **`N`**. Cues whose cue name is empty will display its text content or filename. "%}

To play this lower-third, you want to go to the top of the group cue, i.e., `Cue 1`, and hit `space`. From there, you don't need to do anything. The automation scripts will bring up the `Downstream Keys` in ATEM and the text cue you just created and take them out after a specified amount of time, i.e., 5 seconds.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/basic-lower-thirds.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

{% include important.html content="As always, check the **`Geometry`** or play the cue before show starts to make sure there's no overflow. " %}

##### 2. When there is a named group or a large group performing.

We always introduce the group before they perform their first piece. When the group is large enough that we can't fit them into a single lower-third, or when the group has a group name, we use the second template. When a group is performing multiple pieces, use `Cue 2` to introduce the group and the first piece. For brevity, use `Cue 1` for the remaining pieces until a different group performs or when there's a soloist to highlight. Let's see this in action. Take a look at this program again. We want to do the lower-thirds for the first piece performed by `Carleton Voices`, i.e., `Hey Harmonika`.

<embed src="{{ site.baseurl }}/pdf/11.2.25_Joint Concert Program_FINAL 3.pdf" type="application/pdf" width="100%" height="1080px" />

* Group Titles

Since we didn't highlight the directors in the subtitles, we put the directors here. So the first text cue under `Cue 2` will be the following. We use `|` as the delimiter between two performers; you don't need a delimiter at the end of a line. This first text cue will always contain the group title (and the director, if applicable).

{% include image.html file="group-title.png" alt="Group Title" caption="Group Title with Directors" %}

* Group Members

The second text cue is where we fill in the group members or the soloists. For a large ensemble like choir, it is usually infeasible to list all members. In this case, we only highlight the soloists. 

{% include image.html file="group-members.png" alt="Group Members" caption="Group Members" %}

- There are a few scenarios where you don't need this second group of cues.
    - If there are no soloists, you can delete the second group cue. 
    - If there are too many people in the ensemble to list completely, my advice is to not list anyone at all; in this case, you can also delete the second group cue.
    - If there are very few soloists (1-4 artists) that you think you can fit under the first text cue, go ahead and do that and delete the second group cue.

{% include image.html file="no-group-members.png" alt="No Group Members" caption="Delete Group Members Cue" %}

- If you're feeling adventurous, you **can** list all members in an ensemble. Here's how you do it.
    - Select all cues in the second group like above, and copy with `command+c`.
    - Go to the top of this group and paste with `command+v`. The reason you want to paste at the top of the cue is because otherwise the pasted group will be *nested* inside the original group. 

{% include image.html file="group-members-duplicate.png" alt="Duplicate Group Members" caption="Duplicate Group Members Cue" %}

* The first piece

The last group of this cue simply presents the first piece that the group performs. Note that the text cue is identical to that under `Cue 1`. Follow the instructions above to fill in the details.

{% include image.html file="group-piece.png" alt="Group Piece" caption="Group First Piece" %}

To play, you go to the top of `Cue 2` and hit `space` for go. You would use `Cue 1` to present the remaining pieces of this group that don't need to highlight new soloists. Just to illustrate, in that same program above, `Carleton Choir` performs three pieces. The first piece has a group of soloists, the second piece has no soloists (or the same group of soloists), and the third has a different group of soloists. You should use `Cue 2` for the first piece, `Cue 1` for the second piece, and `Cue 3` for the third piece, which we will introduce next.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/group-lower-thirds.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

##### 3. When there is a small group performing.

As we said, when there's only a small group performing, we use `Cue 3` as a template. This is common for chamber and studio recitals, where typically there's only 1-3 students performing one or two pieces. Take a look at this following program.

<embed src="{{ site.baseurl }}/pdf/3.4.26_Piano Studio Recital Program_FINAL.pdf" type="application/pdf" width="100%" height="1080px" />

`Joshua Lee` is performing one piece. In particular, through Googling, only the first movement. We abbreviate it like the following. 

{% include image.html file="solo-piece.png" alt="Solo Piece" caption="Solo Piece" %}

{% include note.html content="You will note that the composer of this piece contains special characters. To input accents on Mac, hold **`option`** can type the letter associated with that accent, listed in the following image. For more information, check [this Apple help article](https://support.apple.com/guide/pages/accents-emoji-and-special-characters-tanec2c2fdfd/mac). "%}

{% include image.html file="accents.png" alt="Accents" caption="Accents on Mac" %}

Play the lower thirds by putting `Cue 3` into standby and hit `space` for go.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/solo-lower-thirds.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

##### 4. Chinese Music Ensemble.

You might encounter non-Western music here at Carleton, and they often contain foreign language characters. If you know how to input them, go ahead. The Kracum QLab Mac has Simplified Chinese (Pinyin) installed; you can switch input by pressing `fn`. Otherwise, my advice is to get the program PDF, **copy** the characters, and **paste** into the template. Contact [Alexi Carlson](mailto:acarlson4@carleton.edu) if you have trouble accessing the program.

{% include image.html file="chinese-piece.png" alt="Chinese" caption="Chinese Music Ensemble" %}

{% include note.html content="You can **`Paste and Match Style`**, under the edit menu. The default keyboard shortcut is **`command+option+shift+v`**. You can define whatever keyboard shortcut you'd like; the Kracum Mac has it set to **`command+shift+v`** to match the common shortcuts. To learn how to do that, check [this Apple help article](https://support.apple.com/guide/mac-help/create-keyboard-shortcuts-for-apps-mchlp2271/mac). "%}

Play the lower thirds by putting `Cue 5` into standby and hit `space` for go.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/chinese-lower-thirds.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

#### Post-show Credits

Now that we've given credits to the performers, we want to give credits to ourselves 🥳. Not every event will have a program, but every event will have a `Event Info Sheet`, like the following.

<embed src="{{ site.baseurl }}/pdf/3_4 Piano Studio.pdf" type="application/pdf" width="100%" height="1080px" />

Here, you will find information about the schedule, the staff assigned, recording/streaming needs, and strike notes if applicable. (You find out whether the show is being streamed here.) We want to fill out the personnel's working any particular show (though there are separate text cues acknowledging all students on the roster and all staff members that have helped with the production.) You will note that this last group cue contains an unusually large amount of cues. This is because a large portion of the switching/fading has been automated to reduce repetitive workloads and to ensure consistency. The only cues you will need to edit are `Text Cues`, which are coded in `red`. 

{% include image.html file="post-credit.png" alt="Credits" caption="Post Show Credits" %}

`Credits 2` contains all the tech people. If there are no projectionists, simply delete the entry. 

| Abbreviation | Position |
| :--- | :--- |
| Proj | Projection |
| A1, A2, A3, etc. | Audio |
| LBO | Light Board Operator |
| Video | Video |
| SM | Stage Manager |
| HM | House Manager | 
| Stage | Stage Hand |
| U | Usher |
| Door | Door Access (Obsolete) |

{% include image.html file="post-credit-2.png" alt="Credits" caption="Tech Credits" %}

`Credits 3` contains the rest of the crew, including stage managers and house managers. If there's not a position, i.e., Door Access, put them under `Usher`.

{% include image.html file="post-credit-3.png" alt="Credits" caption="House Credits" %}

To play the post show credits, simply go to the top of this group (named `Post - RUN THIS CUE ONLY`), and hit `space` for go. The scripts will take care of everything.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/post-credit.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>

## Video Switching

### ATEM Software Control

#### Switching Basics

We use [ATEM Software Control](https://www.blackmagicdesign.com/products/atemmini/software) to control the Blackmagic switchers in our spaces. We'll use the main switcher, [ATEM 1 M/E Constellation HD](https://www.blackmagicdesign.com/products/atemconstellation/techspecs/W-APS-25), as our example.

When you sit down at the broadcast booth, you will likely see the multiview on the monitor, and the ATEM software on the ATEM laptop.

<div style="display: flex; gap: 15px; align-items: flex-start;">
  {% include image.html file="multiview.png" alt="Multiview" caption="ATEM Multiview" max-width="400" %}
  {% include image.html file="atem-software.png" alt="ATEM Software" caption="ATEM Software" max-width="400" %}
</div>

On the multiview, you will see a selection of `Inputs`, along with `Preview` and `Program`. Think of program as the end result, i.e., what shows up on the recording/livestream, and preview as the ''scene'' before program. We are using 8 out of 10 inputs on the switcher. They're:

| Input 1 | Input 2 | Input 3 | Input 4 | Input 5 | Input 6 | Input 7 | Input 8 | 
| :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | :-------- | :-------- |
| House Left | House Center | House Right | Stage Right | Stage Left | Projector | QLab | Applebaum |

Input 1-5 corresponds to the 5 PTZ cameras in Kracum, and Input 8 corresponds to the PTZ camera in Applebaum. Input 7 mirrors the Kracum projector output, if applicable, and Input 7 is the graphics output from QLab. 

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

#### Switcher Parameters

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

{% include important.html content="Make sure you have the **`Downstream Key`** set to the following parameters. <br>

        * You may adjust the **`Clip`** and the **`Gain`** to your liking, but these just affect the transparency of the lower thirds. <br>

        * The **`Rate`** for **`DSK 1`** controls the amount of time it takes to fade in/out the key; I recommend leaving this at 1 second. <br>

        * The **`Rate`** under **`Transition style`** controls the fade time for **`Dissolve`**.
" %}

{% include image.html file="atem-dissolve.png" alt="ATEM Parameters" caption="Downstream Key Parameters." %}

If you somehow messed up the parameters, check the `Document` folder for backup. Otherwise, download a copy [here](https://github.com/kwlyu/kph-documentation/raw/refs/heads/main/showfiles/KL%20ATEM+QLAB5%202026-05-07%2016-21-24.xml).

#### Recording and Streaming

This part only applies to the ATEM Mini in Applebaum. You can ISO recording all inputs and outputs to an external drive through the USB-C port at the back of the ATEM. The `Record` button will show up on the right under output once the drive is plugged in. You may also stream to Carleton's IBM RTMP server. Refer to the `Stream Keys` document for details about the server and the key. We don't recommend streaming via any Blackmagic devices, because of [this](https://forum.blackmagicdesign.com/viewtopic.php?f=4&t=117185) issue here. Instead, see [this section](/index.html#recording-and-streaming-1) on how to set up recording and streaming.

{% include image.html file="atem-mini.png" alt="ATEM Mini" caption="ATEM Mini Record and Stream." %}

### Sony PTZ Control

We use Sony's [RM-IP500](https://www.sony.com/electronics/support/ptz-and-remote-cameras-ptz-cameras/rm-ip500) to control the 6 [Sony PTZ Cameras](https://pro.sony/ue_US/products/ptz-network-cameras/srg-300se) we have in our space. 

{% include image.html file="ptz-ctrl-top.png" alt="Sony PTZ" caption="Sony PTZ Control" %}

{% include important.html content="Note that the camera selection in PTZ control is **separate** from the input selection in ATEM. To control a camera that's been put on `Preview`, you have to **first select the correct `Input` on the ATEM computer AND select the correct `Camera` on the PTZ control**. PTZ control and ATEM are separated. " %}

#### Selecting a camera

You can select the camera you want to control using the `Camera Selection Block`. Camera 1-5 corresponds to Input 1-5 on the ATEM, and Camera 6 is the Applebaum camera (Input 8). If the network is set up correctly, the `buttons` for camera 1-6 should light in <span class="cb">blue</span>. Press the number of the CAMERA button to select. The selected button will light in <span class="cy">yellow</span>.

#### Operating a camera

##### Pan and tilt control

1. Select the target camera to control.
2. Make sure the ACTIVE button is lit on the joystick control block.
3. Adjust the PAN-TILT SPEED. Turning the PAN-TILT SPEED knob clockwise increases the speed, and turning counterclockwise decreases the speed.
4. Incline to the right/left to pan camera to the right/left. Push the joystick down to move the camera down, and pull the joystick up to move the camera up.

{% include image.html file="pan-tilt.png" alt="Sony PTZ" caption="Pan-Tilt Control" %}

##### Zoom control

1. Select the target camera to control.
2. Make sure the ACTIVE button is lit on the lens control block.
3. Move the ZOOM lever left/right to make the subject appear smaller/larger.
4. Adjust the ZOOM SPEED as needed. Turning the ZOOM SPEED knob clockwise increases the zoom speed, and turning counterclockwise decreases the zoom speed.

{% include image.html file="zoom.png" alt="Sony PTZ" caption="Zoom Control" %}

##### Adjusting the focus

1. Select the target camera to control.
2. Make sure the ACTIVE button is lit on the lens control block.
3. Leave the mode on AUTO FOCUS, making sure the button is lit yellow.

{% include image.html file="focus.png" alt="Sony PTZ" caption="Focus Control" %}

##### Adjusting the brightness

We don't recommend the auto-exposure (AE) function. It simply looks bad.

1. Make sure the AE button is off (button is not lit).
2. Turn the IRIS knob counterclockwise until the iris is all the way up (F=1.6, lower is better).
3. Press the GAIN button in the menu control block to highlight the corresponding value on the camera image and turn the VALUE knob to adjust the value.

{% include image.html file="brightness.png" alt="Sony PTZ" caption="Brightness Control" %}

By opening up the iris to its max setting, we're letting as much light into the camera as possible. This reduces the level of noise in our video.

#### Storing the Camera Presets

All camera parameters we just mentioned can be stored as presets to recall during the show. 

1. Make sure the ACTIVE button is on (button is lit) on the joystick control block and preset memory control block.
2. Select the camera whose status you want to store.
3. Operate the joystick to pan/tilt the orientation of the camera.
4. Perform zoom, focus, backlight compensation, flicker compensation, and white/black balance adjustments, as required.
5. Check that the DIRECT RECALL button is off.
6. Enter the preset number you want to store. Use the PRESET 10/0 button to enter a “0” digit. You can store up to 100 presets per camera.
7. Press and hold the STORE button. The preset number at the bottom right of the LCD panel is displayed highlighted, and storing is completed when the display disappears.

{% include image.html file="store-preset.png" alt="Sony PTZ" caption="Storing Presets" %}

##### Recalling presets

There are two methods for recalling stored status: direct recall and number recall.

* Direct recall

1. Make sure the DIRECT RECALL button is on (button is lit yellow).
2. Press the PRESET 1 to PRESET 10/0 buttons to recall preset numbers 1 to 10. **Only preset numbers 1 to 10 can be recalled using direct recall**. 

We recommend this because it saves you a lot of time during the show. For this reason, we suggest you limit and store your presets to 1-10.

* Number recall

1. Make sure the DIRECT RECALL button is off (button is NOT lit yellow).
2. Enter the preset number using the PRESET 1 to PRESET 10/0 buttons, in the same way as when storing a preset.
3. Press the RECALL button. Preset numbers 1 to 100 can be recalled using number recall.


## Broadcast Audio

We use the 

## Recording and Streaming


## Broadcast Video