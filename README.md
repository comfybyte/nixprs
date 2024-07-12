# ❄️📦️ nixprs
my [Nix](https://nixos.org/) packages and expressions that don't really fit elsewhere.

## using packages
run a package once with:
```
nix run github:comfybyte/nixprs#package-name
```

or install it imperatively with:
```
nix profile install github:comfybyte/nixprs#package-name
```

### adding package to flake
add this repository as an input:
```nix
{
    inputs.nixprs.url = "github:comfybyte/nixprs";
}
```

and then consume them however you want, like:
```nix
{ inputs, system, ... }: {
    environment.systemPackages = [
        inputs.nixprs.packages.${system}.package-name
    ];
}
```

## enabling binary cache
there's a binary cache hosted by [cachix](https://cachix.org), you can add these lines to enable it in your flake:

```nix
{
    nixConfig = {
        trusted-substituters = [ "https://comfybyte.cachix.org" ];
        trusted-public-keys = [ "comfybyte.cachix.org-1:MDOWRaQIVADC1iluO91OiGrC0gIG+iIe0koTGhYLycg=" ];
    };
}
```
***
