{stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "btsync";

  src = fetchurl {
    url = "http://btsync.s3-website-us-east-1.amazonaws.com/btsync_glibc23_x64.tar.gz";
    sha256 = "1874jqxg68md9acmyg5c52zmgz33m9znpjjz5yvgci4lys9xrzl7";
  };

  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];
  runtimeDependencies = [];

  rpath = "${stdenv.lib.makeLibraryPath runtimeDependencies}:${stdenv.gcc.gcc}/lib64";

  unpackPhase = ''
    tar -zxf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp btsync $out/bin
    chmod 755 $out/bin/btsync
  '';

  fixupPhase = ''
    cd $out
    find . -type f -executable -exec patchelf \
      --set-interpreter "$(cat $NIX_GCC/nix-support/dynamic-linker)" \
      '{}' \; || true
    find . -type f -exec patchelf \
      --set-rpath $rpath:$(cat $NIX_GCC/nix-support/orig-gcc)/lib \
      --force-rpath \
      '{}' \; || true
  '';

}
