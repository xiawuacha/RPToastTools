//
//  RPToastTools.h
//  Pods-RPBase_Example
//
//  Created by topoto on 2021/5/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
NS_ASSUME_NONNULL_BEGIN

@interface RPToastTools : NSObject
/// 配置全局文字显示样式
/// @param detailsLabelFont 字体大小
/// @param detialLableColor 字体颜色
/// @param hudContentColor hud背景色
+ (void)configHUDWithDetailsLabelFont:(UIFont *)detailsLabelFont detialLableColor:(UIColor *)detialLableColor hudContentColor:(UIColor *)hudContentColor;


/// 配置全局自定义加载框
/// @param customView 自定义视图
/// @param loadingTitle 文案
+ (void)configMainCustomLoadingHUDWithCustomView:(UIView *)customView loadingTitle:(NSString *)loadingTitle bindShowHUDAction:(SEL)sel;

/// 配置全局自定义成功框
/// @param customView 自定义视图
+ (void)configMainCustomSuccessedHUDWithCustomView:(UIView *)customView;


/// 配置全局自定义失败框
/// @param customView 自定义视图
+ (void)configMainCustomFailedHUDWithCustomView:(UIView *)customView;

/// 配置全局自定义警告框
/// @param customView 自定义视图
+ (void)configMainCustomWarningHUDWithCustomView:(UIView *)customView;



/// 显示纯文本HUD
/// @param text 文案
+ (MBProgressHUD *)showTextHUDWithText:(nullable NSString *)text;

/// 显示纯文本HUD
/// @param text 文案
/// @param view inView
+ (MBProgressHUD *)showTextHUDWithText:(nullable NSString *)text inView:(UIView *)view;





/// 显示菊花loadingHUD
/// @param loadingText 文案
+ (MBProgressHUD *)showActivityLoadingHUDWithText:(nullable NSString *)loadingText;

/// 显示菊花loadingHUD
/// @param loadingText 文案
/// @param view inView
+ (MBProgressHUD *)showActivityLoadingHUDWithText:(nullable NSString *)loadingText inView:(UIView *)view;




/// 显示全局配置加载框（configMainCustomLoadingHUDWithCustomView 进行配置全局）
+ (MBProgressHUD *)showMainCustomLoadingHUD;

/// 显示全局配置加载框（configMainCustomLoadingHUDWithCustomView 进行配置全局）
/// @param view inView
+ (MBProgressHUD *)showMainCustomLoadingHUDInView:(UIView *)view;





/// 显示全局配置成功框（configMainCustomSuccessedHUDWithCustomView 进行配置全局）
/// @param text 文字
+ (MBProgressHUD *)showMainSuccessedHUDWithText:(nullable NSString *)text;

/// 显示全局配置成功框（configMainCustomSuccessedHUDWithCustomView 进行配置全局）
/// @param text 文字
/// @param view inView
+ (MBProgressHUD *)showMainSuccessedHUDWithtext:(nullable NSString *)text inView:(UIView *)view;




/// 显示全局配置失败框（configMainCustomFailedHUDWithCustomView 进行配置全局）
/// @parma text 文字
+ (MBProgressHUD *)showMainFailedHUDWithText:(nullable NSString *)text;
/// 显示全局配置失败框（configMainCustomFailedHUDWithCustomView 进行配置全局）
/// @param text 文字
/// @param view inView
+ (MBProgressHUD *)showMainFailedHUDWithText:(nullable NSString *)text inView:(UIView *)view;





/// 显示全局配置警告框（configMainCustomWarningHUDWithCustomView 进行配置全局）
/// @param text 文字
+ (MBProgressHUD *)showMainWarningHUDWithText:(nullable NSString *)text;

/// 显示全局配置警告框（configMainCustomWarningHUDWithCustomView 进行配置全局）
/// @param text 文字
/// @param view inView
+ (MBProgressHUD *)showMainWarningHUDWithText:(nullable NSString *)text inView:(UIView *)view;




/// 显示自定义CustomVIew
/// @param block 自定义View参数
+ (MBProgressHUD *)showCustomHUD:(void (^)(RPToastTools *customTool))block;



/// 上传hud
/// @param progressValue 进度
+ (MBProgressHUD *)showUploadProgressHUDWithProgerssValue:(CGFloat)progressValue progressMode:(MBProgressHUDMode)mode text:(NSString *)text inView:(UIView *)view;


/// 消失
+ (void)dissmissHUD;


/// 消失
/// @param view inView
+ (void)dissmissHUDInView:(UIView *)view;


/// hud加载父视图
- (RPToastTools *(^)(UIView *))inView;

/// hud文案
- (RPToastTools *(^)(NSString *))message;

/// hud自定义视图
- (RPToastTools *(^)(UIView *))customView;

/// hud自定义图片
- (RPToastTools *(^)(UIImage *))customImage;

/// hud自定义图片组
- (RPToastTools *(^)(NSArray <UIImage *>*))imageIconNameArr;
@end

NS_ASSUME_NONNULL_END
