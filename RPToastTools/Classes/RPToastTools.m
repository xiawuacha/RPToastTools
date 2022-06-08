//
//  RPToastTools.m
//  Pods-RPBase_Example
//
//  Created by topoto on 2021/5/20.
//

#import "RPToastTools.h"


@interface RPToastToolsConfigModel : NSObject
@property (nonatomic,strong)UIImageView *mainCustomView;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,assign)SEL sel;
@end


@implementation RPToastToolsConfigModel
@end



@interface RPToastToolsConfig:NSObject

/// 显示文案文字颜色
@property (nonatomic,strong)UIColor *detialTitleColor;

/// hud颜色
@property (nonatomic,strong)UIColor *contentColor;

/// 加载
@property (nonatomic,strong)RPToastToolsConfigModel *mainCustomLoadingModel;

/// 成功
@property (nonatomic,strong)RPToastToolsConfigModel *mainCustomSuccessedModel;

/// 失败
@property (nonatomic,strong)RPToastToolsConfigModel *mainCustomFailedModel;

/// 警告
@property (nonatomic,strong)RPToastToolsConfigModel *mainCustomWarningModel;

/// 显示文案文字大小
@property (nonatomic,strong)UIFont *detialTitlelfont;

/// loadingj文字
@property (nonatomic,copy)NSString *loadingTitle;

@end

@implementation RPToastToolsConfig
+ (instancetype)shareConfig
{
    static RPToastToolsConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc] init];
    });
    return config;
}



@end


@interface RPToastTools ()
/// 父视图
@property (nonatomic,strong) UIView *RP_inShowView;

/// 是否动画
@property (nonatomic,assign) BOOL animated;

/// 自定义视图
@property (nonatomic,strong) UIView *RP_customView;

/// 自定义图片
@property (nonatomic,strong) UIImage *RP_imageName;

/// 自定义图片组
@property (nonatomic,copy)   NSArray <UIImage *>*RP_iamgNameArr;

/// 文案
@property (nonatomic,strong) NSString *RP_message;

/// 显示时间
@property (nonatomic,assign) NSTimeInterval RP_afterDelay;

/// HUD的类型
@property (nonatomic,assign) MBProgressHUDMode RP_hudMode;

/// 显示文案文字颜色
@property (nonatomic,strong)UIColor *RP_detialTitleColor;

/// hud颜色
@property (nonatomic,strong)UIColor *RP_contentColor;

/// 显示文案文字大小
@property (nonatomic,strong)UIFont *RP_detialTitlelfont;

@property (nonatomic,assign)CGFloat RP_progress;

@property (nonatomic,assign)BOOL mainCustomFlag;

@property (nonatomic,assign)SEL bindShowCustomViewAction;
@end

@implementation RPToastTools


+ (MBProgressHUD *)showTextHUDWithText:(NSString *)text
{
    return [self showRPHUD:^(RPToastTools * _Nonnull customTool) {
            customTool.RP_message = text;
    }];
}
+ (MBProgressHUD *)showTextHUDWithText:(NSString *)text inView:(UIView *)view
{
    return [self showRPHUD:^(RPToastTools * _Nonnull customTool) {
            customTool.RP_message = text;
            customTool.RP_inShowView = view;
    }];
}


