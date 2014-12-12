{stdenv, fetchurl, patchelf, gtk, atk, gdk_pixbuf, pango, cairo, glib, cups, freetype}:

assert stdenv.system == "i686-linux";

stdenv.mkDerivation {
	name = "foxit-1.1";

	src = fetchurl {
		url = "file:///FoxitReader-1.1.0.tar.bz2";
		sha256 = "1x6vp1zmvp7b1pria0raxfwmf6z8p2a9qd2g4ma6flgxs9davw82";
	};

	buildInputs = [ patchelf gtk atk gdk_pixbuf pango cairo glib cups freetype ];

	installPhase = ''
		ensureDir $out/libexec/foxit
		cp -r * $out/libexec/foxit
		ensureDir $out/bin
		ln -s $out/libexec/foxit/FoxitReader $out/bin/FoxitReader
	'';

	fixupPhase = ''
		patchelf --set-interpreter $(cat $NIX_GCC/nix-support/dynamic-linker) $out/libexec/foxit/FoxitReader
    fullPath=$(cat $NIX_GCC/nix-support/orig-gcc)/lib
		echo $fullPath
      for i in $nativeBuildInputs; do
        fullPath=$fullPath''${fullPath:+:}$i/lib
      done
	 	patchelf --set-rpath $fullPath $out/libexec/foxit/FoxitReader

	'';

}
