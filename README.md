## Introduction
Portage overlay of [6-6-6](https://github.com/6-6-6).

## Projects That Inanna Contains
```
dev-python/cupy
dev-utils/cmake # patch for https://bugs.gentoo.org/733480
game-rhythm/osu
media-tv/jellyfin
net-misc/ndppd:1 # dev-branch of ndppd
net-vpn/rait
```

## NOTE
The cmd `dotnet build` that `game-rhythm/osu` will execute in `src_compile()`
phase needs network access. An approach to solve it is to pre-fetch the
resources, like what `eclass/go-modules.eclass` will do.

Although it violates the policy of portage, to emerge `game-rhythm/osu::Inanna`,
you need
```
echo FEATURES="${FEATURES} -network-sandbox" > \
	"$(portageq envvar EPREFIX)"/etc/portage/env/unlock-network
echo 'game-rhythm/osu unlock-network' >> /etc/portage/package.env
```
