//
//  ScaryBug.m
//  ScaryBugs
//
//  Created by Main Account on 10/31/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "ScaryBug.h"

@implementation ScaryBug

- (id)initWithName:(NSString *)name image:(UIImage *)image howScary:(float)howScary {
    if ((self = [super init])) {
        _name = name;
        _image = image;
        _howScary = howScary;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    NSData *data = UIImagePNGRepresentation(self.image);
    [aCoder encodeObject:data forKey:@"image"];
    [aCoder encodeFloat:self.howScary forKey:@"howScary"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    NSString *name = [aDecoder decodeObjectForKey:@"name"];
    NSData *imageData = [aDecoder decodeObjectForKey:@"image"];
    UIImage * image = [UIImage imageWithData:imageData];
    float howScary = [aDecoder decodeFloatForKey:@"howScary"];
    return [self initWithName:name image:image howScary:howScary];
}

@end