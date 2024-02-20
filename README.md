## MY NIX HOME

### Command

#### Show information about this flake

```bash
nix flake show
## remotely 
nix flake show github:bangundwir/nixpkgs
```

#### Using nix shell remotely

```bash
nix develop .#bun
# nix develop github:bangundwir/nixpkgs#<NAME>
nix develop github:bangundwir/nixpkgs#python
```

#### Update lock file

```bash
# nix flake lock --update-input <INPUTNAME>
nix flake lock --update-input nixpkgs 
```


## Catatan Home Manager

```bash
home-manager switch --flake .
```

```bash
nix flake update
```
### Multi-user installation (recommended)

Install Nix via the **recommended** [multi-user installation](https://nixos.org/manual/nix/stable/installation/multi-user):

```bash
$ sh <(curl -L https://nixos.org/nix/install) --daemon
```

We recommend the multi-user install if you are on Linux running systemd, with SELinux disabled and you can authenticate with `sudo`.

### Single-user installation

Install Nix via the [single-user installation](https://nixos.org/manual/nix/stable/installation/single-user):

```bash
$ sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

Above command will perform a single-user installation of Nix, meaning that `/nix` is owned by the invoking user. You should run this under your usual user account, not as `root`. The script will invoke `sudo` to create `/nix` if it doesn’t already exist.



## Setting Nix Experimental

Since flakes are an experimental feature, you also need to add the following line to `~/.config/nix/nix.conf`:

```bash
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

## Home-Manager

Tambahkan saluran Home Manager yang sesuai. Jika Anda mengikuti master Nixpkgs atau saluran yang tidak stabil, Anda dapat menjalankan

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

dan jika Anda mengikuti saluran Nixpkgs versi 23.11 Anda dapat menjalankan

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
```

Jalankan perintah instalasi Home Manager dan buat generasi Home Manager pertama:

```bash
nix-shell '<home-manager>' -A install
```

Setelah selesai, Home Manager harus aktif dan tersedia di lingkungan pengguna Anda.

Jika Anda tidak berencana untuk membiarkan Home Manager mengatur konfigurasi shell Anda, maka Anda harus memasukkan sumber

```bash
$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
```

di konfigurasi shell Anda. Atau sumberkan

```bash
/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh
```


