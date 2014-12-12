{ cabal, binary, openblas, deepseq, gsl, random
, storableComplex, vector
}:

cabal.mkDerivation (self: {
  pname = "hmatrix";
  version = "0.15.2.0";
  sha256 = "0rlgyqgl9x08f38nznbv50asbph0zp9dqk0l156hxz792590payl";
  buildDepends = [ binary deepseq random storableComplex vector ];
  extraLibraries = [ openblas gsl ];
	#patches = [ "hmatrix.patch" ];
	configureFlags = [ "--configure-option=link:gsl,openblas" ];
  meta = {
    homepage = "https://github.com/albertoruiz/hmatrix";
    description = "Linear algebra and numerical computation";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
  };
})
