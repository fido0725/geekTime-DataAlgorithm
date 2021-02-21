//
//  LRUArray.h
//  LRU-Array
//
//  Created by 杜正妮 on 2021/2/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRUArray : NSObject

@property (nonatomic,strong) NSMutableArray *cacheList;
-(instancetype)initWithCacheCount:(NSInteger)count;
@end

NS_ASSUME_NONNULL_END
