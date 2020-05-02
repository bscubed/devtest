# devtest

This tool helps manage, test, and update multiple AUR packages in a project-like structure. All packages are built in a completely clean chroot environment to test for errors and missing dependencies.

If configured, this tool can also upload PKGBUILD changes to the AUR automatically after a successful build.

If you're the maintainer of multiple AUR packages, devtest makes it easy to make sure all of your packages are working fine with just one simple command.

## Installation

Install via the [AUR](https://aur.archlinux.org/packages/devtest/).

## Usage

    Usage: devtest [options]
    Usage: devtest [options] <package(s)>
  
    Options:
      -h, --help      Displays usage information
      -v, --version   Displays devtest version
      -V, --verbose   Runs in verbose output mode for debugging purposes
      -u, --upload    Upload package(s) to the AUR
      -i, --install   Install package(s) after a successful build
      -c, --clean     Clean build directories after successful build
      -R, --rebuild   Rebuild chroot system and exit

#### Testing
To test a package, simply issue the command `devtest <package(s)>` and devtest will automatically download the PKGBUILD from the AUR and attempt to build it in a clean Arch chroot.

#### Default packages
If you have many packages you test frequently, you can add them to the config file (located by default at `~/.config/devtest/config`)

Running `devtest` without specifying any packages will build all packages saved in the config file.

#### Installing built packages
To install a package after it's built, use `devtest -i <package(s)>`

#### Updating PKGBUILD
If you're an AUR maintainer, it might be useful to upload package changes to the AUR after a successful build. You can do so with `devtest -u <package(s)>`.

NOTE: Correct SSH keys must be configured on your system and stored in the package maintainer's AUR account. See [here](https://wiki.archlinux.org/index.php/AUR_submission_guidelines#Authentication) for details.

#### Option chaining
Options can be chained together to make long commands easier to manage. For example, all of the following commands are valid syntax:

    devtest -Vui <package(s)>
    devtest <package(s)> -u --clean -iV
    devtest -install --clean -u
    devtest -i <package(s) --verbose
    
## Configuration

Default behavior can be tweaked to suit your needs by editing the config file (located by default at `~/.config/devtest/config`)

- `PACKAGES` - List of packages to build when no packages specified
- `PACKAGE_DIR` - Directory where PKGBUILDs are stored and built
- `OUTPUT_DIR` - Directory where built packages are stored
- `CHROOT_DIR` - Directory where the Arch chroot is created
- `CUSTOM_PACMAN_CONF` - pacman configuration file to be used by the Arch chroot
- `CUSTOM_MAKEPKG_CONF` - makepkg configuration file to be used by the Arch chroot
- `CCACHE_ENABLED` - Enable ccache (required ccache to be installed)
- `CCACHE_DIRECTORY` - Directory where build cache is stored if ccache is enabled
- `CLEAN` - Whether or not to clean build directories after successful builds
- `ASK_TO_UPLOAD` - Enables an upload prompt with the option to write a commit message after a successful build
- `ASK_TO_INSTALL` - Enables an installation prompt after a successful build
- `EXIT_ON_FAILURE` - If true, no other packages will be built after a build failure occurs
