#import <Foundation/Foundation.h>
#include <spawn.h>
#include <rootless.h>
#import "BLUBRootListController.h"

@implementation BLUBRootListController

- (void)viewDidLoad {
	[super viewDidLoad];

	UIBarButtonItem *respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring"
	                                                                   style:UIBarButtonItemStylePlain
	                                                                  target:self
	                                                                  action:@selector(confirmRespring)];
	self.navigationItem.rightBarButtonItem = respringButton;
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)confirmRespring {
	pid_t pid;
	const char* args[] = {"sbreload", NULL};
	const char* path = [ROOT_PATH_NS(@"/usr/bin/sbreload") UTF8String];

	posix_spawn(&pid, path, NULL, NULL, (char * const *)args, NULL);
}

@end
