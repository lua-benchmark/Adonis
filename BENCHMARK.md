# Adonis - Lua SAST benchmark snapshot

Frozen snapshot of an upstream project, republished for Lua static-analysis benchmarking.
**This is not a fork for contribution.** File issues and pull requests upstream.

## Provenance

| | |
|---|---|
| Upstream | <https://github.com/Epix-Incorporated/Adonis> |
| Branch | `master` |
| Commit | `b05c62279f4555f20d96b75dd8fee8d03fc2649d` |
| Snapshot taken | 2026-09-18 |
| Upstream stars at snapshot | 494 |
| Deliberately vulnerable (GOAT) | No |

The tree is byte-identical to upstream at that commit, with two exceptions: the `.git` directory
was removed and replaced by a single `initial version` commit, and this `BENCHMARK.md` was added.
No upstream file was modified, so every line number still matches upstream.

## Corpus metadata

**Project type:** Roblox/Luau game administration and moderation system (server MainModule + client UI)

**Lua version:** Luau (Roblox engine)

**Frameworks and libraries:** Roblox/Luau engine APIs (RemoteEvent/RemoteFunction, DataStoreService, HttpService, MessagingService), Roact, Flipper, Sift, Maid, GoodSignal, t typechecker, HashLib, FiOne Lua VM, MockDataStoreService, Rojo/selene

**Size class:** Large (~72821 LOC)

## Taint sources of interest

Roblox client-to-server remote (RemoteEvent.OnServerEvent / RemoteFunction.OnServerInvoke params into Process.Remote(p, cliData, com, ...)), Player chat commands (Player.Chatted, TextChatService callbacks), DataStore reads (Core.GetData over DataStore:GetAsync), Outbound HTTP client response (HttpService RequestAsync/GetAsync/PostAsync - Trello API, IPInfo), MessagingService cross-server payloads (SubscribeAsync); sinks include Core.Loadstring/FiOne and Remote.LoadCode
