# See: https://github.com/NixOS/nixpkgs/blob/91a22f76cd1716f9d0149e8a5c68424bb691de15/pkgs/tools/audio/liquidsoap/full.nix
{
  stdenv,
  lib,
  fetchFromGitHub,
  makeWrapper,
  git,
  dune_3,
  ocamlPackages,
  ffmpeg,
  flac,
  faad2,
  curl,
}: let
  version = "2.2.3";
  rev = "refs/tags/v${version}";
  sha256 = "sha256-oCMSdmdU3oHrq3QFEDQLdb3CLFYcWylxTqKWtGOoQW8=";

  src = fetchFromGitHub {
    inherit rev sha256;

    owner = "savonet";
    repo = "liquidsoap";
  };

  runtimePackages = [
    ffmpeg
    flac
    faad2
    curl
  ];
in
  stdenv.mkDerivation {
    inherit version src;

    pname = "liquidsoap";

    installPhase = ''
      runHook preInstall
      dune install --prefix $out --libdir $OCAMLFIND_DESTDIR --docdir $out/share/doc --mandir $out/share/man
      runHook postInstall
    '';

    postFixup = ''
      wrapProgram $out/bin/liquidsoap \
        --prefix PATH : ${lib.makeBinPath runtimePackages}
    '';

    nativeBuildInputs = [
      makeWrapper
      git
      dune_3
      ocamlPackages.ocaml
      ocamlPackages.findlib
      ocamlPackages.menhir
    ];

    propagatedBuildInputs = [
      # Required dependencies
      ocamlPackages.dtools
      ocamlPackages.duppy
      ocamlPackages.mm
      ocamlPackages.ocaml_pcre
      ocamlPackages.ocurl
      ocamlPackages.cry
      ocamlPackages.camomile
      ocamlPackages.uri
      ocamlPackages.fileutils
      ocamlPackages.menhirLib
      ocamlPackages.metadata
      ocamlPackages.dune-build-info
      ocamlPackages.ppx_string
      ocamlPackages.sedlex

      # Optional dependencies
      ocamlPackages.faad
      ocamlPackages.fdkaac
      ocamlPackages.ffmpeg
      ocamlPackages.flac
      ocamlPackages.lame
      ocamlPackages.mad
      ocamlPackages.magic
      ocamlPackages.ogg
      ocamlPackages.opus
      ocamlPackages.posix-time2
      ocamlPackages.samplerate
      ocamlPackages.shine
      ocamlPackages.soundtouch
      ocamlPackages.srt
      ocamlPackages.ssl
      ocamlPackages.taglib
      ocamlPackages.vorbis
    ];
  }
