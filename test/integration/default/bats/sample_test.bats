#!/usr/bin/env bats

# this is just a dummy test for the skeleton
@test "find bash is found in PATH" {
  run which bash
  [ "$status" -eq 0 ]
}
