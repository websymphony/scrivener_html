{ pkgs, lib, ... }:

{
  # https://devenv.sh/basics/
  env.ACLOCAL_PATH = "${pkgs.libtool}/share/aclocal";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    # These packages are required to make the hashids library build
    automake
    libtool
    autoconf
  ] ++ lib.optionals pkgs.stdenv.isDarwin (with pkgs; [
    libcxx
	darwin.apple_sdk.frameworks.CoreServices
  ]);

  # https://devenv.sh/languages/
  languages = {
    c.enable = true;
    nix.enable = true;

    elixir = {
      enable = true;
      # Elixir 1.14 points to Erlang 25, but we use Erlang 26
      package = pkgs.elixir_1_14.override { erlang = pkgs.erlang_26; };
    };
  };

  services = {
  };

  # https://devenv.sh/scripts/

  enterShell = ''
  '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;
}
