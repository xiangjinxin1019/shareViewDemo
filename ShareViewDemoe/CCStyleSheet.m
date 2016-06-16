//
//  CCStyleSheet.m
//  CamCard
//
//  Created by Nick Teng on 11/26/13.
//
//

#import "CCStyleSheet.h"
#import "global.h"

@implementation CCStyleSheet

+ (CGFloat)extraLargeTextSize
{
    return 20;
}

+ (CGFloat)largeTextSize
{
    return 17;
}

+ (CGFloat)mediumTextSize
{
    return 15;
}

+ (CGFloat)smallTextSize
{
    return 14;
}

+ (CGFloat)mediumSmallTextSize
{
    return 12;
}

+ (CGFloat)extraSmallTextSize
{
    return 10;
}

+ (UIColor *)blackTextColor
{
    return [self CCBlackColor];
}

+ (UIColor *)darkTextColor
{
    //return UIColorFromRGB(0x666666);
    return [self CCUpdatedGray1Color];
}

+ (UIColor *)lightTextColor
{
    //return UIColorFromRGB(0x999999);
    return [self CCUpdatedGray2Color];
}

+ (UIColor *)untraLightTextColor
{
    return UIColorFromRGB(0xcccccc);
}

+ (UIColor *)grayLightTextColor
{
    return UIColorFromRGB(0x8F8E94);
}

+ (UIColor *)whiteTextColor
{
    return UIColorFromRGB(0xffffff);
}

+ (UIColor *)blueTextColor
{
    return UIColorFromRGB(0x18b8f5);   // 0x0099ff
}

+ (UIColor *)blueHighlightTextColor
{
    return [UIColorFromRGB(0x18b8f5) colorWithAlphaComponent:0.6f];
}

+ (UIColor *)blueDisableTextColor
{
    return [UIColorFromRGB(0x18b8f5) colorWithAlphaComponent:0.3f];
}

+ (UIColor *)redTextColor
{
    return UIColorFromRGB(0xff0000);
}

+ (UIFont *)semiBoldTextFontWithSize:(CGFloat)fontSize
{
    return [UIFont boldSystemFontOfSize:fontSize];
}

+ (UIFont *)regularTextFontWithSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)italicTextFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:fontSize];
}

+ (UIFont *) lightTextFontWithSize:(CGFloat) fontSize
{
    return [UIFont fontWithName:@"Helvetica-Light" size:fontSize];
}

+ (UIFont *)titleTextFontWithSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIColor *)navigationBarBackgroundColor
{
    return UIColorFromRGB(0x13334a);
}

+ (UIColor *)backgroundColor;
{
    return UIColorFromRGB(0xffffff);
}

+ (UIColor *)ccBlueHighlightedColor
{
    //return [UIColorFromRGB(0x1b84b2) colorWithAlphaComponent:0.6];
    return [[self ccBlueColor] colorWithAlphaComponent:0.6];
}

+ (UIColor *)ccLightBlueDisabledColor
{
    return UIColorFromRGB(0xa3e3fb);
}

+ (UIColor *)ccBlueDisabledColor
{
    //return [UIColorFromRGB(0x1b84b2) colorWithAlphaComponent:0.2];
    return [[self ccBlueColor] colorWithAlphaComponent:0.3];
}

+ (UIColor *)ccLightBlueColor
{
    return UIColorFromRGB(0x60d4ef);
}

+ (UIColor *)ccBtnBordDisableColor
{
    return UIColorFromRGB(0xb4e3ef);
}

+ (UIColor *)ccOrangeColor
{
    return UIColorFromRGB(0xff9933);
}

+ (UIColor *)ccOrangeHighlightedColor
{
    return [UIColorFromRGB(0xff9933) colorWithAlphaComponent:0.6];
}

+ (UIColor *)ccOrangeDisableColor
{
    return [UIColorFromRGB(0xff9933) colorWithAlphaComponent:0.2];
}

+ (UIColor *)ccsDeepDarkBlueColor
{
    return UIColorFromRGB(0x1d2d3a);
}

+ (UIColor *)ccsDarkBlueColor
{
    return UIColorFromRGB(0x2d4051);
}

+ (UIColor *)ccsSelectionBlueColor
{
    return UIColorFromRGB(0x26a9e1);
}

+ (UIColor *)systemDefaultTintColor
{
    return [UIColor colorWithRed:0 green:122.f / 255.f blue:1 alpha:1];
}

+ (UIColor *)onePixelLineColor
{
    //return UIColorFromRGB(0xd9d9d9);
    return [self CCUpdatedGray3Color];
}

+ (UIColor *) systemOnePixelLineColor
{
    return UIColorFromRGB(0xc8c7cc);
}

