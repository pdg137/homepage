let
  mynix = import (fetchTarball {
      url = "https://github.com/pdg137/config/archive/master.tar.gz";
      sha256 = "175nhmyc82hs1j9q8q0cwq6h53xqnqms07jnn6qq1skfhjxbs32p";
  } + "/defs.nix");
  pkgs = mynix.pkgs;

  gemset = import ./build_gemset.nix pkgs {
    # If you update Gemfile.lock, you will need to revise this hash.
    hash = "sha256-Jg1QKeknF6+cep12HG0HDZ6V4hQb1NJ6VULQ8fmqPzE=";
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
  };

  our_ruby_env = pkgs.bundlerEnv {
    name = "our_ruby_env";
    ruby = pkgs.ruby_3_3;

    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = gemset.outPath;
  };

in

mynix.mkBuildableShell {
  name = "shell";
  buildInputs = [
    our_ruby_env
    pkgs.ruby
  ];
}
