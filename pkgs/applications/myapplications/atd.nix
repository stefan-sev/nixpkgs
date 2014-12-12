{stdenv, fetchgit, txt2tags, python}:

stdenv.mkDerivation {
	name = "atd-git";

	src = fetchgit {
		url = "https://github.com/lpenz/atdtool";
		sha256 = "0scg0b9vsd0261kfzvn0himj1x3l3q1xrw80mivzh51yk5fbk1vq";
	};

	buildInputs = [ txt2tags python ];

	installPhase = "make PREFIX=$out install";
	fixupPhase = ''
		substituteInPlace $out/bin/atdtool \
			--replace /usr/bin/python ${python}/bin/python
	'';
}
