//
//  ISWebBrowserShareCollectionViewCell.m
//  CamScanner
//
//  Created by Zhang Chi on 14-12-30.
//  Copyright (c) 2014年 2012 Intsig Information Co., LTD. All rights reserved.
//

#import "ISWebBrowserShareCollectionViewCell.h"
#import "ISWebBrowserShareObject.h"
#import "global.h"
#import "CCStyleSheet.h"

@implementation ISWebBrowserShareCollectionViewCell

#pragma mark - setting

// setting button
- (void)settingButton
{
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    _button.backgroundColor = CONTENT_BACKGROUND_COLOR;
    
    [self addSubview:_button];
}

// setting titleLabel
- (void)settingTitleLabel
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 60, 10)];
    
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _titleLabel.backgroundColor = CONTENT_BACKGROUND_COLOR;
    
    _titleLabel.font = [UIFont systemFontOfSize:11];
    
    _titleLabel.numberOfLines = 0;
    
    _titleLabel.textColor = GLOBAL_TITLE_COLOR;
    
    [self addSubview:_titleLabel];
}

#pragma mark - initWithFrame
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = CONTENT_BACKGROUND_COLOR;
        
        // setting button
        [self settingButton];

        // setting titleLabel
        [self settingTitleLabel];
        
        self.isAccessibilityElement = YES;
        
        self.accessibilityTraits = UIAccessibilityTraitButton;
    }
    return self;
}

- (void) updateWithShareObject:(ISWebBrowserShareObject *) shareObject atIndexPath:(NSIndexPath *) indexPath target:(id) target action:(SEL) action
{
    self.type = shareObject.type;
    
    if (self.type == ISWebBrowserCellTypeContactAlertAction) {
        
        [self configureContactAlertActionCellWithShareObject:shareObject target:target action:action];
        
        return;
    }
    
    UIImage *icon = shareObject.image;
    
    if (icon == nil) {
        
        icon = [self iconOfType:self.type];
    }
    
    [self.button setBackgroundImage:icon forState:UIControlStateNormal];
    
    if (shareObject.target && shareObject.action) {
        
        [self.button addTarget:shareObject.target action:shareObject.action forControlEvents:UIControlEventTouchUpInside];
        
        // 如果不是既有的分享的item， 需要增加action， 在惦记item后hideview
        [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
    } else {
        
        [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.button setTag:self.type];
    
    NSString *title = shareObject.title;
    
    if (title.length <= 0) {
        
        title = [self titleOfType:self.type];
    }

    self.titleLabel.text = title;
    
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    textStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    
    context.minimumScaleFactor = 0.5;
    
    CGRect rect = [self.titleLabel.text boundingRectWithSize:CGSizeMake(60, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11] , NSParagraphStyleAttributeName: textStyle} context:context];
    
    self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, ceil(rect.size.height));
}


- (void)configureContactAlertActionCellWithShareObject:(ISWebBrowserShareObject *) shareObject target:(id) target action:(SEL) action
{
    self.backgroundColor = CONTACTALERTACTION_BACKGROUND_COLOR;
    
    self.button.backgroundColor = CONTACTALERTACTION_BACKGROUND_COLOR;
    
    self.titleLabel.backgroundColor = CONTACTALERTACTION_BACKGROUND_COLOR;
    
    self.titleLabel.textColor = [CCStyleSheet CCUpdatedGray1Color];
    
    UIImage *icon = shareObject.image;
    
    [self.button setBackgroundImage:icon forState:UIControlStateNormal];
    
    self.button.frame = CGRectMake((self.frame.size.width - 50) / 2, 20, 50, 50);
    
    if (shareObject.target && shareObject.action)
    {
        [self.button addTarget:shareObject.target action:shareObject.action forControlEvents:UIControlEventTouchUpInside];
        // 如果不是既有的分享的item， 需要增加action， 在惦记item后hideview
        [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSString *title = shareObject.title;
    
    self.titleLabel.text = title;
    
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    textStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    
    context.minimumScaleFactor = 0.5;
    
    CGRect rect = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width - 10, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11] , NSParagraphStyleAttributeName: textStyle} context:context];
    
    self.titleLabel.frame = CGRectMake(5, CGRectGetMaxY(self.button.frame) + 9, self.frame.size.width - 10, ceil(rect.size.height));
}

