require 'json'
require 'rest-client'
require 'digest/sha3'
require 'pstore'
require_relative "utils"
require_relative "EtherscanAPI"


api_key = File.file?('api.key') ? File.open('api.key').read : ''

puts "api_key : " + api_key

sl = sl = SimpleLog.new({:verbose => true})
sl.p "\n\n----------{ running #{$0} - #{Time.now.utc} }----------\n\n"

e = EtherscanAPI.new(api_key, sl, {:print_query => true})

############################################################################### 
#
# Block number and ETH price in USD
#

res = e.get_eth_blockNumber()
sl.p 'Block number: ' + res.inspect

res = e.get_ethusd()
sl.p 'ETH/USD: ' + res.inspect