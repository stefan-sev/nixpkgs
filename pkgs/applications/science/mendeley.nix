 {stdenv, fetchurl, libX11, zlib, sqlite, libXrender, fontconfig, glib, libpng12, freetype, libSM, libICE, libXext, libXt, libXtst, gdbm, libcap, dbus, tcp_wrappers, libsndfile, asyncns, gstreamer, gst_plugins_base, openssl }:

stdenv.mkDerivation rec {
  name = "mendeleydesktop-1.12.2";

  src = fetchurl {
    #url = "http://www.mendeley.com/client/get/100-2/";
    url = "file:///home/stefsev/Downloads/mendeleydesktop-1.12.2-linux-x86_64.tar.bz2";
    sha256 = "1vj0vifj5qpd1d0vj388li978nryvppryaqr43cfhdzviphbqqjw"; 
  };

	gcc = stdenv.gcc.gcc;

  buildInputs = [ stdenv libX11 zlib stdenv.gcc.gcc sqlite libXrender fontconfig glib libpng12 freetype libSM libICE libXext libXt libXtst gdbm libcap dbus tcp_wrappers libsndfile asyncns gstreamer gst_plugins_base openssl ];
  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp -r * $out/

    fullPath=
    for i in $nativeBuildInputs; do
      fullPath=$fullPath''${fullPath:+:}$i/lib
    done

    dynlinker="$(cat $NIX_GCC/nix-support/dynamic-linker)"

    rm $out/bin/*
    cat >> $out/bin/mendeleydesktop << EOF
    #!${stdenv.shell}
    export LD_LIBRARY_PATH=$out/lib:$out/lib/qt:$out/lib/ssl:$fullPath:$$LD_LIBRARY_PATH
    $dynlinker $out/lib/mendeleydesktop/libexec/mendeleydesktop.x86_64 "\$@"
    EOF

    chmod 755 $out/bin/mendeleydesktop
    ln -s ${gdbm}/lib/libgdbm.so $out/lib/libgdbm.so.3

    cp ${gcc}/lib*/libstdc++.so* $out/lib
    cp ${gcc}/lib*/libgcc_s.so* $out/lib
  '';

  postFixup = ''
    patchelf --set-interpreter ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/lib/mendeleydesktop/libexec/*
  '';

  meta = {
    description = "a free reference manager and academic social network";
    priority = 10;
  };
}
