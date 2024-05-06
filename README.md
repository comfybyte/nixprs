## ❄️📦️ comfypkgs
A collection of homegrown [Nix](https://nixos.org/) packages.

All for `x86_64-linux` and `aarch64-linux`.


### Usage
You can run any package without commiting to installation with:
```
nix run github:comfybyte/comfypkgs#package-name
```

or install imperatively with:
```
nix profile install github:comfybyte/comfypkgs#package-name
```

#### With flakes
Add this repository as an input:
```nix
{
    inputs.comfypkgs.url = "github:comfybyte/comfypkgs";
}
```

and then consume them your way, like:
```nix
{ inputs, system, ... }: {
    environment.systemPackages = [
        inputs.comfypkgs.packages.${system}.package-name
    ];
}
```

### Packages
- `scientifica-nerd-font`: Patched version of [Scientifica](https://github.com/nerdypepper/scientifica) font (.ttf).
- `sshot`: Hackily written screenshot script for wlroots.
