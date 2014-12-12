{stdenv, fetchurl, jre, unzip}:

stdenv.mkDerivation {
	name = "portablesigner-2.0.38c0573";

	src = fetchurl {
		url = "mirror://sourceforge/portablesigner/PortableSigner-Generic-2.0.38c0573.zip";
		sha256 = "1xgmmnkgjnb4r1vwv3aakp961v7wpj5as9wnanjmx1il6b68yc8n";
	};

	phases = [ "unpackPhase" "installPhase" ];
	buildInputs = [ jre unzip ] ;

	unpackPhase = ''
		mkdir -p $TMP
		cd $TMP
		unzip $src
  '';

	installPhase = ''
		mkdir -p $out/bin
		cp -r lib $out
		cp PortableSigner.jar $out
    echo '#!${stdenv.shell}' >> $out/bin/portablesigner
    echo "${jre}/bin/java -cp $out -jar $out/PortableSigner.jar \"\$@\"" >> $out/bin/portablesigner
    chmod 755 $out/bin/portablesigner
	'';
}
