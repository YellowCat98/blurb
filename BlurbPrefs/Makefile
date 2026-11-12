TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BlurbPrefs

BlurbPrefs_FILES = BLUBRootListController.m
BlurbPrefs_FRAMEWORKS = UIKit
BlurbPrefs_PRIVATE_FRAMEWORKS = Preferences
BlurbPrefs_INSTALL_PATH = /Library/PreferenceBundles
BlurbPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
