//
//  QLPreviewItem.h
//
//  Created by Taras Parkhomenko on 12/07/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>

@interface QLPreviewItem : NSObject<QLPreviewItem>

@property(readonly, nullable, nonatomic) NSURL * previewItemURL;
@property BOOL wasRefreshed;

-(instancetype _Nullable )init;
-(instancetype _Nonnull )initWithURL: (NSURL* _Nullable ) url andRefreshStatus: (BOOL) flag;
@end