+ (MBProgressHUD *)showActivityLoadingHUDWithText:(nullable NSString *)loadingText
{
    
    return [self showRPHUD:^(RPToastTools *tool) {
            tool.RP_message = loadingText;
            tool.RP_hudMode = MBProgressHUDModeIndeterminate;
//            tool.rp_bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//            tool.rp_bezelView.color = tool.RP_contentColor;
    }];
   
}
+ (MBProgressHUD *)showActivityLoadingHUDWithText:(nullable NSString *)loadingText inView:(UIView *)view
{
    return [self showRPHUD:^(RPToastTools *tool) {
            tool.RP_message = loadingText;
            tool.RP_hudMode = MBProgressHUDModeIndeterminate;
            tool.RP_inShowView = view;
    }];
}
+ (MBProgressHUD *)showMainCustomLoadingHUD
{
    return [self showRPHUD:^(RPToastTools *tool) {
            [self initMainCustomTools:tool inView:nil model:[RPToastToolsConfig shareConfig].mainCustomLoadingModel];
            tool.RP_afterDelay = 0;
    }];
}
+ (MBProgressHUD *)showMainCustomLoadingHUDInView:(UIView *)view
{
   return [self showRPHUD:^(RPToastTools *tool) {
            [self initMainCustomTools:tool inView:view model:[RPToastToolsConfig shareConfig].mainCustomLoadingModel];
            tool.RP_afterDelay = 0;
           
            
    }];
}

+ (MBProgressHUD *)showMainSuccessedHUDWithText:(NSString *)text
{
    return [self showRPHUD:^(RPToastTools *tool) {
            
            [self initMainCustomTools:tool inView:nil model:[RPToastToolsConfig shareConfig].mainCustomSuccessedModel];
            tool.RP_message = text;
           
    }];
}
+ (MBProgressHUD *)showMainSuccessedHUDWithtext:(NSString *)text inView:(UIView *)view
{
    return [self showRPHUD:^(RPToastTools *tool) {
            
            [self initMainCustomTools:tool inView:view model:[RPToastToolsConfig shareConfig].mainCustomSuccessedModel];
            
            tool.RP_message = text;
    }];
}
+ (MBProgressHUD *)showMainFailedHUDWithText:(NSString *)text
{
    return [self showRPHUD:^(RPToastTools *tool) {
            
            [self initMainCustomTools:tool inView:nil model:[RPToastToolsConfig shareConfig].mainCustomFailedModel];
            tool.RP_message = text;
    }];
}
+ (MBProgressHUD *)showMainFailedHUDWithText:(NSString *)text inView:(UIView *)view
{
    return [self showRPHUD:^(RPToastTools *tool) {
            
            [self initMainCustomTools:tool inView:view model:[RPToastToolsConfig shareConfig].mainCustomFailedModel];
            tool.RP_message = text;
            
    }];
}
+ (MBProgressHUD *)showMainWarningHUDWithText:(NSString *)text
{
    return [self showRPHUD:^(RPToastTools *tool) {
            
           [self initMainCustomTools:tool inView:nil model:[RPToastToolsConfig shareConfig].mainCustomWarningModel];
           tool.RP_message = text;
    }];
}
+ (MBProgressHUD *)showMainWarningHUDWithText:(NSString *)text inView:(UIView *)view
{
    return [self showRPHUD:^(RPToastTools *tool) {
            
            [self initMainCustomTools:tool inView:view model:[RPToastToolsConfig shareConfig].mainCustomWarningModel];
            tool.RP_message = text;
    }];
}
+ (void)initMainCustomTools:(RPToastTools *)tool inView:(UIView *)view model:(RPToastToolsConfigModel *)model
{
    tool.RP_message = model.title;
    tool.RP_hudMode = MBProgressHUDModeCustomView;
    tool.mainCustomFlag = YES;
    tool.RP_customView = model.mainCustomView;
    tool.bindShowCustomViewAction = model.sel;
    if (view) tool.RP_inShowView = view;
}

+ (MBProgressHUD *)showUploadProgressHUDWithProgerssValue:(CGFloat)progressValue progressMode:(MBProgressHUDMode)mode text:(NSString *)text inView:(UIView *)view
{
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
     MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (hud.mode == MBProgressHUDModeDeterminate||hud.mode == MBProgressHUDModeAnnularDeterminate) {
         
    }else {
        hud = [self showRPHUD:^(RPToastTools *tool) {
            tool.RP_hudMode = MBProgressHUDModeDeterminate;
            tool.RP_message = text;
            tool.RP_inShowView = view;
        }];
    }
    hud.progress = progressValue;
    return hud;

}

