{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*" = {
        identityFile = "~/.ssh/id_ed25519";
        addKeysToAgent = "yes";
      };
      # "*" = {
      #   forwardAgent = false;
      #   addKeysToAgent = "no";
      #   compression = false;
      #   serverAliveInterval = 0;
      #   serverAliveCountMax = 3;
      #   hashKnownHosts = false;
      #   userKnownHostsFile = "~/.ssh/known_hosts";
      #   controlMaster = "no";
      #   controlPath = "~/.ssh/master-%r@%n:%p";
      #   controlPersist = "no";
      # };
    };
  };

  services.ssh-agent = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
