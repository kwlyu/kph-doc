---
title: Troubleshooting
tags: [troubleshooting]
keywords: trouble, problems, support, error messages, problems, failure, error, #fail
last_updated: July 3, 2016
summary: "This page lists common errors and the steps needed to troubleshoot them."
sidebar: mydoc_sidebar
permalink: mydoc_troubleshooting.html
folder: mydoc
---

## QLab isn't working

### I can't see QLab / QLab is displaying this weird calendar thing

You might be presented with a calendar display when you approach the QLab computer. This is another small script I wrote [here](https://github.com/kwlyu/calendar-web). It pulls and displays the [Carleton Arts Calendar](https://www.carleton.edu/arts/events/arts-calendar/) and updates that at midnight. The program displays an HTML file in Firefox. What you're seeing is likely Firefox being full screened.

To get out of Firefox, simply press `command+q` (shortcut to quit apps on MacOS in general) to quit. Firefox will ask you to confirm. Hit `return` to confirm. You will then be presented with the QLab interface (hopefully). Hit `escape` to panic all cues to make sure the midnight update cue is not running anymore. You may now [resume](/index.html#QLab Video Graphics) to production.

<video autoplay loop muted playsinline width="100%">
  <source src="{{ '/videos/quit-calendar.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support the video tag.
</video>