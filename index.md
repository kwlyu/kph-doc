---
title: "Technical Documentation for Kracum Performance Hall"
keywords: homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: index.html
summary: These brief instructions will help you get started quickly with concert production in Kracum and beyond. The other topics on the side help provide additional information and detail about working with other aspects of technical theater.
---

{% include note.html content="If you're reading this documentation, you're probably doing concert/theater of some kind. I have a <a alt='KL-youtube' href='https://www.youtube.com/@kun-wulyu8071'> YouTube Channel</a> hosting some example work. " %}

## Video

Follow these instructions to get started on the Video side of production.

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

To do this, go to `File` and select `Save As...`. Alternatively, press `command+shift+escape`.
{% include image.html file="qlab-save-as.png" alt="QLab5"%}

For good practice, keep the files organized in a folder with consistent naming conventions. An example of such a folder/directory is `Documents → QLab Archive → 2025-2026 → 3. S26 QLab`. An example of a workspace name is `04262026_Kingston-Recital`.

### Edit the template

Now we're onto actually filling in the details according to a show. We will use several examples throughout to illustrate the different scenarios you might encounter. 

If you need a refresher navigating the workspace, check [here](mydoc_qlab.html#Workspace). For our purposes, the parts that matter to us the most are the `playheads`, which controls what `cue` is being selected/pending/on standby (highlighted in blue). You can click on any cue, and that puts in into standby. To play a cue, hit `space` to play the cue on standby.

#### Title

First navigate to the **Text** column of the **Title** cue (cue name: `Title`; cue number: `A`). This is where you enter the appropriate information. Notice the {% include inline_image.html file="text-cue_size.png" alt="Text Cue"%} icon at the top of the playhead. This indicates that it is a *text* cue, which displays its content as a static png file onto the designated output. If the template is set up correctly, you should see the static image on `input 7` of the ATEM Multiview. Check [here](/mydoc_troubleshooting.html) if you're seeing otherwise.

{% include image.html file="title-text.png" alt="QLab5" caption="Edit Title Cue" max-width="23px"%}

Take a look at this following program.

<embed src="{{ site.baseurl }}/pdf/11.2.25_Joint Concert Program_FINAL 3.pdf" type="application/pdf" width="100%" height="1080px" />

Usually, there's just enough information to fill out the titles and subtitles (optional). In this case, we have too much information, so we have to make a decision. Typically, the title is the name of the concert, i.e., `Orchestra Concert`, `Jazz Area Concert`, etc.; the subtitle consists of the directors, soloists, etc. Here, we not only have the event name---`Fall 2025 Concert Collaboration`---but also the different ensembles and their respective directors. In this case, we omit the directors. The result would look something like this:

{% include image.html file="title-edit.png" alt="Title Slide" caption="Edited Title"%}

You can select the text and change its color however you desire using the `text color panel`. When we livestream an event, leave the Carleton Livestream URL [go.carleton.edu/carletonlive](go.carleton.edu/carletonlive) in. Otherwise, delete the link.

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

To play this lower-third, you want to go to the top of the group cue, i.e., `Cue 1`, and hit `space`. From there, you don't need to do anything. The automation scripts will bring up the `Downstream Keys` in ATEM and the text cue you just created and take them out after a specified amount of time, i.e., 5 seconds.


##### 2. When there is a group performing.

We always introduce the group before they perform their first piece. When the group is large enough that we can't fit them into a single lower-third, we use the second template.




#### Post-show Credits


