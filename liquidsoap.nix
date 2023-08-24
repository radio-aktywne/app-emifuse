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
  version = "bcd9cb8";
  rev = version;
  sha256 = "sha256-2QBRks3dIsaeEYG1czVyw8kjvpjCc/Qy2CjYpI3yOJ8=";

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

  customOcamlPackages = {
    cry = let
      version = "1.0.1";
      rev = "refs/tags/v${version}";
      sha256 = "sha256-wn9hLqbydzFTdYsJ1e76dmDLtwcZ7CGjbzFe5o9veYQ=";
    in
      ocamlPackages.cry.overrideAttrs (f: p: {
        inherit version;

        src = fetchFromGitHub {
          inherit rev sha256;

          owner = "savonet";
          repo = "ocaml-cry";
        };
      });

    camomile = let
      version = "2.0.0";
      rev = "refs/tags/v${version}";
      sha256 = "sha256-HklX+VPD0Ta3Knv++dBT2rhsDSlDRH90k4Cj1YtWIa8=";
    in
      ocamlPackages.buildDunePackage {
        inherit version;

        pname = "camomile";

        src = fetchFromGitHub {
          inherit rev sha256;

          owner = "ocaml-community";
          repo = "Camomile";
        };

        propagatedBuildInputs = [
          ocamlPackages.dune-site
          ocamlPackages.camlp-streams
        ];
      };

    metadata = let
      version = "0.2.0";
      rev = "refs/tags/v${version}";
      sha256 = "sha256-sSekkyJ8D6mCCmxIyd+pBk/khaehA3BcpUQl2Gln+Ic=";
    in
      ocamlPackages.buildDunePackage {
        inherit version;

        pname = "metadata";

        src = fetchFromGitHub {
          inherit rev sha256;

          owner = "savonet";
          repo = "ocaml-metadata";
        };
      };

    ffmpeg = let
      version = "1.1.8";
      rev = "refs/tags/v${version}";
      sha256 = "sha256-XqZATaxpW0lEdrRTXVTc0laQAx437+eoa/zOzZV1kHk=";

      ffmpeg-base = {
        version = version;
        duneVersion = "3";
        meta = {};

        src = fetchFromGitHub {
          inherit rev sha256;

          owner = "savonet";
          repo = "ocaml-ffmpeg";
        };
      };

      ffmpeg-avutil = ocamlPackages.ffmpeg-avutil.override {inherit ffmpeg-base;};
      ffmpeg-avcodec = ocamlPackages.ffmpeg-avcodec.override {inherit ffmpeg-base ffmpeg-avutil;};
      ffmpeg-avfilter = ocamlPackages.ffmpeg-avfilter.override {inherit ffmpeg-base ffmpeg-avutil;};
      ffmpeg-swscale = ocamlPackages.ffmpeg-swscale.override {inherit ffmpeg-base ffmpeg-avutil;};
      ffmpeg-swresample = ocamlPackages.ffmpeg-swresample.override {inherit ffmpeg-base ffmpeg-avutil ffmpeg-avcodec;};
      ffmpeg-av = ocamlPackages.ffmpeg-av.override {inherit ffmpeg-base ffmpeg-avutil ffmpeg-avcodec;};
      ffmpeg-avdevice = ocamlPackages.ffmpeg-avdevice.override {inherit ffmpeg-base ffmpeg-av;};
    in
      ocamlPackages.ffmpeg.override {
        inherit ffmpeg-base ffmpeg-avutil ffmpeg-avcodec ffmpeg-avfilter ffmpeg-swscale ffmpeg-swresample ffmpeg-av ffmpeg-avdevice;
      };

    flac = let
      version = "cb7f94c";
      rev = version;
      sha256 = "sha256-+JhltsjCR026Sig3U65RBZzohS1z4T7wYeazNXctGRI=";
    in
      ocamlPackages.flac.overrideAttrs (f: p: {
        inherit version;

        src = fetchFromGitHub {
          inherit rev sha256;

          owner = "savonet";
          repo = "ocaml-flac";
        };
      });

    lame = let
      version = "0.3.7";
      rev = "refs/tags/v${version}";
      sha256 = "sha256-/ZzoGFQQrBf17TaBPSFDQ1yHaQnva56YLmscOacrKBI=";
    in
      ocamlPackages.lame.overrideAttrs (f: p: {
        inherit version;

        src = fetchFromGitHub {
          inherit rev sha256;

          owner = "savonet";
          repo = "ocaml-lame";
        };
      });
  };
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
      customOcamlPackages.cry
      customOcamlPackages.camomile
      ocamlPackages.uri
      ocamlPackages.fileutils
      customOcamlPackages.metadata
      ocamlPackages.dune-build-info
      ocamlPackages.dune-site
      ocamlPackages.ppx_string
      ocamlPackages.sedlex
      ocamlPackages.menhirLib

      # Optional dependencies
      ocamlPackages.faad
      ocamlPackages.fdkaac
      customOcamlPackages.ffmpeg
      customOcamlPackages.flac
      customOcamlPackages.lame
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
