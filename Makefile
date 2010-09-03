########################################################################
##
## Variables.
##
########################################################################

# Dernière version, représentée par la dernière étiquette.
version:=$(shell bzr tags | sort -k2n,2n | tail -n 1 | cut -d ' ' -f 1)

########################################################################
##
## Métacibles.
##
########################################################################

# Crée l'archive; y ajoute les fichiers qui ne sont pas versionnés, mais nécessaires; supprime les fichiers versionnés, mais inutiles. À faire après un `bzr tag ...` pour la sortie d'une nouvelle version.
publier: archive

########################################################################
##
## Cibles.
##
########################################################################

archive: menage-archive ChangeLog
	bzr export -r tag:$(version) gedit-mediawiki
	mv doc/ChangeLog gedit-mediawiki/doc
	mv doc/version.txt gedit-mediawiki/doc
	rm -f gedit-mediawiki/Makefile
	zip -rv gedit-mediawiki.zip gedit-mediawiki
	rm -rf gedit-mediawiki

ChangeLog: menage-ChangeLog
	# Est basé sur <http://telecom.inescporto.pt/~gjc/gnulog.py>. Ne pas oublier de mettre ce fichier dans le dossier des extensions de bazaar, par exemple `~/.bazaar/plugins/`.
	BZR_GNULOG_SPLIT_ON_BLANK_LINES=0 bzr log -v --log-format 'gnu' -r1..tag:$(version) > doc/ChangeLog

menage-archive:
	rm -f gedit-mediawiki.zip

menage-ChangeLog:
	rm -f doc/ChangeLog

menage-version.txt:
	rm -f doc/version.txt

push:
	bzr push lp:~jpfle/+junk/gedit-mediawiki

version.txt: menage-version.txt
	echo $(version) > doc/version.txt