+ (UIColor *)bigLineColor
{
    return UIColorFromRGB(0xf0f0f0);
}

+ (UIColor *)lightGrayLineColor
{
    return UIColorFromRGB(0xcccccc);
}

+ (UIColor *)darkGrayLineColor
{
    return UIColorFromRGB(0x999999);
}

+ (UIColor *)lightGrayBackgroundColor
{
    return [CCStyleSheet bigLineColor];
//    return UIColorFromRGB(0xefeff4);
}

+ (UIColor *)cameraTipBackgroundColor
{
    return UIColorFromRGB(0x787f89);
}

+ (UIColor *)darkGrayBackgroundColor
{
    return UIColorFromRGB(0xe6e6e6);
}

+ (UIColor *)tableCellSeletedColor
{
    return UIColorFromRGB(0xf6f6f6);
}

+ (UIColor *)headerBorderColor
{
    return UIColorFromRGB(0xc8c7cc);
}

+ (UIColor *)notiBarColor
{
    return [CCStyleSheet ccBrown3Color];
//    return UIColorFromRGB(0xfff5ae);
}

+ (UIColor *)toolBarBackgroundColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)ccDarkGrayColor
{
    return UIColorFromRGB(0x313131);
}

+ (UIImage *)staticImageNamed:(NSString *)name
{
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)blankImage
{
    return [[UIImage alloc] init];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [color setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIBarButtonItem *)disabledNavigationBarButtonItem
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:NULL];

    return item;
}

+ (CGFloat)lineHeight
{
    return 1.0 / [UIScreen mainScreen].scale;
}

+ (UIEdgeInsets) tableViewCellSeparatorLineEdgeInsets
{
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

+ (NSAttributedString *)lineSpacingAttributeStringWithString:(NSString *)string
{
    if (string.length == 0)
    {
        return nil;
    }

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];

    [paragraphStyle setLineSpacing:5.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];

    return attributedString;
}

