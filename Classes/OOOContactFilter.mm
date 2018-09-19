#import "OOOContactFilter.h"

//construct
OOOContactFilter::OOOContactFilter(){
	active = 1;
	//NSLog(@">>> OOOContactFilter <<<");
};

bool OOOContactFilter::ShouldCollide(b2Fixture* fixtureA, b2Fixture* fixtureB)

{
	
	//NSLog(@"shape 1 %p",fixtureA);
	//NSLog(@"shape 2 %p",fixtureB);
	
	//id filter1 = shape1->GetFilterData();
	//id filter2 = shape2->GetFilterData();

	//if (filter1.groupIndex == filter2.groupIndex && filter1.groupIndex != 0){
	//	return filter1.groupIndex > 0;
	//}
	//bool collide = (filter1.maskBits & filter2.categoryBits) != 0 &&
	//(filter1.categoryBits & filter2.maskBits) != 0;
	
	return 1;
	
}
