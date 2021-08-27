#include "benchmark/benchmark.h"
#include "sum.h"

static void BM_Sum(benchmark::State &state) {
  // Perform setup here
  for (auto _ : state) {
    // This code gets timed
    Sum(1, 2);
  }
}

BENCHMARK(BM_Sum);
