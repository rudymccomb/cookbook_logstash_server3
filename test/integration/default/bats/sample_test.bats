#!/usr/bin/env bats

# this is just a dummy test for the logstash_server3_rm
@test "find bash is found in PATH" {
  run which bash
  [ "$status" -eq 0 ]
}
