{stdenv, fetchurl, glib, libX11, zlib, libpng12, freetype
, libSM, libICE, libXrender, fontconfig, libXext }:

assert stdenv.system == "i686-linux";

stdenv.mkDerivation {
  name = "kingsoft-a12p4";
  
  src = fetchurl {
    url = "http://kdl.cc.ksosoft.com/wps-community/kingsoft-office_9.1.0.4280-a12p4_x86.tar.xz";
    sha256 = "1q864ax98m6fs9pfnbi13snr1rjph3mdh1m9syjn5b9zbsbdr4iz";
  };

  buildInputs = [ stdenv.glibc stdenv.gcc.gcc libX11 zlib glib libpng12 freetype libSM libICE libXrender fontconfig libXext ];
  
  phases = "unpackPhase installPhase";
  
  installPhase = ''
    mkdir -p $out/{libexec,bin}
    cp -r * $out/libexec/
    
    fullPath=
    for i in $nativeBuildInputs; do
      fullPath=$fullPath''${fullPath:+:}$i/lib
    done
    
    
    dynlinker="$(cat $NIX_GCC/nix-support/dynamic-linker)"
    cp $dynlinker $out/libexec/office6
    
    cat > $out/bin/wps << EOF
    #!${stdenv.shell}
    export LD_LIBRARY_PATH=$out/libexec/office6:$fullPath:$LD_LIBRARY_PATH
    $out/libexec/office6/ld-linux.so.2 $out/libexec/office6/wps "\$@"
    EOF
    
    cat > $out/bin/wpp << EOF
    #!${stdenv.shell}
    export LD_LIBRARY_PATH=$out/libexec/office6:$fullPath:$LD_LIBRARY_PATH
    $out/libexec/office6/ld-linux.so.2 $out/libexec/office6/wpp "\$@"
    EOF
    
    cat > $out/bin/et << EOF
    #!${stdenv.shell}
    export LD_LIBRARY_PATH=$out/libexec/office6:$fullPath:$LD_LIBRARY_PATH
    $out/libexec/office6/ld-linux.so.2 $out/libexec/office6/et "\$@"
    EOF

    chmod +x $out/bin/wps
    chmod +x $out/bin/wpp
    chmod +x $out/bin/et
  '';
  
  meta = {
    description = "Chinese office knockoff";
    homepage = "http://wps-community.org/";
  };
}
