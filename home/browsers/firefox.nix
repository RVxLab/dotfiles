{
  vars,
  pkgs,
  ...
}: let
  addons = pkgs.nur.repos.rycee.firefox-addons;
  extensions = [
    addons.don-t-fuck-with-paste
    addons.facebook-container
    addons.honey
    addons.privacy-badger
    addons.proton-pass
    addons.ublacklist
    addons.ublock-origin
    addons.vue-js-devtools
  ];

  policies = {
    # General policies
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
    };
    DisablePocket = true;
    DisableFirefoxAccounts = true;
    DisableAccounts = true;
    DontCheckDefaultBrowser = true;
    OfferToSaveLogins = false;
    PasswordManagerEnabled = false;
    SearchBar = "unified";
  };

  # about:config
  settings = {
    "app.update.auto" = false;
    "extensions.pocket.enabled" = false;
    "media.autoplay.blocking_policy" = 2; # Completely disable autoplay

    # Load bookmarks in the background
    "browser.tabs.loadBookmarksInTabs" = true;
    "browser.tabs.loadBookmarksInBackground" = true;

    "media.videocontrols.picture-in-picture.video-toggle.always-show" = true;

    # Disable those bloody sponsored links
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "services.sync.prefs.sync-seen.services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored" = false;
    "services.sync.prefs.sync-seen.services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
  };

  lock = value: {
    Value = value;
    Status = "locked";
  };
in {
  # TODO: Make Firefox properly declarative
  programs.firefox = {
    enable = false;
  };
}
