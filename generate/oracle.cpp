// glue code for Isabelle's introsort

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

#ifndef NO_LLVM
extern "C" {
  #include "introsort.h"
}
#endif

using namespace std;
namespace bsort = boost::sort;
namespace bsc = boost::sort::common;

using bsc::time_point;
using bsc::now;
using bsc::subtract_time;
using bsc::fill_vector_uint64;
using bsc::write_file_uint64;
  

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
  introsort(A.data (), 0, A.size());

  // output the sorted array
  for (auto i=A.begin();i!=A.end();++i) {
    std::cout << *i << endl;
  }

  return 0;
}












