// glue code for boost's pdqsort

#include <algorithm>
#include <iostream>
#include <iomanip>
#include <random>
#include <stdlib.h>
#include <vector>

#include <boost/sort/common/time_measure.hpp>
#include <boost/sort/common/file_vector.hpp>
#include "boost/sort/common/int_array.hpp"

#include <boost/sort/sort.hpp>

using namespace std;
namespace bsort = boost::sort;
namespace bsc = boost::sort::common;

using bsc::time_point;
using bsc::now;
using bsc::subtract_time;
using bsc::fill_vector_uint64;
using bsc::write_file_uint64;
  
// Disable branch-prediction optimization for all iterators, to make it comparable with our impl!
template<class Iter, class Compare>
inline void boost_pdqsort(Iter first, Iter last, Compare comp) {
    if (first == last) return;
    boost::sort::pdqsort_detail::pdqsort_loop<Iter, Compare, false >( first, last, comp, boost::sort::pdqsort_detail::log2(last - first));
}

template<class Iter>
inline void boost_pdqsort(Iter first, Iter last) {
    typedef typename std::iterator_traits<Iter>::value_type T;
    boost_pdqsort(first, last, std::less<T>());
}

int main(int argc, char** argv) {

  if (argc != 2) {
    cout<<"Usage: inputfile"<<endl;
    exit(1);
  }

  string file_name=argv[1];

  // read array from file
  ifstream file;
  file.open(file_name);

  string tp;
  getline(file, tp); // skip comment line

  size_t elems;
  file >> elems;

  std::vector<uint64_t> A;
  A.reserve(elems);

  for(size_t i=0; i<elems; ++i) {
    uint64_t l;
    file >> l;
    A.push_back(l);
  }
  
  // sort
  auto comp = std::less<uint64_t>();
  boost_pdqsort(A.begin (), A.end (), comp);

  // output the sorted array
  for (auto i=A.begin();i!=A.end();++i) {
    std::cout << *i << endl;
  }

  return 0;
}
