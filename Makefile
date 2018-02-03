SHELL = /bin/sh
CWD = $(shell pwd)
DESTDIR = $(HOME)
CONFIG_D = $(DESTDIR)/.config

INSTALL = install -D
INSTALL_DATA = $(INSTALL) -m 0644

targets =

all: all-targets

include recipes/*.mk

all-targets: $(targets)

PHONY: all $(targets)
