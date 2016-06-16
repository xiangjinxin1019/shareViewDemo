//
//  CCStyleSheet.h
//  CamCard
//
//  Created by Nick Teng on 11/26/13.
//
//

#import <UIKit/UIKit.h>

@interface CCStyleSheet : NSObject

/* Text Font*/
+ (CGFloat)extraLargeTextSize;
+ (CGFloat)largeTextSize;
+ (CGFloat)mediumTextSize;
+ (CGFloat)smallTextSize;
+ (CGFloat)mediumSmallTextSize;
+ (CGFloat)extraSmallTextSize;

/* Text Color */
/**
 *  Use CCUpdatedGray1Color instaed in info1.0
 */
+ (UIColor *)blackTextColor;

/**
 *  Use CCUpdatedGray1Color instaed in info1.0
 */
+ (UIColor *)darkTextColor;

/**
 *  Use CCUpdatedGray2Color instaed in info1.0
 */
+ (UIColor *)lightTextColor;

+ (UIColor *)untraLightTextColor;
+ (UIColor *)grayLightTextColor;
+ (UIColor *)whiteTextColor;
+ (UIColor *)blueTextColor;
+ (UIColor *)redTextColor;
+ (UIColor *)blueHighlightTextColor;
+ (UIColor *)blueDisableTextColor;

+ (UIFont *)semiBoldTextFontWithSize:(CGFloat)fontSize;
+ (UIFont *)regularTextFontWithSize:(CGFloat)fontSize;
+ (UIFont *)italicTextFontWithSize:(CGFloat)fontSize;
+ (UIFont *)lightTextFontWithSize:(CGFloat) fontSize;
+ (UIFont *)titleTextFontWithSize:(CGFloat)fontSize;

+ (UIColor *)navigationBarBackgroundColor;
+ (UIColor *)backgroundColor;

//+ (UIColor *)ccBlueColor;
+ (UIColor *)ccBlueHighlightedColor;
+ (UIColor *)ccBlueDisabledColor;
+ (UIColor *)ccLightBlueDisabledColor;
+ (UIColor *)ccLightBlueColor;
+ (UIColor *)ccBtnBordDisableColor;
+ (UIColor *)ccOrangeColor;
+ (UIColor *)ccOrangeHighlightedColor;
+ (UIColor *)ccOrangeDisableColor;
+ (UIColor *)lightGrayBackgroundColor;
+ (UIColor *)darkGrayBackgroundColor;
+ (UIColor *)tableCellSeletedColor;
+ (UIColor *)headerBorderColor;
+ (UIColor *)notiBarColor;
+ (UIColor *)toolBarBackgroundColor;
+ (UIColor *)ccGreenColor;

+ (UIColor *)ccsDarkBlueColor;

+ (UIColor *)systemDefaultTintColor;

+ (UIColor *)cameraTipBackgroundColor;

+ (UIColor *)onePixelLineColor;
+ (UIColor *)systemOnePixelLineColor;
+ (UIColor *)bigLineColor;

/* Deprecated. Do not use */
+ (UIColor *)lightGrayLineColor;
+ (UIColor *)darkGrayLineColor;

+ (UIImage *)staticImageNamed:(NSString *)name;
+ (UIImage *)blankImage;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIBarButtonItem *)disabledNavigationBarButtonItem;

+ (CGFloat)lineHeight;

+ (UIEdgeInsets) tableViewCellSeparatorLineEdgeInsets;

+ (NSAttributedString *)lineSpacingAttributeStringWithString:(NSString *)string;
+ (NSAttributedString *)lineSpacingAttributeStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace;

/*
  GuideLine 颜色 字体大小，颜色取CCStyleSheet已有的值
*/
+ (UIColor *)ccLightBlue1Color;
+ (UIColor *)ccLightBlue2Color;

+ (UIColor *)ccDarkBlue1Color;
+ (UIColor *)ccDarkBlue2Color;
+ (UIColor *)ccDarkBlue3Color;

+ (UIColor *)ccYellow1Color;

+ (UIColor *)ccRed1Color;
+ (UIColor *)ccRed2Color;

//+ (UIColor *)ccGray1Color;//deprecated in info1.0
+ (UIColor *)ccGray2Color;
+ (UIColor *)ccGray3Color;
+ (UIColor *)ccGray4Color;
+ (UIColor *)ccGray5Color;

//+ (UIColor *)ccWhiteColor;

+ (UIColor *)ccBrown1Color;
+ (UIColor *)ccBrown2Color;
+ (UIColor *)ccBrown3Color;

+ (UIFont *)ccDisplay1Font;
+ (UIFont *)ccDisplay2Font;
+ (UIFont *)ccDisplay3Font;
+ (UIFont *)ccDisplay4Font;
+ (UIFont *)ccdisplay5Font;
+ (UIFont *)ccdisplay6Font;

+ (UIColor *)shadowLineColor;


/*
 GuideLine 颜色 字体大小，Info1.0版本,之前版本会逐步淘汰
 颜色参照：http://192.168.3.253/UI/CC_Project/CC_info_1.0/Visual/Guidline/IOS/Color%20Palette_IOS.png
 字体：http://192.168.3.253/UI/CC_Project/CC_info_1.0/Visual/Guidline/IOS/Text%20Styles_IOS.png
 */
//Info1.0常用颜色

/**
 *  黑色: 212121, Info1.0引入
 */
+ (UIColor *)CCBlackColor;

/**
 *  灰色: 5f5f5f，Info1.0引入
 */
+ (UIColor *)CCUpdatedGray1Color;
/**
 *  灰色: a0a0a0，Info1.0引入
 */
+ (UIColor *)CCUpdatedGray2Color;

/**
 *  灰色: e7e7e7，Info1.0引入
 */
+ (UIColor *)CCUpdatedGray3Color;

/**
 *  灰色: f2f2f2，Info1.0引入
 */
+ (UIColor *)CCUpdatedGray4Color;

/**
 *  灰色: fafafa，Info1.0引入
 */
+ (UIColor *)CCUpdatedGray5Color;

/**
 *  白色: ffffff，沿用老版本
 */
+ (UIColor *)ccWhiteColor;

/**
 *  cc蓝: 18b8f5 (常用的按钮，文字使用的蓝色，Info1.0引入)
 */
+ (UIColor *)ccBlueColor;

//Info1.0不常用颜色
/**
 *  红色: df4d3b，Info1.0引入
 */
+ (UIColor *)CCRedColor;

/**
 *  黄色: f5b910，Info1.0引入
 */
+ (UIColor *)CCYellowColor;

/**
 *  蓝色: 4a8bf5(比cc蓝更深一些的蓝色，部分视图采用该亚瑟作为背景色，Info1.0引入)
 */
+ (UIColor *)CCDarkBlueColor;

/**
 *  绿色: 53a93f，Info1.0引入
 */
+ (UIColor *)CCGreenColor;

/**
 *  橙色: fe8f12，Info1.0引入
 */
+ (UIColor *)CCOrangeColor;

/**
 *  Color (alpha is 1) with hightlighted state
 *
 */
+ (UIColor *)ccStyleHighlightedColor:(UIColor *)color;

/**
 *  Color (alpha is 1) with disabled state
 */
+ (UIColor *)ccStyleDisabledColor:(UIColor *)color;

+ (UIColor *) blueViewBackgroundColor;

+ (void)updateBarButtomItemWhiteStyle:(BOOL)flag;
+ (void) setupNavigationBarColor;
@end