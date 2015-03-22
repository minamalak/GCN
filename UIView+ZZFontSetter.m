/*
 * Copyright (c) Sevencrayons.com <iutinvg@gmail.com>
 * License: http://www.opensource.org/licenses/mit-license.html
 */

#import "UIView+ZZFontSetter.h"

@implementation UIView (ZZFontSetter)

- (void)setAllFonts:(UIFont*)regular bold:(UIFont*)bold
{
	BOOL skip = self.tag > 100;
    skip  = skip || ([NSStringFromClass(self.class) isEqualToString:@"UIToolbarTextButton"]);
//    NSLog(@"%@",self.class);
    if (skip) {
        return;
    }
    if ([self respondsToSelector:@selector(setFont:)] && !skip) {
        UIFont *oldFont = [self valueForKey:@"font"];
        
        UIFont *newFont;
        // for iOS6
        NSRange isBold = [[oldFont fontName] rangeOfString:@"Bold" options:NSCaseInsensitiveSearch];
        // for iOS7
        NSRange isMedium = [[oldFont fontName] rangeOfString:@"MediumP4" options:NSCaseInsensitiveSearch];
        if (isBold.location==NSNotFound && isMedium.location==NSNotFound) {
            newFont = [regular fontWithSize:oldFont.pointSize];
        } else {
            newFont = [bold fontWithSize:oldFont.pointSize];
        }
        
        // TODO: there are italic fonts also though
        
		float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
		if (sysVer < 7.0) {
			
			if ([self isKindOfClass:[UILabel class]]) {
				UILabel *lbl = (UILabel *)self;
				NSString *title = lbl.text;
				
				if (title) {
					NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName:newFont}];
					[lbl setAttributedText:str];
				}
				
				
			}
			else if ([self isKindOfClass:[UIButton class]])
			{
				UIButton *btn = (UIButton *)self;
				NSString *title = [btn titleForState:UIControlStateNormal];
				if (title) {
					NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:newFont forKey:NSFontAttributeName];
					[dict setObject:[btn titleColorForState:UIControlStateNormal] forKey:NSForegroundColorAttributeName];
					NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title attributes:dict];
					[btn setAttributedTitle:str forState:UIControlStateNormal];
				}
			}
			
//			[self performSelector:@selector(setFont:) withObject:newFont];
		}else
		{
			[self setValue:newFont forKey:@"font"];
			
			
		}
		
		
    }
    
    for (UIView *subview in self.subviews) {
        [subview setAllFonts:regular bold:bold];
    }
}

@end
