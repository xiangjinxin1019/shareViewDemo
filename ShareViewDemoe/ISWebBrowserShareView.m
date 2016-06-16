//
//  ISWebBrowserShareView.m
//  CamScanner
//
//  Created by Zhang Chi on 14-12-29.
//  Copyright (c) 2014年 2012 Intsig Information Co., LTD. All rights reserved.
//

#import "ISWebBrowserShareView.h"
#import "ISWebBrowserShareObject.h"
#import "global.h"

#define CONTENTVIEW_HEIGHT            330
#define TITLELABEL_ORIGIN_Y           9
#define TITLELABEL_HEIGHT             20
#define SHARECOLLECTIONVIEW_SPACE     16
#define SHARECOLLECTIONVIEW_ORIGIN_Y  46
#define SHARECOLLECTIONVIEW_HEIGHT    100
#define LINEVIEW_ORIGIN_Y             156
#define ACTIONCOLLECTIONVIEW_ORIGIN_Y (LINEVIEW_ORIGIN_Y)+15
#define ACTIONCOLLECTIONVIEW_HEIGHT   100
#define CANCELBUTTON_ORIGIN_Y         (LINEVIEW_ORIGIN_Y)+124
#define CANCELBUTTON_HEIGHT           49
#define LEFTSPACE                     15

#define CONTENT_BACKGROUND_COLOR      UIColorFromRGB(0xeaeaea)
#define GLOBAL_TITLE_COLOR            UIColorFromRGB(0x5e5e5e)
#define GLOBAL_LINEVIEW_COLOR         UIColorFromRGB(0xc7c7c7)
#define CANCELBUTTON_BACKGROUND_COLOR UIColorFromRGB(0xf7f7f7)
#define CANCELBUTTON_TITLE_COLOR      UIColorFromRGB(0x353535)

#define BROWSER_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define BROWSER_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

NSString *const kWebBrowserShareColectionViewCell = @"kWebBrowserShareColectionViewCell";
NSString *const kWebBrowserActionColectionViewCell = @"kWebBrowserActionColectionViewCell";

@interface ISWebBrowserShareView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@end

@implementation ISWebBrowserShareView




#pragma mark - setting views methods

// setting maskView
- (void) settingMaskView
{
    _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BROWSER_SCREEN_WIDTH, BROWSER_SCREEN_HEIGHT)];
    
    _maskView.backgroundColor = UIColorFromRGBA(0x000000, 0.55);
    
    [self addSubview:_maskView];
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    
    [self.maskView addGestureRecognizer:_tapGestureRecognizer];
    
    self.maskView.alpha = 0;
}

// setting contentView
- (void) settingContentView
{
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, BROWSER_SCREEN_HEIGHT, BROWSER_SCREEN_WIDTH, CONTENTVIEW_HEIGHT)];
    
    _contentView.backgroundColor = CONTENT_BACKGROUND_COLOR;
    
    [self addSubview:_contentView];

}

// setting titleLabel
- (void) settingTitleLabelWithTitle:(NSString *)title
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, TITLELABEL_ORIGIN_Y, BROWSER_SCREEN_WIDTH, TITLELABEL_HEIGHT)];
    
    _titleLabel.backgroundColor = CONTENT_BACKGROUND_COLOR;
    
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _titleLabel.font = [UIFont systemFontOfSize:11];
    
    _titleLabel.textColor = GLOBAL_TITLE_COLOR;
    
    _titleLabel.numberOfLines = 0;
    
    _titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"i_wb_label_share_menu_url_source", @"From %@"), title];
    
    [self.contentView addSubview:_titleLabel];
    
}


