{ ... }:

{

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
        enable = true;
        support32Bit = true;
    };
    wireplumber.enable = true;
    jack.enable = false;
    pulse.enable = true;
    audio.enable = true;
  };

}
