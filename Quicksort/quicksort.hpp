#pragma once

#include "thread_pool.h"

void quicksort(int* nums, int lo, int hi);
void quicksort_concurrent(int threads, int* nums, int lo, int hi);
void quicksort_pool(ThreadPool* pool, int depth, int* nums, int lo, int hi);