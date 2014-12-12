{stdenv, fetchurl, autoreconfHook, texLive}:

stdenv.mkDerivation rec {
	name = "bibtool-2.55";
	
	src = fetchurl {
		url = "http://mirrors.ctan.org/biblio/bibtex/utils/bibtool/BibTool-2.55.tar.gz";
		sha256 = "0gm5ba07vskr206jk853iag36xi23njknx4dwgr9dfafyx77cmgw";
	};
	
	preAutoreconf = ''
		substituteInPlace configure.in \
			--replace kpathsea_dir=/usr/include kpathsea_dir=${texLive}/include
	'';
	
	buildInputs = [ autoreconfHook texLive ];
	patches = [ ./regex.patch ];
	
	
}
