//
//  DisplayMap.m
//  Pacha
//
//  Created by Fabio Mendonça on 13/07/11.
//  Copyright 2011 Vogall. All rights reserved.
//

#import "DisplayMap.h"


@implementation DisplayMap

@synthesize coordinate,image, title,subtitle;

-(void)dealloc{
	[title release];
	[super dealloc];
}

@end
