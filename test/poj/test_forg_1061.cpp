#include "gtest.h"
#include "gmock.h"
// using testing;

#include "forg_1061.h"

TEST(forg_1061, match)
{
  EXPECT_EQ(forg_for_match(1, 2, 3, 4, 5), 5);
}

