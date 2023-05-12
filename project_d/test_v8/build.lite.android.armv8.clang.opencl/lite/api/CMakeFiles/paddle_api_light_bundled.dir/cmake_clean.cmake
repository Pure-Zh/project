file(REMOVE_RECURSE
  "libpaddle_api_light_bundled.pdb"
  "libpaddle_api_light_bundled.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/paddle_api_light_bundled.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
