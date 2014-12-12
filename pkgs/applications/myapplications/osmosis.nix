{stdenv, fetchurl, jre}:

stdenv.mkDerivation {
  name = "osmosis";

  src = fetchurl {
    url = "http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz";
    sha256 = "68df488db3643499cbc3d56fd4bd8bcabb9d67e821f9ba365b7e2eed6bda426a";
  };

  phases = [ "unpackPhase" "installPhase" ];

  unpackPhase = ''
    mkdir osmosis
    tar -zxf $src -C osmosis
    cd osmosis
  '';
  
  installPhase = ''
    mkdir -p $out/bin $out/lib
    cp -r * $out/lib

    cat > $out/bin/osmosis << EOF
    #!${stdenv.shell}
    ${jre}/bin/java -cp $out/lib/lib/default/plexus-classworlds-2.4.jar -Dapp.home=$out/lib -Dclassworlds.conf=$out/lib/config/plexus.conf org.codehaus.classworlds.Launcher "\$@"
    EOF

    chmod 755 $out/bin/osmosis
  '';
}