+ (MBProgressHUD *)showUploadProgressHUDWithProgerssValue:(CGFloat)progressValue inView:(UIView *)view
{
    return [self uploadProgressHUDWithProgerssValue:^(RPToastTools *tool) {
            tool.RP_progress = progressValue;
            tool.RP_inShowView = view;
    }];
}

+ (MBProgressHUD *)uploadProgressHUDWithProgerssValue:(void (^)(RPToastTools *tool))block {
    RPToastTools *tool = [[RPToastTools alloc] init];
    if (block) {
        block(tool);
    }
    __block MBProgressHUD *hud = [MBProgressHUD HUDForView:tool.RP_inShowView];
    hud.progress = tool.RP_progress;
    return hud;
}
+ (MBProgressHUD *)showCustomHUD:(void (^)(RPToastTools *customTool))block
{
    return [self showRPHUD:^(RPToastTools * _Nonnull tool) {
            tool.RP_hudMode = MBProgressHUDModeCustomView;
            block(tool);
    }];
}
+ (MBProgressHUD *)showRPHUD:(void (^)(RPToastTools *tool))block
{
    RPToastTools *tool = [RPToastTools new];
    if (block) block(tool);
    MBProgressHUD *hud = [self configHUDWithToastTool:tool];
    if (tool.RP_hudMode == MBProgressHUDModeCustomView) {
        
        if (tool.mainCustomFlag == YES) {
            
            hud.customView = tool.RP_customView;
            [tool.RP_customView.subviews.firstObject performSelector:tool.bindShowCustomViewAction];
            if (tool.RP_afterDelay>0) {
                [self hideAnimated:NO inView:tool.RP_inShowView afterDelay:tool.RP_afterDelay];
            }
            
            
        }else {
            if (tool.RP_iamgNameArr.count>0) {
                
                UIImageView* mainImageView= [[UIImageView alloc] initWithImage:tool.RP_iamgNameArr.firstObject];
                mainImageView.animationImages = tool.RP_iamgNameArr;
                [mainImageView setAnimationDuration:CGFLOAT_MAX];
                [mainImageView setAnimationRepeatCount:0];
                [mainImageView startAnimating];
                hud.customView = mainImageView;
                
            }
            if (tool.RP_imageName) {
                hud.customView = [[UIImageView alloc] initWithImage:tool.RP_imageName];
            }
            if (tool.RP_customView) {
               UIImageView *bgView = [[UIImageView alloc] initWithImage:[self imageWithColor:[UIColor whiteColor] size:tool.RP_customView.bounds.size]];
                [bgView addSubview:tool.RP_customView];
                hud.customView = bgView;
            }
        }
        
        
    }
    if (tool.RP_hudMode == MBProgressHUDModeText) {
        [self hideAnimated:NO inView:tool.RP_inShowView afterDelay:tool.RP_afterDelay];
    }
    return hud;
}
+ (MBProgressHUD *)configHUDWithToastTool:(RPToastTools *)tool
{
 
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:tool.RP_inShowView animated:tool.animated];
    hud.mode = tool.RP_hudMode;
    hud.detailsLabel.text = tool.RP_message;
    hud.detailsLabel.font = tool.RP_detialTitlelfont;
    hud.detailsLabel.textColor = tool.RP_detialTitleColor;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    
    //设置 圈圈背景为0.8黑色  文字为白色  
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//    hud.bezelView.color = tool.RP_contentColor;
    hud.animationType = MBProgressHUDAnimationFade;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}
+ (void)dissmissHUD
{
    
    [self hideAnimated:NO inView:[UIApplication sharedApplication].keyWindow afterDelay:0];
}

+ (void)dissmissHUDInView:(UIView *)view
{
    [self hideAnimated:NO inView:view afterDelay:0];
}
+ (void)hideAnimated:(BOOL)animated  inView:(UIView *)view afterDelay:(NSTimeInterval)afterDelay
{
    
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    [hud hideAnimated:NO afterDelay:afterDelay];
}

