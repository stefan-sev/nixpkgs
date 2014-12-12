{stdenv, fetchurl, python}:

stdenv.mkDerivation {
	name = "txt2tags-2.6";

	src = fetchurl {
		url = "http://txt2tags.googlecode.com/files/txt2tags-2.6.tgz";
		sha256 = "0p5hql559pk8v5dlzgm75yrcxwvz4z30f1q590yzng0ghvbnf530";
	};

	buildInputs = [ python ];

	installPhase = ''
		ensureDir $out/bin
		cp txt2tags $out/bin
		substituteInPlace $out/bin/txt2tags \
			--replace "/usr/bin/env python" "${python}/bin/python"
	'';
}

