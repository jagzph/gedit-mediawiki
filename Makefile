########################################################################
##
## VARIABLES
##
########################################################################

# Récupère le dernier tag (qui représente la dernière version)
tag=`bzr tags | tail -n 1 | cut -d ' ' -f 1`

# Récupère le numéro de la première révision du dernier tag
premiereRevTag=`bzr tags | tail -n 2 | head -n 1 | rev | cut -d ' ' -f 1 | rev | xargs expr 1 + `

########################################################################
##
## MÉTACIBLES
##
########################################################################

# Crée une archive .bz2, y ajoute les fichiers qui ne sont pas versionnés mais nécessaires, supprime les fichiers versionnés mais inutiles. À faire après un bzr tag... quand une nouvelle version est sortie.
publier: bz2

########################################################################
##
## CIBLES
##
########################################################################

bz2: menage-bz2 ChangeLog
	bzr export -r tag:$(tag) $(tag)
	mv ChangeLog $(tag)/
	php ./scripts.cli.php mdtxt ChangeLogDerniereVersion
	mv ChangeLogDerniereVersion.mdtxt ~/Bureau/ChangeLog-$(tag).mdtxt
	mv ChangeLogDerniereVersion $(tag)/
	rm -f $(tag)/Makefile
	rm -f $(tag)/scripts.cli.php
	tar -jcvf $(tag).tar.bz2 $(tag)
	rm -rf $(tag)
	mv $(tag).tar.bz2 $(tag).tbz2 # Drupal bogue avec l'ajout de fichiers .tar.bz2
	mv $(tag).tbz2 ~/Bureau/

ChangeLog: menage-ChangeLog
	# Est basé sur http://telecom.inescporto.pt/~gjc/gnulog.py
	# Ne pas oublier de mettre ce fichier dans le dossier de plugins de bzr,
	# par exemple ~/.bazaar/plugins/
	BZR_GNULOG_SPLIT_ON_BLANK_LINES=0 bzr log -v --log-format 'gnu' -r1..tag:$(tag) > ChangeLog
	BZR_GNULOG_SPLIT_ON_BLANK_LINES=0 bzr log -v --log-format 'gnu' -r revno:$(premiereRevTag)..tag:$(tag) > ChangeLogDerniereVersion

menage-bz2:
	rm -f $(tag).tbz2

menage-ChangeLog:
	rm -f ChangeLog
	rm -f ChangeLogDerniereVersion