// setting shareCollectionView
- (void) settingShareCollectionViewWithPreviousView:(UIView *)previousView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _shareCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(previousView.frame)+16, BROWSER_SCREEN_WIDTH, SHARECOLLECTIONVIEW_HEIGHT) collectionViewLayout:layout];
    
    _shareCollectionView.delegate = self;
    
    _shareCollectionView.dataSource = self;
    
    _shareCollectionView.alwaysBounceHorizontal = YES;
    
    _shareCollectionView.backgroundColor = CONTENT_BACKGROUND_COLOR;
    
    _shareCollectionView.directionalLockEnabled = YES;
    
    _shareCollectionView.scrollEnabled = YES;
    
    _shareCollectionView.showsHorizontalScrollIndicator = NO;
    
    [_shareCollectionView registerClass:[ISWebBrowserShareCollectionViewCell class] forCellWithReuseIdentifier:kWebBrowserShareColectionViewCell];
    
    [self.contentView addSubview:_shareCollectionView];

}

// setting lineView
- (UIView *) settingLineView
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(LEFTSPACE, LINEVIEW_ORIGIN_Y, BROWSER_SCREEN_WIDTH - LEFTSPACE, 1)];
    
    lineView.backgroundColor = GLOBAL_LINEVIEW_COLOR;
    
    [self.contentView addSubview:lineView];
    
    return  lineView;

}

// setting actionCollectionView
- (void) settingActionCollectionViewWithPreviousView:(UIView *)previousView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _actionCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(previousView.frame)+16, BROWSER_SCREEN_WIDTH, ACTIONCOLLECTIONVIEW_HEIGHT) collectionViewLayout:layout];
    
    _actionCollectionView.delegate = self;
    
    _actionCollectionView.dataSource = self;
    
    _actionCollectionView.alwaysBounceHorizontal = YES;
    
    _actionCollectionView.backgroundColor = CONTENT_BACKGROUND_COLOR;
    
    _actionCollectionView.directionalLockEnabled = YES;
    
    _actionCollectionView.scrollEnabled = YES;
    
    _actionCollectionView.showsHorizontalScrollIndicator = NO;
    
    [_actionCollectionView registerClass:[ISWebBrowserShareCollectionViewCell class] forCellWithReuseIdentifier:kWebBrowserActionColectionViewCell];
    
    [self.contentView addSubview:_actionCollectionView];
}

