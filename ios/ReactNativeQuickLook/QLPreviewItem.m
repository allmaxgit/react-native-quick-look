//
//  QLPreviewItem.m
//
//  Created by Taras Parkhomenko on 12/07/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "QLPreviewItem.h"


@implementation QLPreviewItem

-(instancetype)init {
  self = [super init];
  if (self) {
    _previewItemURL = nil;
    [self setWasRefreshed:NO];
  }
  return self;
}

-(instancetype)initWithURL: (NSURL* ) url andRefreshStatus: (BOOL) flag {
  self = [super init];
  if (self) {
    _previewItemURL = url;
    [self setWasRefreshed:flag];
  }
  return self;
}

@end
