#this is /ci2014/makefile
#for cleaning subdirs http://lackof.org/taggart/hacking/make-example/
SUBDIRS = book abstract poster
.PHONY: all clean $(SUBDIRS)

CLEANDIRS = $(SUBDIRS:%=clean-%)

all: $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

clean: $(CLEANDIRS)
$(CLEANDIRS):
	$(MAKE) -C $(@:clean-%=%) clean
