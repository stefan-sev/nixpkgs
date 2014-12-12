{
	packageOverrides = pkgs : with pkgs; rec {

		pythonEnv = pkgs.myEnvFun {
			name = "python";
			buildInputs = with pkgs.pythonPackages; [ python cheetah sqlite3 numpy scipy matplotlib lxml ];
		};

		devEnv = pkgs.myEnvFun {
			name = "dev";
			buildInputs = [ stdenv ];
		};

		haskellEnv = pkgs.myEnvFun {
			name = "haskell";
			buildInputs = with pkgs.haskellPackages; [ haskellPlatform vector mwcRandom mersenneRandomPure64 random randomShuffle httpConduit aeson JuicyPixelsRepa repaAlgorithms hmatrix mwcRandomMonad monadMersenneRandom ghcCore hp2anyCore hp2anyGraph erf ];
		};

		rEnv = pkgs.myEnvFun {
			name = "r";
			buildInputs = with rPackages; [ stdenv pkgs.R ggplot2 ROCR ];
		};

		asyncns = callPackage ./asyncns.nix {};
		mendeley = callPackage ./mendeley.nix {};
		kingsoftOffice = callPackage ./kingsoft.nix {};
		btsync =	callPackage ./btsync.nix {};
		bibtool = callPackage ./bibtool/bibtool.nix {};
		vowpal = callPackage ./vowpal.nix {};
		gephi = callPackage ./gephi.nix {};
		graphchi = callPackage ./graphchi.nix {};
		portablesigner = callPackage ./portablesigner.nix {};
		atd = callPackage ./atd.nix {};
		txt2tags = callPackage ./txt2tags.nix {};
		openblas = callPackage ./openblas.nix {};
		foxit = callPackage ./foxit.nix {};
		xournal = callPackage ./xournal.nix {
			inherit (gnome) libgnomeprint libgnomeprintui libgnomecanvas;
		};
		iNotesExporter = callPackage ./inotes-exporter.nix {};

		haskellPackages = pkgs.haskellPackages_ghc763_profiling // myHaskellPackages;
		myHaskellPackages = pkgs.recurseIntoAttrs (pkgs.haskellPackages_ghc763_profiling.override {
			extension = self : super : {
				ad = self.callPackage ./ad.nix {};
				JuicyPixelsRepa = self.callPackage ./juicypixels-repa.nix {};
				mersenneRandom = self.callPackage ./mersenne-random.nix {};
				mwcRandomMonad = self.callPackage ./mwc-random-monad.nix {};
				monadPrimitive = self.callPackage ./monad-primitive.nix {};
				monadMersenneRandom = self.callPackage ./monad-mersenne-random.nix {};
				hmatrix = self.callPackage ./hmatrix.nix {};
				binary = haskellPackages_ghc763_profiling.binary_0_7_0_1;
			};
		});
	};
 }
