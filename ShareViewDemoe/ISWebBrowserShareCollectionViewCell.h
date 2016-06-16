//
//  ISWebBrowserShareCollectionViewCell.h
//  CamScanner
//
//  Created by Zhang Chi on 14-12-30.
//  Copyright (c) 2014年 2012 Intsig Information Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CONTENT_BACKGROUND_COLOR UIColorFromRGB(0xeaeaea)
#define GLOBAL_TITLE_COLOR       UIColorFromRGB(0x5e5e5e)
#define CONTACTALERTACTION_BACKGROUND_COLOR [UIColor whiteColor]

@class ISWebBrowserShareObject;

typedef NS_ENUM(NSUInteger, ISWebBrowserCellType)
{
    ISWebBrowserCellTypeDefault = 0,
    ISWebBrowserCellTypeCCContact,
    ISWebBrowserCellTypeCCTimeline,
    ISWebBrowserCellTypeWXSceneSession,
    ISWebBrowserCellTypeWXSceneTimeline,
    ISWebBrowserCellTypeQQ,
    ISWebBrowserCellTypeSinaWeibo,
    ISWebBrowserCellTypeEmail,
    ISWebBrowserCellTypeMore,
    ISWebBrowserCellTypeReload,
    ISWebBrowserCellTypeCopyUrl,
    ISWebBrowserCellTypeQRCode,
    ISWebBrowserCellTypeSMS,
    ISWebBrowserCellTypeContactAlertAction, // 名片详情界面的分享面板
};

@interface ISWebBrowserShareCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) ISWebBrowserCellType type;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *titleLabel;

- (void) updateWithShareObject:(ISWebBrowserShareObject *) shareObject atIndexPath:(NSIndexPath *) indexPath target:(id) target action:(SEL) action;
//- (void) updateWithType:(ISWebBrowserCellType) type target:(id) target action:(SEL) action;

@end
