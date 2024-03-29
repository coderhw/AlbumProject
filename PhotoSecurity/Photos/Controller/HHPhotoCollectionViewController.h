//
//  XPPhotoCollectionViewController.h
//  PhotoSecurity
//
//  Created by nhope on 2017/3/9.
//  Copyright © 2017年 xiaopin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HHAlbumCollectionModel;
@class PHAsset;

@interface HHPhotoCollectionViewController : UICollectionViewController

/// 相册信息模型
@property (nonatomic, strong) HHAlbumCollectionModel *album;
/// 选择图片后的回调block
@property (nonatomic, copy) void(^didSelectAssetsCompletionHandler)(NSArray<PHAsset *> *assets);

@end
