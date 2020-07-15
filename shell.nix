{ pkgs ? import <nixpkgs> {} }:
with pkgs;
mkShell {
  buildInputs = [
    git
    python38Full
    python38Packages.setuptools
    zlib
    libusb1
    pkg-config
  ];
  shellHook = ''
            export PATH=~/.cargo/bin:$PATH
            alias pip="PIP_PREFIX='$(pwd)/_build/pip_packages' \pip"
            export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python3.8/site-packages:$PYTHONPATH"
            unset SOURCE_DATE_EPOCH
  '';
}
