{ cabal, monadPrimitive, mwcRandom, primitive, transformers, vector
}:

cabal.mkDerivation (self: {
  pname = "mwc-random-monad";
  version = "0.7";
  sha256 = "01kdrirzghnijrgln3lbwx0jsv5zk2m7w9qlw5xvsyq9vmbp8qlz";
  buildDepends = [
    monadPrimitive mwcRandom primitive transformers vector
  ];
  meta = {
    description = "Monadic interface for mwc-random";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