// setting cancelButton
- (void) settingCancelButtonWithCancelButtonTitle:(NSString *)cancelButtonTitle previousView:(UIView *)previousView
{
    _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(previousView.frame)+10, BROWSER_SCREEN_WIDTH, CANCELBUTTON_HEIGHT)];
    
    _cancelButton.backgroundColor = CANCELBUTTON_BACKGROUND_COLOR;
    
    [_cancelButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
    [_cancelButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    [_cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
    
    [_cancelButton setTitleColor:CANCELBUTTON_TITLE_COLOR forState:UIControlStateNormal];
    
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:17];
    
    [_cancelButton addTarget:self action:@selector(cancelButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_cancelButton];

}


#pragma  mark - init method
- (instancetype) initWithTitle:(NSString *) title
             cancelButtonTitle:(NSString *) cancelButtonTitle
                     shareList:(NSArray *) shareList
                    actionList:(NSArray *) actionList
{
    self = [super initWithFrame:CGRectMake(0, 0, BROWSER_SCREEN_WIDTH, BROWSER_SCREEN_HEIGHT)];
    if (self)
    {
        _shareList = shareList;
        
        _actionList = actionList;
        
        // setting maskView
        [self settingMaskView];
        
        UIView *previousView;
        
        // setting contenView
        [self settingContentView];

        if (title.length > 0) {
            
            // setting titleLabel
            [self settingTitleLabelWithTitle:title];
            
            previousView = _titleLabel;
        }

        if (_shareList) {
            
            // setting shareCollectionView
            [self settingShareCollectionViewWithPreviousView:previousView];

            previousView = _shareCollectionView;
        }
        
        if (_shareList.count > 0 && _actionList.count > 0) {
            
            // setting lineView
            UIView *lineView = [self settingLineView];
            
            previousView = lineView;
        }

        if (_actionList.count > 0) {
            
            // setting actionCollectionView
            [self settingActionCollectionViewWithPreviousView:previousView];
            
            previousView = _actionCollectionView;
        }

        // setting cancelButton
        [self settingCancelButtonWithCancelButtonTitle:cancelButtonTitle previousView:previousView];
        
        self.contentView.frame = CGRectMake(0, BROWSER_SCREEN_HEIGHT, BROWSER_SCREEN_WIDTH, CGRectGetMaxY(_cancelButton.frame));
    }
    
    return self;
}

- (instancetype) initWithTitle:(NSString *) title
             cancelButtonTitle:(NSString *) cancelButtonTitle
                   cancelBlock:(void (^)(void)) cancelBlock
                     shareList:(NSArray *) shareList
                    actionList:(NSArray *) actionList
{
    return [self initWithTitle:title cancelButtonTitle:cancelButtonTitle cancelBlock:^{
    } shareList:shareList shareButtonBlock:nil actionList:actionList actionButtonBlock:nil];
}


- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
                  cancelBlock:(void (^)(void))cancelBlock
                    shareList:(NSArray *)shareList
             shareButtonBlock:(void (^)(ISWebBrowserCellType))shareButtonBlock
                   actionList:(NSArray *)actionList
            actionButtonBlock:(void (^)(ISWebBrowserCellType))actionButtonBlock
{
    self = [self initWithTitle:title cancelButtonTitle:cancelButtonTitle shareList:shareList actionList:actionList];
    if (self)
    {
        _cancelBlock = cancelBlock;
        _shareButtonBlock = shareButtonBlock;
        _actionButtonBlock = actionButtonBlock;
    }
    return self;
}


#pragma mark - Button Action
- (void)cancelButtonDidClicked:(id)sender
{
    self.cancelBlock();
    
    [self hide];
}

- (void)show
{
    [UIView animateWithDuration:0.2 animations:^{
         self.maskView.alpha = 1;
         self.contentView.frame = CGRectMake(0, BROWSER_SCREEN_HEIGHT - self.contentView.frame.size.height, BROWSER_SCREEN_WIDTH, self.contentView.frame.size.height);
     }];
}

- (void)hide
{
    [UIView animateWithDuration:0.2 animations:^{
         self.maskView.alpha = 0;
         self.contentView.frame = CGRectMake(0, BROWSER_SCREEN_HEIGHT, BROWSER_SCREEN_WIDTH, BROWSER_SCREEN_HEIGHT);
     } completion:^(BOOL finished) {
         [self removeFromSuperview];
     }];
}

- (void)shareButtonDidClicked:(id)sender
{
    [self hide];
    UIButton *button = (UIButton *)sender;
    ISWebBrowserCellType type = button.tag;
//    ISInfo(@"did click button: %d", type);
    if (self.shareButtonBlock)
    {
        self.shareButtonBlock(type);
    }
}

- (void)actionButtonDidClicked:(id)sender
{
    [self hide];
    UIButton *button = (UIButton *)sender;
    ISWebBrowserCellType type = button.tag;
//    ISInfo(@"did click button: %d", type);
    if (self.actionButtonBlock)
    {
        self.actionButtonBlock(type);
    }
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count;

    if (collectionView == self.shareCollectionView)
    {
        count = self.shareList.count;
    }
    else
    {
        count = self.actionList.count;
    }
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier;
    ISWebBrowserShareObject *shareObject;
    SEL action;

    if (collectionView == self.shareCollectionView) {
        
        cellIdentifier = kWebBrowserShareColectionViewCell;
        shareObject = [self.shareList objectAtIndex:indexPath.row];
        action = @selector(shareButtonDidClicked:);
        
    } else {
        
        cellIdentifier = kWebBrowserActionColectionViewCell;
        shareObject = [self.actionList objectAtIndex:indexPath.row];
        action = @selector(actionButtonDidClicked:);
    }
    
    ISWebBrowserShareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

//    [cell updateWithType:type target:self action:action];
    [cell updateWithShareObject:shareObject atIndexPath:indexPath target:self action:action];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, LEFTSPACE, 0, LEFTSPACE);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 12;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end
