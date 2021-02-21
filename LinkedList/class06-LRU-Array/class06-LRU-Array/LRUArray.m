//
//  LRUArray.m
//  LRU-Array
//
//  Created by 杜正妮 on 2021/2/19.
//

#import "LRUArray.h"

@interface LRUArray ()
@property(nonatomic) NSInteger maxCount;
@end
@implementation LRUArray
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.cacheList = [@[] mutableCopy];
        self.maxCount = 1000;
        [self loadData];
    }
    return self;
}

-(instancetype)initWithCacheCount:(NSInteger)count
{
    self = [super init];
    if (self) {
        self.cacheList = [@[] mutableCopy];
        self.maxCount = count;
        [self loadData];
    }
    return self;
}

-(void)dealloc
{
    [self saveData];
}

-(void)cacheData:(id)data
{
    ///检测缓存中是否存在 O(n)
    if ([self.cacheList containsObject:data]) {
        // 存在
        /// 删除数据 O(n)
        [self.cacheList removeObject:data];
        /// 放置在最后一位  最好O(1)，最差需要扩充时 O(n)
//        [self.cacheList addObject:data];
    }else{
        /// 是否缓存满
        if (self.cacheList.count > self.maxCount) {
            /// 库滿淘汰第一位，LRU
            [self.cacheList removeObjectAtIndex:0];
            /// 放置在最后一位
//            [self.cacheList addObject:data];
        }else{
            ///未满
            /// 放置在最后一位
//            [self.cacheList addObject:data];
        }
    }
    [self.cacheList addObject:data];
}

-(void)loadData
{
    /// 启动加载缓存
}

-(void)saveData
{
    /// 注销时保存缓存
}
@end
