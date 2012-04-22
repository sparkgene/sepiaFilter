//
//  ViewController.h
//  sepiaFilter
//
//  Created by sparkgene on 12/04/22.
//  Copyright (c) 2012年 sparkgene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *_orgImage;
    IBOutlet UIImageView *_filterImage; 
    
    CIFilter *sepiaFilter;
    BOOL addFilter;
}

@property (nonatomic, retain) UIImageView *orgImage;
@property (nonatomic, retain) UIImageView *filterImage;

- (IBAction)sliderChange:(id)sender;
- (IBAction)toggleAddFilter:(id)sender;

@end
