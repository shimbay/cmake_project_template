#include "sum.h"
#include "gtest/gtest.h"

class SumTest : public ::testing::Test {
 public:
  static void SetUpTestSuite() {}

  static void TearDownTestSuite() {}
};

TEST_F(SumTest, Sum) { ASSERT_EQ(3, Sum(1, 2)); }
