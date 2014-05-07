//
//  ImageHelper.m
//  CodeSample
//
//  Created by Khoa Le on 5/2/14.
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import "ImageHelper.h"
#import "AppDelegate.h"
#import "Helpers.h"

@implementation ImageHelper

+(NSManagedObjectContext *) getContext{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    return  context;
}

+(UIImage *) getImageWithUrl:(NSString *) url{
    UIImage *image;
    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Image" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"url == %@", url];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects > 0 ) {
        NSManagedObject *info = fetchedObjects[0];
        image = [UIImage imageWithData:[info valueForKey:@"data"]];
        return image;
    }else return NULL;
    
}

+(void) saveNewImage:(MyImage *) image withData:(NSData *) img{
    NSManagedObjectContext *context = [self getContext];
    NSManagedObject *imageObject = [NSEntityDescription insertNewObjectForEntityForName:@"Image"
                                                                 inManagedObjectContext:context];
    [imageObject setValue:image.url  forKey:@"url"];
    [imageObject setValue:image.id_string forKeyPath:@"id"];
    [imageObject setValue:img forKeyPath:@"data"];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Error %@", [error localizedDescription]);
    }


}
+(void) updateExistingImage:(MyImage *) image withData:(NSData *) img{
    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Image" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"url == %@", image.url];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSManagedObject *info = fetchedObjects[0];
    [info setValue:img forKeyPath:@"data"];
    if (![context save:&error]) {
        NSLog(@"Error %@", [error localizedDescription]);
    }

}
+(void) updateDatabaseWithImage:(MyImage *) image{
    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Image" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"url == %@", image.url];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count]>0) {
        NSManagedObject *info = fetchedObjects[0];
        [info setValue:image.url forKeyPath:@"url"];
    }else{
        NSManagedObject *imageObject = [NSEntityDescription insertNewObjectForEntityForName:@"Image"
                                                                     inManagedObjectContext:context];
        [imageObject setValue:image.url  forKey:@"url"];
        [imageObject setValue:image.id_string forKeyPath:@"id"];
    }
    if (![context save:&error]) {
        NSLog(@"Error %@", [error localizedDescription]);
    }


    
}

@end
