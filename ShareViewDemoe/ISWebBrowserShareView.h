//
//  ISWebBrowserShareView.h
//  CamScanner
//
//  Created by Zhang Chi on 14-12-29.
//  Copyright (c) 2014年 2012 Intsig Information Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISWebBrowserShareCollectionViewCell.h"

extern NSString *const kWebBrowserShareColectionViewCell;
extern NSString *const kWebBrowserActionColectionViewCell;

@interface ISWebBrowserShareView : UIView

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) void (^ cancelBlock)(void);
@property (nonatomic, strong) void (^ shareButtonBlock)(ISWebBrowserCellType type);
@property (nonatomic, strong) void (^ actionButtonBlock)(ISWebBrowserCellType type);
@property (nonatomic, strong) NSArray *shareList;
@property (nonatomic, strong) NSArray *actionList;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UICollectionView *shareCollectionView;
@property (nonatomic, strong) UICollectionView *actionCollectionView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

// for subviews
- (instancetype) initWithTitle:(NSString *) title cancelButtonTitle:(NSString *) cancelButtonTitle shareList:(NSArray *) shareList actionList:(NSArray *) actionList;

- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
                  cancelBlock:(void (^)(void))cancelBlock
                    shareList:(NSArray *)shareList
                   actionList:(NSArray *)actionList;

- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
                  cancelBlock:(void (^)(void))cancelBlock
                    shareList:(NSArray *)shareList
             shareButtonBlock:(void (^)(ISWebBrowserCellType type))shareButtonBlock
                   actionList:(NSArray *)actionList
            actionButtonBlock:(void (^)(ISWebBrowserCellType type))actionButtonBlock;

- (void)show;
- (void)hide;

@end
