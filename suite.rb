#!/usr/bin/env ruby

require_relative 'proof_init'

files = Dir.glob("lib/settings/*_proof.rb")

result = Proof::Suite.run(files)

exit result == :success

