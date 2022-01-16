################
# PDF creation #
################
ORG_SOURCES := go-harp

.PHONY: pdf
pdf: $(ORG_SOURCES:%=%.pdf)

%.pdf: %.org
	./litlib/export-to-pdf.sh "$<" "$@"

###############################
# Dependencies initialisation #
###############################
.PHONY: submodules_retrieval LitLib init

submodules_retrieval:
	git submodule init
	git submodule update

LitLib: submodules_retrieval
	cd litlib && make --silent LitLib

init: LitLib
