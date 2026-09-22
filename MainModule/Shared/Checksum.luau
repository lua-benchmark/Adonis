--!optimize 2
--!nonstrict
--[[
	Description: MD5 message-digest checksum helper.
		Produces short content fingerprints for bundled assets and cached payloads.
	API:
		Checksum.sum(message)     -> 16-byte binary digest (string)
		Checksum.sumhexa(message) -> 32-character lowercase hexadecimal digest (string)
]]

local band, bor, bxor, bnot = bit32.band, bit32.bor, bit32.bxor, bit32.bnot
local lshift, rshift, lrotate = bit32.lshift, bit32.rshift, bit32.lrotate

local MODULO = 0x100000000

--// Per-round left-rotation amounts
local SHIFTS = {
	7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
	5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20,
	4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
	6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21,
}

--// Additive constants: CONSTANTS[i] = floor(2^32 * abs(sin(i)))
local CONSTANTS = {}
for i = 1, 64 do
	CONSTANTS[i] = math.floor(math.abs(math.sin(i)) * MODULO) % MODULO
end

local function pack32le(word)
	return string.char(
		band(word, 0xff),
		band(rshift(word, 8), 0xff),
		band(rshift(word, 16), 0xff),
		band(rshift(word, 24), 0xff)
	)
end

local function digest(message)
	message = tostring(message)

	local bitLength = #message * 8

	--// Padding: append 0x80, zero-fill to 56 mod 64, then the 64-bit little-endian length
	local padded = message .. string.char(0x80)
	while #padded % 64 ~= 56 do
		padded = padded .. string.char(0)
	end
	padded = padded .. pack32le(bitLength % MODULO) .. pack32le(math.floor(bitLength / MODULO) % MODULO)

	local a0, b0, c0, d0 = 0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476

	for chunk = 1, #padded, 64 do
		local words = {}
		for j = 0, 15 do
			local offset = chunk + j * 4
			words[j] = bor(
				string.byte(padded, offset),
				lshift(string.byte(padded, offset + 1), 8),
				lshift(string.byte(padded, offset + 2), 16),
				lshift(string.byte(padded, offset + 3), 24)
			)
		end

		local a, b, c, d = a0, b0, c0, d0

		for i = 0, 63 do
			local f, g
			if i < 16 then
				f = bor(band(b, c), band(bnot(b), d))
				g = i
			elseif i < 32 then
				f = bor(band(d, b), band(bnot(d), c))
				g = (5 * i + 1) % 16
			elseif i < 48 then
				f = bxor(b, c, d)
				g = (3 * i + 5) % 16
			else
				f = bxor(c, bor(b, bnot(d)))
				g = (7 * i) % 16
			end

			f = (f + a + CONSTANTS[i + 1] + words[g]) % MODULO
			a = d
			d = c
			c = b
			b = (b + lrotate(f, SHIFTS[i + 1])) % MODULO
		end

		a0 = (a0 + a) % MODULO
		b0 = (b0 + b) % MODULO
		c0 = (c0 + c) % MODULO
		d0 = (d0 + d) % MODULO
	end

	return a0, b0, c0, d0
end

local Checksum = {}

--// Raw 16-byte binary digest
function Checksum.sum(message)
	local a0, b0, c0, d0 = digest(message)
	return pack32le(a0) .. pack32le(b0) .. pack32le(c0) .. pack32le(d0)
end

--// 32-character lowercase hexadecimal digest
function Checksum.sumhexa(message)
	local a0, b0, c0, d0 = digest(message)
	return string.format(
		"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
		band(a0, 0xff), band(rshift(a0, 8), 0xff), band(rshift(a0, 16), 0xff), band(rshift(a0, 24), 0xff),
		band(b0, 0xff), band(rshift(b0, 8), 0xff), band(rshift(b0, 16), 0xff), band(rshift(b0, 24), 0xff),
		band(c0, 0xff), band(rshift(c0, 8), 0xff), band(rshift(c0, 16), 0xff), band(rshift(c0, 24), 0xff),
		band(d0, 0xff), band(rshift(d0, 8), 0xff), band(rshift(d0, 16), 0xff), band(rshift(d0, 24), 0xff)
	)
end

return Checksum
