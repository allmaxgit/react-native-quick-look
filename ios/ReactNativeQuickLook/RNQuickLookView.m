//
//  RNQuickLookView.m
//
//  Created by Rahul Jiresal on 7/15/16.
//  Copyright © 2016 Air Computing Inc. All rights reserved.
//

#import "RNQuickLookView.h"
#import <QuickLook/QuickLook.h>
#import "QLPreviewItem.h"

@interface RNQuickLookView () <QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@property UIView* previewView;
@property QLPreviewController* previewCtrl;

@end

@implementation RNQuickLookView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
    
}

- (instancetype)initWithPreviewItemUrl:(NSString*)url {
    NSAssert(url != nil, @"Preview Item URL cannot be nil");
    self = [super init];
    if (self) {
        _url = url;
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.previewCtrl = [[QLPreviewController alloc] init];
    self.previewCtrl.delegate = self;
    self.previewCtrl.dataSource = self;
    self.previewView = self.previewCtrl.view;
    self.clipsToBounds = YES;
    [self addSubview:self.previewCtrl.view];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.previewView setFrame:self.frame];
}

- (void)setUrl:(NSString *)urlString {
    NSURL* url = [NSURL fileURLWithPath:urlString];
    NSString* fileUrl = [[NSString alloc] initWithFormat:@"file://%@", url];
    _url = fileUrl;
    QLPreviewItem* item = [[QLPreviewItem alloc] initWithURL: url andRefreshStatus:YES];
    if (![QLPreviewController canPreviewItem: item] && self.onCanPreview) {
        self.onCanPreview(@{@"error": @YES,});
    }
    [self.previewCtrl refreshCurrentPreviewItem];
}

- (void)setAssetFileName:(NSString*)filename {
    _url = [[NSBundle mainBundle] pathForResource:[filename stringByDeletingPathExtension] ofType:[filename pathExtension]];
    [self.previewCtrl refreshCurrentPreviewItem];
}

#pragma mark - QLPreviewControllerDataSource

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return [NSURL URLWithString:_url];
}

#pragma mark - QLPreviewControllerDelegate

- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item {
    return YES;
}

@end
