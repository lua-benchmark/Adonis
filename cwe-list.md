# Planted CWE ground truth — Adonis

CWE-94
Example 1
Source:
[Remote.luau:925](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L925)

step 1:
[Remote.luau:927](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L927)

step 2:
[Functions.luau:972](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L972)

step 3:
[Functions.luau:960](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L960)

Sink:
[Functions.luau:964](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L964)

CWE-94
Example 2
Source:
[HeadAdmins.luau:228](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Commands/HeadAdmins.luau#L228)

step 1:
[HeadAdmins.luau:229](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Commands/HeadAdmins.luau#L229)

step 2:
[Process.luau:626](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Process.luau#L626)

Sink:
[Process.luau:643](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Process.luau#L643)

CWE-94
Example 3
Source:
[Remote.luau:935](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L935)

step 1:
[Remote.luau:937](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L937)

step 2:
[Admin.luau:1658](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Admin.luau#L1658)

Sink:
[Admin.luau:1644](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Admin.luau#L1644)

CWE-1333
Example 1
Source:
[Remote.luau:948](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L948)

step 1:
[Admin.luau:1662](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Admin.luau#L1662)

step 2:
[Admin.luau:1674](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Admin.luau#L1674)

Sink:
[Functions.luau:1604](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L1604)

CWE-1333
Example 2
Source:
[Moderators.luau:6702](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Commands/Moderators.luau#L6702)

step 1:
[Moderators.luau:6705](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Commands/Moderators.luau#L6705)

step 2:
[Logs.luau:244](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Logs.luau#L244)

Sink:
[Logs.luau:236](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Logs.luau#L236)

CWE-1333
Example 3
Source:
[Remote.luau:1470](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L1470)

step 1:
[Remote.luau:1474](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L1474)

step 2:
[Functions.luau:1824](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L1824)

Sink:
[Functions.luau:1833](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L1833)

CWE-1333
Example 4
Source:
[Remote.luau:1481](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L1481)

step 1:
[Remote.luau:1483](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L1483)

step 2:
[Functions.luau:1843](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L1843)

Sink:
[Functions.luau:1850](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L1850)

CWE-338
Example 1
Source:
[Functions.luau:1863](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L1863)

step 1:
[Remote.luau:1491](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L1491)

Sink:
[Functions.luau:1890](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Functions.luau#L1890)

Note: engineered host: Roblox/Luau has no OpenResty/luaossl/JWT rock; realized the documented keyed-MAC sink as an HMAC-SHA256 (over bundled HashLib.luau) whose secret is derived from math.random, reached via a new Get-mode Remote.Returnable (SignSessionPayload).

CWE-328
Example 1
Source/Sink:
[Remote.luau:1513](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Remote.luau#L1513)

Note: engineered host: Adonis bundles only strong SHA256, so a pure-Lua MD5 module (MainModule/Shared/Checksum.luau) was added; the MD5 digest content-addresses a client-published theme blob in the PublishSharedTheme Returnable, and a fingerprint match serves attacker content as an already-trusted entry (collision-exploitable). Shared with CWE-328 Example 2.

CWE-328
Example 2
Source/Sink:
[Admin.luau:1724](C:/Users/arita/Documents/DefensePoint/lua_benchmark/Adonis/MainModule/Server/Core/Admin.luau#L1724)

Note: engineered host: reuses the same pure-Lua MD5 module (MainModule/Shared/Checksum.luau) as Example 1; Admin.FileCaseNote content-addresses a moderation case note by MD5 over an attacker-supplied note body (via the :casenote command) and a fingerprint match auto-dismisses review (collision-exploitable).
