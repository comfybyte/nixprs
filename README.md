# ❄️📦️ nixprs
A collection of homegrown [Nix](https://nixos.org/) packages, helpers and other expressions.

## Packages
You can run any package without commiting to installation with:
```
nix run github:comfybyte/nixprs#package-name
```

or install imperatively with:
```
nix profile install github:comfybyte/nixprs#package-name
```

### With flakes
Add this repository as an input:
```nix
{
    inputs.nixprs.url = "github:comfybyte/nixprs";
}
```

and then consume them your way, like:
```nix
{ inputs, system, ... }: {
    environment.systemPackages = [
        inputs.nixprs.packages.${system}.package-name
    ];
}
```
