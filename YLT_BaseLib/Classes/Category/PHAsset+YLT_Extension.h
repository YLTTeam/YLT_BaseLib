//
//  PHAsset+YLT_Extension.h
//  YLT_BaseLib
//
//  Created by 項普華 on 2019/12/4.
//

#import <Photos/Photos.h>

@interface PHAsset (YLT_Extension)

/** 是否是视频 */
@property (nonatomic, assign, readonly) BOOL isVideo;

/** 是否是图像 */
@property (nonatomic, assign, readonly) BOOL isImage;

/** 是否是音频 */
@property (nonatomic, assign, readonly) BOOL isAudio;

@end
