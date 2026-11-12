#include <UIKit/UIKit.h>

@interface MTMaterialView : UIView
+ (instancetype)materialViewWithRecipe:(long long)recipe options:(unsigned long long)options;
@property (nonatomic, assign) double weighting;
@end

%hook MTMaterialLayer

- (double)weighting {
    return %orig * 0.5;
}

%end