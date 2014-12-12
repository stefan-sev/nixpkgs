# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, pipes, pipesBytestring, pipesGroup, pipesParse, pipesSafe
, streamingCommons, text, transformers
}:

cabal.mkDerivation (self: {
  pname = "pipes-text";
  version = "0.0.0.15";
  sha256 = "10906gdb9gjhxxmxvmib6kw7py6fl2r4df5bryqvbjvr1afcc3x9";
  buildDepends = [
    pipes pipesBytestring pipesGroup pipesParse pipesSafe
    streamingCommons text transformers
  ];
  jailbreak = true;
  meta = {
    homepage = "https://github.com/michaelt/text-pipes";
    description = "Text pipes";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ aycanirican ];
  };
})
