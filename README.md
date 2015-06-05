**Note: this syntax highlighting file is now [shipped with GtkSourceView](https://git.gnome.org/browse/gtksourceview/commit/?id=db965e3a) since version 3.9.2.**

## Overview

gedit-mediawiki adds [MediaWiki](http://meta.wikimedia.org/wiki/Help:Editing) syntax highlighting in gedit, the default Gnome text editor.

Here's a screenshot:

<img src="https://raw.githubusercontent.com/jagzph/gedit-mediawiki/master/doc/exemple1.png" width="685" height="1112" alt="MediaWiki syntax highlighting in gedit." />

## Installation

- [Download the archive of the latest version.](https://github.com/jagzph/gedit-mediawiki/archive/master.zip)

- Extract the archive.

- Copy the file `mediawiki.lang` in one of the following two locations (create the folder if it doesn't yet exist):

	- for gedit 2 RHEL6/CentOS6: `/usr/share/gtksourceview-2.0/language-specs/`
	- for gedit 3 RHEL7/CentOS7: `/usr/share/gtksourceview-3.0/language-specs/`

MediaWiki syntax highlighting will be added for all users plus the `.wiki` extension

## Uninstallation

Remove the file previously installed.

## Usage

First of all, restart gedit if it's already running.

Choose syntax highlighting by going to *View > Highlight Mode > Others* and selecting *MediaWiki*.

The folder `doc` contains a demo file.

## Development

Git is used for revision control. [Repository can be browsed online or cloned.](https://github.com/jagzph/gedit-mediawiki)

If you are looking for the original source and creator [Repository of jpfleury](https://github.com/jpfleury/gedit-mediawiki)

All the credits goes to HIM not mine, I just cloned and add some small changes.

## License

Author: Jean-Philippe Fleury (<http://www.jpfleury.net/en/contact.php>)  
Copyright © 2009 Jean-Philippe Fleury

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
