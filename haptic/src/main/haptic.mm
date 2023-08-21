#include "haptic.h"

#import <UIKit/UIKit.h>

Haptic* Haptic::instance = NULL;
UISelectionFeedbackGenerator* selectionGenerator = NULL;
NSArray<UIImpactFeedbackGenerator*>* impactGenerator = NULL;

Haptic::Haptic() {
    ERR_FAIL_COND(instance != NULL);
    
	selectionGenerator = [UISelectionFeedbackGenerator new];
	impactGenerator = @[
        [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight],
        [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium],
        [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]
    ];
    
    instance = this;
}

Haptic::~Haptic() {
    instance = NULL;
    impactGenerator = NULL;
	selectionGenerator = NULL;
}

void Haptic::selection() {
    [selectionGenerator selectionChanged];
}

void Haptic::impact(int style) {
    if (style < 0 || style > 2) {
        style = 0;
    }
    
	UIImpactFeedbackGenerator *hap = impactGenerator[style];
    [hap prepare];
    [hap impactOccurred];
}

void Haptic::_bind_methods() {
    ClassDB::bind_method("selection", &Haptic::selection);
    ClassDB::bind_method("impact", &Haptic::impact);
}
