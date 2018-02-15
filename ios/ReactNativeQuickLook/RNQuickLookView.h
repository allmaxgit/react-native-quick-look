//
//  RNQuickLookView.h
//
//  Created by Rahul Jiresal on 7/15/16.
//  Copyright © 2016 Air Computing Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>

@interface RNQuickLookView : UIView {
    NSString* _url;
    NSString* _assetFileName;
}

@property (nonatomic, copy) RCTBubblingEventBlock onCanPreview;

- (instancetype)initWithPreviewItemUrl:(NSString*)url;

@end
