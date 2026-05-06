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

### 1. Open the template

If you haven't already, make sure you launch **QLab 5** {% include inline_image.html file="qlab-5-icon_size.png" alt="QLab5 button" %} as opposed to **QLab 4** {% include inline_image.html file="qlab-4-icon_size.png" alt="QLab4 button" %} in the dock. When you do, you will be greeted with an interface that asks you to select the template. You want to select ''**KL Template QLab5+ATEM+EOS**'':

{% include image.html file="QLab-Open-Screen.png" alt="QLab5" caption="This is a sample QLab Homescreen." %}

{% include note.html content=" Your home screen will look different from this depending on what has been opened in the past. QLab ranks the list of show files by how recently it was open (higher is more recent). If you can't find the template, you have a few options:

<br>1. Check the **desktop** of your computer.
<br>2. Select **New Workspace from template \"KL Template...\"**.
<br>3. Download from <a alt='KL-Showfile' href='https://github.com/kwlyu/kph-documentation/raw/refs/heads/main/showfiles/KL%20Template%20QLab5+ATEM+EOS.qlab5'>here</a>.<br>

Understand that option 2 and 3 might present you with obsolete show files." %}

Check [here](/mydoc_troubleshooting.html) for common troubleshooting techniques if you have trouble getting started.

### 2. Save the template as a new file

Once you're in, you will see the following workspace:
{% include image.html file="qlab-workspace.png" alt="QLab5" caption="This is a sample QLab Workspace." %}

Check [here](/mydoc_troubleshooting.html) if you see <a href="#" data-toggle="tooltip" data-original-title="{{site.data.glossary.broken_cue}}">red X</a> warnings. (Your app title bar won't be purple. I remoted into the system when I wrote this, which is why it's showing purple.)

{% include important.html content="The first thing you want to do when you open a template is to **save it as a new file**, so you don't overwrite the template. " %}

To do this, go to `File` and select `Save As...`. Alternatively, press `command+shift+escape`.
{% include image.html file="qlab-save-as.png" alt="QLab5"%}

For good practice, keep the files organized in a folder with consistent naming conventions. An example of such a folder/directory is `Documents → QLab Archive → 2025-2026 → 3. S26 QLab`. An example of a workspace name is `04262026_Kingston-Recital`.

### 3. Edit the template

Now we're onto actually filling in the details according to a show. We will use several examples throughout to illustrate the different scenarios you might encounter.

Before we begin, we highlight some things below in the workspace to pay attention to. If you're already familiar with the workspace, skip ahead to the [next](index.html#title) section.

{% include image.html file="workspace-diagram.png" alt="QLab5" caption="Some workspace elements. Image credit: [https://qlab.app/docs/v5/fundamentals/workspace/](https://qlab.app/docs/v5/fundamentals/workspace/)."%}


| **<span class="cr">General</span>** | **<span class="cb">Cue types</span>** | **<span class="cg">Cue list elements</span>** | **<span class="cy">Inspector elements</span>** |
| :--- | :--- | :--- | :--- |
| 1: [The GO Button](https://qlab.app/docs/v5/fundamentals/workspace/#the-go-button) | 4: [Group cue](https://qlab.app/docs/v5/fundamentals/group-cues) | 30: [Playhead](https://qlab.app/docs/v5/fundamentals/workspace/#the-playhead) | 41: [Selected cue number](https://qlab.app/docs/v5/fundamentals/inspector/#number) |
| 2: [The Standby display](https://qlab.app/docs/v5/fundamentals/workspace/#the-standby-display) | 5: [Audio cue](https://qlab.app/docs/v5/audio/audio-cues) | 31: [Cue type icon](https://qlab.app/docs/v5/fundamentals/workspace/#cue-type) | 42: [Selected cue duration](https://qlab.app/docs/v5/fundamentals/inspector/#duration) |
| 3: [The Notes field](https://qlab.app/docs/v5/fundamentals/workspace/#the-notes-field) | 7: [Video cue](https://qlab.app/docs/v5/video/video-cues) | 32: [Cue number](https://qlab.app/docs/v5/fundamentals/workspace/#cue-number) | 43: [Selected cue pre-wait](https://qlab.app/docs/v5/fundamentals/inspector/#pre-wait) |
| 29: [Cue](https://qlab.app/docs/v5/fundamentals/workspace/#the-cue-list) | 9: [Text cue](https://qlab.app/docs/v5/video/text-cues) | 33: [Cue name](https://qlab.app/docs/v5/fundamentals/workspace/#cue-name) | 44: [Selected cue post-wait](https://qlab.app/docs/v5/fundamentals/inspector/#post-wait) |
| 40: [Inspector tabs](https://qlab.app/docs/v5/fundamentals/inspector) | 11: [Fade cue](https://qlab.app/docs/v5/audio/fading-audio) | 34: [Target](https://qlab.app/docs/v5/fundamentals/workspace/#target) | 45: [Selected cue continue mode](https://qlab.app/docs/v5/fundamentals/inspector/#continue) |
| 66: [Workspace settings](https://qlab.app/docs/v5/fundamentals/workspace-settings) | 12: [Network cue](https://qlab.app/docs/v5/networking/network-cues) | 35: [Pre-wait](https://qlab.app/docs/v5/fundamentals/workspace/#pre-wait) | 46: [Selected cue name](https://qlab.app/docs/v5/fundamentals/inspector/#name) |
| | 28: [Script cue](https://qlab.app/docs/v5/scripting/script-cues) | 36: [Duration](https://qlab.app/docs/v5/fundamentals/workspace/#duration) | 47: [Selected cue target](https://qlab.app/docs/v5/fundamentals/inspector/#target) |
| | | 37: [Post-wait](https://qlab.app/docs/v5/fundamentals/workspace/#post-wait) | 48: [Selected cue notes](https://qlab.app/docs/v5/fundamentals/inspector/#notes) |
| | | 38: [Continue mode](https://qlab.app/docs/v5/fundamentals/workspace/#continue-mode) | 50: [Selected cue color](https://qlab.app/docs/v5/fundamentals/inspector/#color) |
| | | 39: [Status icon](https://qlab.app/docs/v5/fundamentals/workspace/#status) | 51: [Selected cue second color](https://qlab.app/docs/v5/fundamentals/inspector/#second-color) |
| | | | 54: [Reveal target](https://qlab.app/docs/v5/fundamentals/inspector/#target) |
| | | | 57: [Selected cue armed](https://qlab.app/docs/v5/fundamentals/inspector/#armed) |

For our purposes, the parts that matter to us the most are the `playheads`, which controls what `cue` is being selected/pending/on standby. You can click on any cue, and that puts in into standby. To play a cue, hit `space` to play the cue on standby.

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

We want to give credits to all the performers that make events possible. We use lower thirds to indicate the *performers*, the *piece* they're performing, the *composer* of the piece, and any *group name* if applicable.

To edit a lower third, as it is the case with all other cues in this template, the only type of cues you need to edit is a **Text** cue.





#### Post-show Credits

<!-- First, download or clone the theme from the [Github repo](https://github.com/tomjoht/documentation-theme-jekyll). Most likely you won't be pulling in updates once you start customizing the theme, so downloading the theme (instead of cloning it) probably makes the most sense. In Github, click the **Clone or download** button, and then click **Download ZIP**.

### 2. Install Jekyll

If you've never installed or run a Jekyll site locally on your computer, follow these instructions to install Jekyll:

* [Install Jekyll on Mac][mydoc_install_jekyll_on_mac]
* [Install Jekyll on Windows][mydoc_install_jekyll_on_windows]

### 3. Install Bundler

In case you haven't installed Bundler, install it:

```
gem install bundler
```

You'll want [Bundler](http://bundler.io/) to make sure all the Ruby gems needed work well with your project. Bundler sorts out dependencies and installs missing gems or matches up gems with the right versions based on gem dependencies.

### 4. Option 1: Build the Theme (*without* the github-pages gem) {#option1}

Use this option if you're not planning to publish your Jekyll site using [Github Pages](https://pages.github.com/).

Bundler's Gemfile specifies how project dependencies are managed. Although this project includes a Gemfile, this theme doesn't have any dependencies beyond core Jekyll. The Gemfile is used to list gems needed for publishing on Github Pages. **If you're not planning to have Github Pages build your Jekyll project, delete these two files from the theme's root directory:**

* Gemfile
* Gemfile.lock

If you've never run Jekyll on your computer (you can check with `jekyll --version`), you may need to install the jekyll gem:

```
gem install jekyll
```

Now run jekyll serve (first change directories (`cd`) to where you downloaded the project):

```
jekyll serve
```

### 4. Option 2: Build the Theme (*with* the github-pages gem) {#option2}

If you *are* in fact publishing on Github Pages, leave the Gemfile and Gemfile.lock files in the theme.The Gemfile tells Jekyll to use the github-pages gem. **However, note that you cannot use the normal `jekyll serve` command with this gem due to dependency conflicts between the latest version of Jekyll and Github Pages** (which are noted [briefly here](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/)).

You need Bundler to resolve these dependency conflicts. Use Bundler to install all the needed Ruby gems:

```
bundle update
```

Then *always* use this command to build Jekyll:

```
bundle exec jekyll serve
```

If you want to shorten this long command, you can put this code in a file such as jekyll.sh (on a Mac) and then simply type `. jekyll.sh` to build Jekyll.

## Running the site in Docker

You can also use Docker to directly build and run the site on your local machine. Just clone the repo and run the following from your working dir:
```
docker-compose build --no-cache && docker-compose up
```
The site should now be running at [http://localhost:4000/](http://localhost:4000/).

This is perhaps the easiest way to see how your site would actually look.

## Configure the sidebar

There are several products in this theme. Each product uses a different sidebar. This is the essence of what makes this theme unique -- different sidebars for different product documentation. The idea is that when users are reading documentation for a specific product, the sidebar navigation should be specific to that product. (You can read more of my thoughts on why multiple sidebars are important in this [blog post](http://idratherbewriting.com/2016/03/23/release-of-documentation-theme-for-jekyll-50/).)

The top navigation usually remains the same, because it allows users to navigate across products. But the sidebar navigation adapts to the product.

In each page's frontmatter, you must specify the sidebar you want that page to use. Here's an example of the page frontmatter showing the sidebar property:

<pre>
---
title: Alerts
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: July 3, 2016
summary: "You can insert notes, tips, warnings, and important alerts in your content. These notes are stored as shortcodes made available through the linksrefs.hmtl include."
<span class="red">sidebar: mydoc_sidebar</span>
permalink: mydoc_alerts
---
</pre>

The `sidebar: mydoc_sidebar` refers to the \_data/sidebars/mydoc_sidebar.yml file.

Note that your sidebar can only have 2 levels (expand the **Tag archives** option to see an example of the second level). Given that each product has its own sidebar, this depth should be sufficient (it's really like 3 levels). Deeper nesting goes against usability recommendations.

You can optionally turn off the sidebar on any page (e.g. landing pages). To turn off the sidebar for a page, you should set the page frontmatter tag as `hide_sidebar: true`.

If you don't declare a sidebar, the `home_sidebar` file gets used as the default because this is the default specified in the config file:

```yaml
-
  scope:
    path: ""
    type: "pages"
  values:
    layout: "page"
    comments: true
    search: true
    sidebar: home_sidebar
    topnav: topnav
```

If you want to set different sidebar defaults based on different folders for your pages, specify your defaults like this:

```
-
  scope:
    path: "pages/mydoc"
    type: "pages"
  values:
    layout: "page"
    comments: true
    search: true
    sidebar: mydoc_sidebar
    topnav: topnav
```

This would load the `mydoc_sidebar` for each file in **pages/mydoc**. You could set different defaults for different path scopes.

For more detail on the sidebar, see [Sidebar navigation][mydoc_sidebar_navigation].

## Top navigation

The top navigation works just like the sidebar. You can specify which topnav data file should load by adding a `topnav` property in your page, like this:

```yaml
topnav: topnav
```

Here the topnav refers to the `_data/topnav.yml` file.

Because most topnav options will be the same, the `_config.yml` file specifies the topnav file as a default:

```yaml
-
  scope:
    path: ""
    type: "pages"
  values:
    layout: "page"
    comments: true
    search: true
    sidebar: home_sidebar
    topnav: topnav
```

## Sidebar syntax

The sidebar data file uses a specific YAML syntax that you must follow. Follow the sample pattern shown in the theme, specically looking at `mydoc_sidebar.yml` as an example: Here's a code sample showing all levels:

```yaml
entries:
- title: sidebar
  product: Jekyll Doc Theme
  version: 6.0
  folders:
  - title: Overview
    output: web, pdf
    folderitems:

    - title: Get started
      url: /index.html
      output: web, pdf
      type: homepage

    - title: Introduction
      url: /mydoc_introduction.html
      output: web, pdf

  - title: Release Notes
    output: web, pdf
    folderitems:

    - title: 6.0 Release notes
      url: /mydoc_release_notes_60.html
      output: web, pdf

    - title: 5.0 Release notes
      url: /mydoc_release_notes_50.html
      output: web, pdf

  - title: Tag archives
    output: web
    folderitems:

    - title: Tag archives overview
      url: /mydoc_tag_archives_overview.html
      output: web

      subfolders:
      - title: Tag archive pages
        output: web
        subfolderitems:

        - title: Formatting pages
          url: /tag_formatting.html
          output: web

        - title: Navigation pages
          url: /tag_navigation.html
          output: web

        - title: Content types pages
          url: /tag_content_types.html
          output: web
```

Each `folder` or `subfolder` must contain a `title` and `output` property. Each `folderitem` or `subfolderitem` must contain a `title`, `url`, and `output` property.

The two outputs available are `web` and `pdf`. (Even if you aren't publishing PDF, you still need to specify `output: web`).

The YAML syntax depends on exact spacing, so make sure you follow the pattern shown in the sample sidebars. See my [YAML tutorial](mydoc_yaml_tutorial) for more details about how YAML works.

{% include note.html content="If you have just one character of spacing off, Jekyll won't build due to the YAML syntax error. You'll see an error message in your console that says \"Error ... did not find expected key while parsing a block mapping at line 22 column 5. Error: Run jekyll build --trace for more information.\" If you encounter this, it usually refers to incorrect indentation or spacing in the YAML file. See the example mydoc_sidebar.yml file to see where your formatting went wrong." %}

Each level must have at least one topic before the next level starts. You can't have a second level that contains multiple third levels without having at least one standalone topic in the second level. If you need a hierarchy that has a folder that contains other folders and no loose topics, use a blank `-` item like this:

```yaml
entries:
- title: sidebar
  product: Jekyll Doc Theme
  version: 6.0
  folders:
  - title: Overview
    output: web, pdf
    folderitems:

    -

  - title: Release Notes
    output: web, pdf
    folderitems:

    - title: 6.0 Release notes
      url: /mydoc_release_notes_60.html
      output: web, pdf

    - title: 5.0 Release notes
      url: /mydoc_release_notes_50.html
      output: web, pdf

  - title: Installation
    output: web, pdf
    folderitems:

    - title: About Ruby, Gems, Bundler, etc.
      url: /mydoc_about_ruby_gems_etc.html
      output: web, pdf

    - title: Install Jekyll on Mac
      url: /mydoc_install_jekyll_on_mac.html
      output: web, pdf

    - title: Install Jekyll on Windows
      url: /mydoc_install_jekyll_on_windows.html
      output: web, pdf
```

To accommodate the title page and table of contents in PDF outputs, each product sidebar must list these pages before any other:

```yaml
- title:
  output: pdf
  type: frontmatter
  folderitems:
  - title:
    url: /titlepage
    output: pdf
    type: frontmatter
  - title:
    url: /tocpage
    output: pdf
    type: frontmatter
```

Leave the output as `output: pdf` for these frontmatter pages so that they don't appear in the web output.

For more detail on the sidebar, see [Sidebar navigation][mydoc_sidebar_navigation] and [YAML tutorial][mydoc_yaml_tutorial].

## Comments

The theme integrates [Commento.io](https://commento.io/) for comments below pages and posts. (This commenting service doesn't inject controversial tracking ads like Disqus does.) You will need to Commento.io account + plan ($5/month) to authorize Commento with your domain (no other configuration should be required). If you don't want comments, in the \_config.yml file, change the `comments: true` properties (under `defaults`) to `comments: false` in every instance. Then in the commento.html include file (inside \_includes), the `{% raw %}{% unless page.comments == false %} ... {% endunless %}{% endraw %}` logic will not insert the Commentio form.

## Relative links and offline viewing

This theme uses relative links throughout so that you can view the site offline and not worry about which server or directory you're hosting it. It's common with tech docs to push content to an internal server for review prior to pushing the content to an external server for publication. Because of the need for seamless transferrence from one host to another, the site has to use relative links.

To view pages locally on your machine (without the Jekyll preview server), they need to have the `.html` extension. The `permalink` property in the page's frontmatter (without surrounding slashes) is what pushes the files into the root directory when the site builds.

## Page frontmatter

When you write pages, include these same frontmatter properties with each page:

```yaml
---
title: "Some title"
tags: [sample1, sample2]
keywords: keyword1, keyword2, keyword3
last_updated: Month day, year
summary: "optional summary here"
sidebar: sidebarname
permalink: filename.html
---
```

(You will customize the values for each of these properties, of course.)

For titles, surrounding the title in quotes is optional, but if you have a colon in the title, you must surround the title with quotation marks. If you have a quotation mark inside the title, escape it first with a backlash `\`.

Values for `keywords` get populated into the metadata of the page for SEO.

Values for `tags` must be defined in your \_data/tags.yml list. You also need a corresponding tag file inside the tags folder pages/tags/ that follows the same pattern as the other tag files shown in the tags folder. (Jekyll won't auto-create these tag files.)

If you don't want the mini-TOC to show on a page (such as for the homepage or landing pages), add `toc: false` in the frontmatter.

The `permalink` value should be the same as your filename and include the ".html" file extension.

For more detail, see [Pages][mydoc_pages].

## Where to store your documentation topics

You can store your files for each product inside subfolders following the pattern shown in the theme. For example, product1, product2, etc, can be stored in their own subfolders inside the \_pages directory. Inside \_pages, you can store your topics inside sub-subfolders or sub-sub-folders to your heart's content. When Jekyll builds your site, it will pull the topics into the root directory and use the permalink for the URL.

Note that product1, product2, and mydoc are all just sample content to demonstrate how to add multiple products into the theme. You can freely delete that content.

For more information, see [Pages][mydoc_pages] and [Posts][mydoc_posts].

## Configure the top navigation

The top navigation bar's menu items are set through the \_data/topnav.yml file. Use the top navigation bar to provide links for navigating from one product to another, or to navigate to external resources.

For external URLs, use `external_url` in the item property, as shown in the example topnav.yml file. For internal links, use `url` the same was you do in the sidebar data files.

Note that the topnav has two sections: `topnav` and `topnav_dropdowns`. The topnav section contains single links, while the `topnav_dropdowns` section contains dropdown menus. The two sections are independent of each other.

## Generating PDF

If you want to generate PDF, you'll need a license for [Prince XML](http://www.princexml.com/). You will also need to [install Prince](http://www.princexml.com/doc/installing/).  You can generate PDFs by product (but not for every product on the site combined together into one massive PDF). Prince will work even without a license, but it will imprint a small Prince image on the first page, and you're supposed to buy the license to use it.

If you're on Windows, install [Git Bash client](https://git-for-windows.github.io/) rather than using the default Windows command prompt.

Open up the css/printstyles.css file and customize the email address (`youremail@domain.com`) that is listed there. This email address appears in the bottom left footer of the PDF output. You'll also need to create a PDF configuration file following the examples shown in the pdfconfigs folder, and also customize some build scripts following the same pattern shown in the root: pdf-product1.sh

See the section on [Generating PDFs][mydoc_generating_pdfs] for more details about setting the theme up for this output.

## Blogs / News

For blog posts, create your markdown files in the \_posts folder following the sample formats. Post file names always begin with the date (YYYY-MM-DD-title).

The news/news.html file displays the posts, and the news_archive.html file shows a yearly history of posts. In documentation, you might use the news to highlight product features outside of your documentation, or to provide release notes and other updates.

See [Posts][mydoc_posts] for more information.

## Markdown

This theme uses [kramdown markdown](http://kramdown.gettalong.org/). kramdown is similar to Github-flavored Markdown, except that when you have text that intercepts list items, the spacing of the intercepting text must align with the spacing of the first character after the space of a numbered list item. Basically, with your list item numbering, use two spaces after the dot in the number, like this:

```
1.  First item
2.  Second item
3.  Third item
```

When you want to insert paragraphs, notes, code snippets, or other matter in between the list items, use four spaces to indent. The four spaces will line up with the first letter of the list item (the <b>F</b>irst or <b>S</b>econd or <b>T</b>hird).

```
1.  First item

    ```
    alert("hello");
    ```

2.  Second item

    Some pig!

3.  Third item
```

See the topics under "Formatting" in the sidebar for more information.

## Automated links

If you want to use an automated system for managing links, see [Automated Links][mydoc_hyperlinks.html#automatedlinks]. This approach automatically creates a list of Markdown references to simplify linking.

## Other instructions

The content here is just a getting started guide only. For other details in working with the theme, see the various sections in the sidebar.

{% include links.html %} -->
