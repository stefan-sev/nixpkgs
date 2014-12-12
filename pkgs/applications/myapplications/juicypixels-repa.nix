{ cabal, JuicyPixels, repa, vector }:

cabal.mkDerivation (self: {
  pname = "JuicyPixels-repa";
  version = "0.7";
  sha256 = "0fn9i3w8s2ifyg0zsdryyw1nm0c5ybaq0c6jxcggs79x0ngi0mm5";
  buildDepends = [ JuicyPixels repa vector ];
  meta = {
    description = "Convenience functions to obtain array representations of images";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