- (RPToastTools *(^)(UIView *))inView{
    return ^RPToastTools *(id obj) {
        self.RP_inShowView =obj;
        return self;
    };
}
- (RPToastTools *(^)(NSString *))message
{
    return ^RPToastTools *(NSString *msg){
        self.RP_message = msg;
        return self;
    };
}
- (RPToastTools *(^)(UIView *))customView{
    return ^RPToastTools *(id obj) {
        self.RP_customView = obj;
        return self;
    };
}

- (RPToastTools *(^)(UIImage *))customImage
{
    return ^RPToastTools *(id obj) {
        self.RP_imageName = obj;
        return self;
    };
}
- (RPToastTools *(^)(NSArray <UIImage *>*))imageIconNameArr
{
    return ^RPToastTools *(id obj){
        self.RP_iamgNameArr = obj;
        return self;
    };
}
-(instancetype)init
{
    if (self == [super init]) {
        
        self.RP_detialTitleColor = [RPToastToolsConfig shareConfig].detialTitleColor;
        self.RP_detialTitlelfont = [RPToastToolsConfig shareConfig].detialTitlelfont;
        self.RP_contentColor = [RPToastToolsConfig shareConfig].contentColor;
        self.RP_inShowView = [UIApplication sharedApplication].keyWindow;
        self.RP_hudMode = MBProgressHUDModeText;
        self.RP_afterDelay = 2;
    }
    return self;
}

+ (UIImage *)RPToastImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (void)configHUDWithDetailsLabelFont:(UIFont *)detailsLabelFont detialLableColor:(UIColor *)detialLableColor hudContentColor:(UIColor *)hudContentColor;
{
    [RPToastToolsConfig shareConfig].detialTitlelfont = detailsLabelFont;
    [RPToastToolsConfig shareConfig].detialTitleColor = detialLableColor;
    [RPToastToolsConfig shareConfig].contentColor = hudContentColor;
    
}
+ (void)configMainCustomLoadingHUDWithCustomView:(UIView *)customView loadingTitle:(NSString *)loadingTitle bindShowHUDAction:(nonnull SEL)sel
{

    [RPToastToolsConfig shareConfig].mainCustomLoadingModel = [self initRPToastToolsConfigModelWithCustomView:customView text:loadingTitle];
    [RPToastToolsConfig shareConfig].mainCustomLoadingModel.sel = sel;
    
}
+ (void)configMainCustomSuccessedHUDWithCustomView:(UIView *)customView
{
    
    [RPToastToolsConfig shareConfig].mainCustomSuccessedModel = [self initRPToastToolsConfigModelWithCustomView:customView text:nil];
}

+ (void)configMainCustomFailedHUDWithCustomView:(UIView *)customView
{
    
    [RPToastToolsConfig shareConfig].mainCustomFailedModel = [self initRPToastToolsConfigModelWithCustomView:customView text:nil];
}

+ (void)configMainCustomWarningHUDWithCustomView:(UIView *)customView
{
    
    [RPToastToolsConfig shareConfig].mainCustomWarningModel = [self initRPToastToolsConfigModelWithCustomView:customView text:nil];
}
+ (RPToastToolsConfigModel *)initRPToastToolsConfigModelWithCustomView:(UIView *)customView text:(NSString *)text
{
    RPToastToolsConfigModel *model = [RPToastToolsConfigModel new];
    if ([customView isKindOfClass:[UIImageView class]]) {
        model.mainCustomView = (UIImageView *)customView;
    }else {
        model.mainCustomView = [[UIImageView alloc] initWithImage:[self imageWithColor:[UIColor clearColor] size:CGSizeMake(customView.bounds.size.width, customView.bounds.size.height)]];;

    }
    model.title = text;
    [model.mainCustomView addSubview:customView];
    return model;
}
@end
