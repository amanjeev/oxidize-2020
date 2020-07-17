let
  orig = import <nixpkgs> {};
  src = orig.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "7d0f8355b3e8827e18bed6d608bfb3f1c12b8dc7";
    sha256 = "0asy3cyjm22r4k2n57ky92jvm37mqr3ykd2ik2gnak32488csj88";
  };
  new = import src {};
in
  orig.mkShell {
    buildInputs = [
      orig.libusb1
      orig.pkg-config
      new.nrfutil
      orig.file
      orig.toybox
    ];
    shellHook = ''
              export PATH=~/.cargo/bin:$PATH
    '';
  }
