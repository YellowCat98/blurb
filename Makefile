TARGET := iphone:clang:latest:18.0
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME = rootless


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Blurb

Blurb_FILES = $(wildcard src/*.x src/*.m)
Blurb_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
