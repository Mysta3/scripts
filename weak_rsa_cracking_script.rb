# frozen_string_literal: true
## inspired by an RSA practice challenge

## use able with smaller primes.

# Must require openssl package to use the BN_mod_inverse method
require 'openssl'

e = OpenSSL::BN.new('43') ## must convert the number to a BN object
p = 13 # info given
q = 83 # info given
n = p * q # find n

## store encyrpted message in an array
c = [
  996,
  894,
  379,
  631,
  894,
  82,
  379,
  852,
  631,
  677,
  677,
  194,
  893
]

## initialize an array object for the decrypted message
decrypted_message = []

## calculate the phi - this equation was give
phi = (p - 1) * (q - 1)

## must convert the phi to a BN object
## phi is used to find the private key 
phi = OpenSSL::BN.new(phi.to_s)

## find the other half of the private key
d = e.mod_inverse(phi).to_i

# loop through using the private key to decrypt the message
c.each do |i|
  m = i.pow(d, n)

  ## push to array
  ## guard against invalid ASCII characters
  decrypted_message.push(m.chr) if m < 256
end

## print encrypted message.
print decrypted_message.join('')