+ (NSAttributedString *)lineSpacingAttributeStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace
{
    if (string.length == 0)
    {
        return nil;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    
    return attributedString;
}

+ (UIColor *)ccLightBlue1Color
{
    return [CCStyleSheet blueTextColor];
}

+ (UIColor *)ccLightBlue2Color
{
    return [CCStyleSheet ccLightBlueDisabledColor];
}

+ (UIColor *)ccDarkBlue1Color
{
    return UIColorFromRGB(0x0e2f45);
}

+ (UIColor *)ccDarkBlue2Color
{
    return UIColorFromRGB(0x678FA8);
}

+ (UIColor *)ccDarkBlue3Color
{
    return UIColorFromRGB(0x011D2D);
}

+ (UIColor *)ccYellow1Color
{
    return UIColorFromRGB(0xFACA3B);
}

+ (UIColor *)ccRed1Color
{
    return UIColorFromRGB(0xEE696E);
}

+ (UIColor *)ccRed2Color
{
    return UIColorFromRGB(0xE54F55);
}

+ (UIColor *)ccGreenColor
{
    return UIColorFromRGB(0x34CF82);
}

+ (UIColor *)ccBrown1Color
{
    return UIColorFromRGB(0xc69267);
}

+ (UIColor *)ccBrown2Color
{
    return UIColorFromRGB(0xe8c5a0);
}

+ (UIColor *)ccBrown3Color
{
    return UIColorFromRGB(0xFFF5E1);
}

//deprecated in info1.0
//+ (UIColor *)ccGray1Color
//{
//    return [CCStyleSheet blackTextColor];
//}

+ (UIColor *)ccGray2Color
{
    return UIColorFromRGB(0x707070);
}

+ (UIColor *)ccGray3Color
{
    return [CCStyleSheet lightTextColor];
}

+ (UIColor *)ccGray4Color
{
    return [CCStyleSheet onePixelLineColor];
}

+ (UIColor *)ccGray5Color
{
    return [CCStyleSheet bigLineColor];
}

+ (UIColor *)ccWhiteColor
{
    return [CCStyleSheet whiteTextColor];
}

+ (UIFont *)ccDisplay1Font
{
    return [CCStyleSheet semiBoldTextFontWithSize:17];
}

+ (UIFont *)ccDisplay2Font
{
    return [CCStyleSheet regularTextFontWithSize:15];
}

+ (UIFont *)ccDisplay3Font
{
    return [CCStyleSheet regularTextFontWithSize:14];
}

+ (UIFont *)ccDisplay4Font
{
    return [CCStyleSheet regularTextFontWithSize:13];
}

+ (UIFont *)ccdisplay5Font
{
    return [CCStyleSheet regularTextFontWithSize:11];
}

+ (UIFont *)ccdisplay6Font
{
    return [CCStyleSheet regularTextFontWithSize:10];
}

+ (UIColor *)shadowLineColor
{
    return UIColorFromRGB(0xe4e4e4);
}

#pragma mark -- Info 1.0 GuideLine Color & Font
//Info1.0常用颜色
+ (UIColor *)CCBlackColor
{
    return UIColorFromRGB(0x212121);
}

+ (UIColor *)CCUpdatedGray1Color
{
    return UIColorFromRGB(0x5f5f5f);
}

+ (UIColor *)CCUpdatedGray2Color
{
    return UIColorFromRGB(0xa0a0a0);
}

+ (UIColor *)CCUpdatedGray3Color
{
    return UIColorFromRGB(0xe7e7e7);
}

+ (UIColor *)CCUpdatedGray4Color
{
    return UIColorFromRGB(0xf2f2f2);
}

+ (UIColor *)CCUpdatedGray5Color
{
    return UIColorFromRGB(0xfafafa);
}

+ (UIColor *)ccBlueColor
{
    return UIColorFromRGB(0x18b8f5);
}

+ (UIColor *)CCRedColor
{
    return UIColorFromRGB(0xdf4d3b);
}

+ (UIColor *)CCYellowColor
{
    return UIColorFromRGB(0xf5b910);
}

+ (UIColor *)CCDarkBlueColor
{
    return UIColorFromRGB(0x4a8bf5);
}

+ (UIColor *)CCGreenColor
{
    return UIColorFromRGB(0x53a93f);
}

+ (UIColor *)CCOrangeColor
{
    return UIColorFromRGB(0xfe8f12);
}

+ (UIColor *)ccStyleHighlightedColor:(UIColor *)color
{
    return [color colorWithAlphaComponent:0.6];
}

+ (UIColor *)ccStyleDisabledColor:(UIColor *)color
{
    return [color colorWithAlphaComponent:0.3];
}

+ (UIColor *) blueViewBackgroundColor
{
    return UIColorFromRGB(0xF3FBFE);
}

+ (void)updateBarButtomItemWhiteStyle:(BOOL)flag
{
    if (flag)
    {
        NSDictionary *titleTextAttribute = @{ NSFontAttributeName: [CCStyleSheet lightTextFontWithSize:15], NSForegroundColorAttributeName: [CCStyleSheet ccWhiteColor]};
        [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:titleTextAttribute forState:UIControlStateNormal];
    }
    else
    {
        NSDictionary *titleTextAttribute = @{ NSFontAttributeName: [CCStyleSheet lightTextFontWithSize:15], NSForegroundColorAttributeName: [CCStyleSheet CCBlackColor]};
        [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:titleTextAttribute forState:UIControlStateNormal];
    }
}

+ (void) setupNavigationBarColor
{
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowOffset = CGSizeZero;
    
    [[UINavigationBar appearance] setShadowImage:[CCStyleSheet imageWithColor:[CCStyleSheet CCUpdatedGray3Color] size:CGSizeMake(100, 0.5)]];
    [[UINavigationBar appearance] setBackgroundImage:[CCStyleSheet imageWithColor:[UIColor whiteColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 64) ] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:UIColorFromRGB(0x5F5F5F)];
    UIImage *backButtonBackgroundImage = [UIImage imageNamed:@"back"];
    [[UINavigationBar appearance] setBackIndicatorImage:backButtonBackgroundImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backButtonBackgroundImage];
    
    NSDictionary *titleTextAttribute = @{ NSFontAttributeName: [CCStyleSheet lightTextFontWithSize:15], NSForegroundColorAttributeName: UIColorFromRGB(0x212121), NSShadowAttributeName: shadow };
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:titleTextAttribute forState:UIControlStateNormal];
    
    titleTextAttribute = @{ NSFontAttributeName: [CCStyleSheet lightTextFontWithSize:15], NSForegroundColorAttributeName: UIColorFromRGBA(0x212121, 0.6), NSShadowAttributeName:shadow };
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:titleTextAttribute forState:UIControlStateHighlighted];
    
    titleTextAttribute = @{ NSFontAttributeName: [CCStyleSheet lightTextFontWithSize:15], NSForegroundColorAttributeName: UIColorFromRGBA(0x212121, 0.2), NSShadowAttributeName:shadow };
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:titleTextAttribute forState:UIControlStateDisabled];
    
    titleTextAttribute = @{ NSFontAttributeName: [CCStyleSheet regularTextFontWithSize:[CCStyleSheet largeTextSize]], NSForegroundColorAttributeName: UIColorFromRGB(0x212121), NSShadowAttributeName: shadow };
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttribute];
}

@end