//- (void) updateWithType:(ISWebBrowserCellType) type target:(id) target action:(SEL) action
//{
//    self.type = type;
//    UIImage *icon = [self iconOfType:type];
//    [self.button setBackgroundImage:icon forState:UIControlStateNormal];
//    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    [self.button setTag:type];
//    self.titleLabel.text = [self titleOfType:type];
//    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
//    textStyle.lineBreakMode = NSLineBreakByCharWrapping;
//    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
//    context.minimumScaleFactor = 0.5;
//    CGRect rect = [self.titleLabel.text boundingRectWithSize:CGSizeMake(60, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11] , NSParagraphStyleAttributeName: textStyle} context:context];
//    self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, rect.size.height);
//}

- (UIImage *)iconOfType:(ISWebBrowserCellType)type
{
    UIImage *iconImage;
    switch (type)
    {
        case ISWebBrowserCellTypeCCContact :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_CC.png"];
            break;
        case ISWebBrowserCellTypeCCTimeline:
            iconImage = [UIImage imageNamed:@"ic_webBrowser_CC.png"];
            break;
        case ISWebBrowserCellTypeWXSceneSession :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_wechat.png"];
            break;
        case ISWebBrowserCellTypeWXSceneTimeline :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_wxMoments.png"];
            break;
        case ISWebBrowserCellTypeQQ :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_QQ.png"];
            break;
        case ISWebBrowserCellTypeSinaWeibo :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_weibo.png"];
            break;
        case ISWebBrowserCellTypeEmail :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_email.png"];
            break;
        case ISWebBrowserCellTypeMore :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_more.png"];
            break;
        case ISWebBrowserCellTypeReload :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_reload.png"];
            break;
        case ISWebBrowserCellTypeCopyUrl :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_copy.png"];
            break;
        case ISWebBrowserCellTypeQRCode :
            iconImage = [UIImage imageNamed:@"ic_webBrowser_qr"];
            break;
        default :
            break;
    }
    return iconImage;
}

- (NSString *)titleOfType:(ISWebBrowserCellType)type
{
    NSString *title;
    switch (type)
    {
        case ISWebBrowserCellTypeCCContact :
            title = NSLocalizedString(@"i_wb_button_share_menu_contact", @"Send to Contacts");
            break;
        case ISWebBrowserCellTypeCCTimeline:
            title = NSLocalizedString(@"cc6.7.0_132", @"转发到需求");
            break;
        case ISWebBrowserCellTypeWXSceneSession :
            title = NSLocalizedString(@"i_wb_button_share_menu_wx_session", @"WeChat");
            break;
        case ISWebBrowserCellTypeWXSceneTimeline :
            title = NSLocalizedString(@"i_wb_button_share_menu_wx_timeline", @"WeChat Moments");
            break;
        case ISWebBrowserCellTypeQQ :
            title = NSLocalizedString(@"i_wb_button_share_menu_QQ", @"QQ");
            break;
        case ISWebBrowserCellTypeSinaWeibo :
            title = NSLocalizedString(@"i_wb_button_share_menu_sina_weibo", @"Sina Weibo");
            break;
        case ISWebBrowserCellTypeEmail :
            title = NSLocalizedString(@"i_wb_button_share_menu_email", @"Email");
            break;
        case ISWebBrowserCellTypeMore :
            title = NSLocalizedString(@"i_wb_button_share_menu_more", @"More");
            break;
        case ISWebBrowserCellTypeReload :
            title = NSLocalizedString(@"i_wb_button_share_menu_reload", @"Refresh");
            break;
        case ISWebBrowserCellTypeCopyUrl :
            title = NSLocalizedString(@"i_wb_button_share_menu_copy_link", @"Copy URL");
            break;
        case ISWebBrowserCellTypeQRCode :
            title = NSLocalizedString(@"QRCode", @"二维码");
            break;
        case ISWebBrowserCellTypeSMS:
            title = NSLocalizedString(@"Share with SMS", @"短信");
        default :
            break;
    }
    return title;
}

- (NSString *)accessibilityLabel
{
    return [self titleOfType:self.type] ? : self.titleLabel.text ;
}
@end
