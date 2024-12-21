{ pkgs, ...}: {
  programs.git = {
    package = pkgs.gitFull;
    enable = true;
    userName = "PA055";
    userEmail = "praful.adiga@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      lfs.enable = true;
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };
}
