{stdenv, fetchgit, python}:

stdenv.mkDerivation {
	name = "speedtest-git";
	
	src = fetchgit {
		url = "https://github.com/sivel/speedtest-cli.git";
		rev = "756f04da76";
	};

	installPhase = ''
		ensureDir $out/bin
		cp speedtest_cli.py $out/bin/speedtest
		chmod 755 $out/bin/speedtest
	'';

	fixupPhase = ''
		substituteInPlace $out/bin/speedtest --replace "/usr/bin/env python" "${python}/bin/python"
	'';
}
