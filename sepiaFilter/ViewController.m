//
//  ViewController.m
//  sepiaFilter
//
//  Created by sparkgene on 12/04/22.
//  Copyright (c) 2012年 sparkgene. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>


@interface ViewController ()

@end

@implementation ViewController

@synthesize orgImage = _orgImage;
@synthesize filterImage = _filterImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.orgImage setImage:[UIImage imageNamed:@"ojisan.jpg"]];
    [self.filterImage setImage:[UIImage imageNamed:@"ojisan.jpg"]];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)sliderChange:(id)sender{

    CIImage *inImage = [[CIImage alloc] initWithImage:self.orgImage.image];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" 
                                  keysAndValues: kCIInputImageKey, inImage, 
                                    @"inputIntensity", [NSNumber numberWithFloat:[(UISlider *)sender value]], nil];
    CIImage *outputImage = [filter outputImage];
    
    if( addFilter ){
        CIFilter *filterVignette = [CIFilter filterWithName:@"CIVignette" 
                                              keysAndValues: kCIInputImageKey, outputImage, 
                                    @"inputIntensity", [NSNumber numberWithFloat:1.0],
                                    @"inputRadius", [NSNumber numberWithFloat:2.0],
                                    nil];
        outputImage = [filterVignette outputImage];
        
    }
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    
    [self.filterImage setImage:newImg];
    
    CGImageRelease(cgimg);    
}

- (IBAction)toggleAddFilter:(id)sender
{
	addFilter = [(UISwitch *)sender isOn];
}

@end
