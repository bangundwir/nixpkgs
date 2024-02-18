## This Repository based on live streaming  

### Command

#### Show information about this flake

```bash
nix flake show github:bangundwir/nixpkgs
```

#### Using nix shell remotely

```bash
# nix develop github:bangundwir/nixpkgs#<NAME>
nix develop github:rbangundwir/nixpkgs#python
```

#### Update lock file

```bash
# nix flake lock --update-input <INPUTNAME>
nix flake lock --update-input nixpkgs 
```
