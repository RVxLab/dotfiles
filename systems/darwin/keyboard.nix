{ ... }:
let
  capsLock = 30064771129;
  f18 = 30064771181;
in {
  system.keyboard = {
    enableKeyMapping = true;
    userKeyMapping = [
      {
        HIDKeyboardModifierMappingSrc = capsLock;
        HIDKeyboardModifierMappingDst = f18;
      }
    ];
  };
}
