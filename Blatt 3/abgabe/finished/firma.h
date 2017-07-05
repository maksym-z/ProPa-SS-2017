uint64_t gewinn (const int64_t *const d, const size_t n) {
  // Implementieren Sie diese Funktion
  int64_t i, current_max, max_ending_here;
  
  const int64_t *ptr;
  ptr = d;
  current_max = 0;
  max_ending_here = 0;
  
  for(i = 0; i < (int64_t)n; i++) {
    max_ending_here += *ptr;
    if (max_ending_here < 0) {
      max_ending_here = 0;
    }
    if (current_max < max_ending_here) {
      current_max = max_ending_here;
    }
    ptr++;
  }
  return current_max;
}
