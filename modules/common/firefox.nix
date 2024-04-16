{ vars, firefox-addons, ... }:
let
  extensions = with firefox-addons; [
    don-t-fuck-with-paste
    facebook-container
    # TODO: Allow unfree
    # honey
    privacy-badger
    proton-pass
    ublacklist
    ublock-origin
    vue-js-devtools
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
    "extensions.pocket.enabled" = lock false;
    "media.autoplay.blocking_policy" = lock 2; # Completely disable autoplay

    # Load bookmarks in the background
    "browser.tabs.loadBookmarksInTabs" = lock true;
    "browser.tabs.loadBookmarksInBackground" = lock true;

    "media.videocontrols.picture-in-picture.video-toggle.always-show" = lock true;
  };

  lock = value: {
    Value = value;
    Status = "locked";
  };
in {
  home-manager.users.${vars.username}.programs.firefox = {
    enable = true;

    profiles = {
      "${vars.username}_default" = {
        id = 0;
        isDefault = true;

        bookmarks = [
          {
            name = "ProtonMail";
            url = "https://mail.proton.me";
            tags = ["mail"];
            keyword = "mail";
          }
        ];

        inherit extensions settings;
      };
    };

    inherit policies;
  };
}
