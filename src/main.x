#include <rootless.h>

static double cachedMultiplier = 1.0;

static void loadPrefs() {
    CFStringRef bundleID = CFSTR("com.yellowcat98.ccblurb");
    CFPreferencesAppSynchronize(bundleID);

    CFPropertyListRef value = CFPreferencesCopyAppValue(CFSTR("kBlurMultiplier"), bundleID);

    double multPercent = 100.0;

    if (value != NULL) {
        if (CFGetTypeID(value) == CFNumberGetTypeID()) {
            CFNumberGetValue((CFNumberRef)value, kCFNumberDoubleType, &multPercent);
        }
        CFRelease(value);
    }

    cachedMultiplier = multPercent / 100.0;
}

%hook MTMaterialLayer

-(double)weighting {
    return %orig * cachedMultiplier;
}

%end

%ctor {
    loadPrefs();

    %init;
}