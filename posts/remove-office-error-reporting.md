---
layout: post
title: Remove Microsoft Error Reporting from macOS 
tags: startups, tech, medicine
---

If you force-quit any Microsoft Office application on macOS using Option-Command-Esc, this annoying and useless error reporter
launches:

![](/assets/mer.png)

The Microsoft Error Reporting app exists within *each* Office app installed on your Mac, i.e. within Word, OneNote,
PowerPoint, etc.

This is insane, so let's remove it.

Open terminal and type in the following to delete:

```
sudo rm -rf /Applications/Microsoft\ *.app/Contents/SharedSupport/Microsoft\ Error\ Reporting.app/
```

This will go through `/Microsoft\ Excel.app`, `/Microsoft\ PowerPoint.app`, etc. and delete the app.

Be extremely careful using `sudo` and `rm`. Don't wreck your system.
