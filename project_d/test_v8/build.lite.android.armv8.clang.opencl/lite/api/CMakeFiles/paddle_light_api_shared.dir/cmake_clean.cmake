file(REMOVE_RECURSE
  "libpaddle_light_api_shared.pdb"
  "libpaddle_light_api_shared.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/paddle_light_api_shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
