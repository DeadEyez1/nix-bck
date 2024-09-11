{ pkgs-stable, ...}: {

  # Install easyeffects via home-manager module
  services.easyeffects = {
    enable = true;
    preset = "micEq";
    package = pkgs-stable.easyeffects;
  };

  # Source easyeffects preset from the home-manager store
  home.file = {
    ".config/easyeffects/input/micEq.json".text = ''
    {
        "input": {
            "blocklist": [],
            "equalizer#0": {
                "balance": 0.0,
                "bypass": false,
                "input-gain": 0.0,
                "left": {
                    "band0": {
                        "frequency": 33.71369934082031,
                        "gain": -10.569999694824219,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band1": {
                        "frequency": 79.9478988647461,
                        "gain": -1.25,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band2": {
                        "frequency": 189.58599853515625,
                        "gain": 3.2100000381469727,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band3": {
                        "frequency": 449.5799865722656,
                        "gain": -4.179999828338623,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band4": {
                        "frequency": 1066.1199951171875,
                        "gain": -3.2100000381469727,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band5": {
                        "frequency": 2528.169921875,
                        "gain": -4.179999828338623,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band6": {
                        "frequency": 5995.240234375,
                        "gain": -8.680000305175781,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band7": {
                        "frequency": 14217.0,
                        "gain": 6.110000133514404,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    }
                },
                "mode": "IIR",
                "num-bands": 8,
                "output-gain": 0.0,
                "pitch-left": 0.0,
                "pitch-right": 0.0,
                "right": {
                    "band0": {
                        "frequency": 33.71369934082031,
                        "gain": -10.569999694824219,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band1": {
                        "frequency": 79.9478988647461,
                        "gain": -1.25,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band2": {
                        "frequency": 189.58599853515625,
                        "gain": 3.2100000381469727,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band3": {
                        "frequency": 449.5799865722656,
                        "gain": -4.179999828338623,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band4": {
                        "frequency": 1066.1199951171875,
                        "gain": -3.2100000381469727,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band5": {
                        "frequency": 2528.169921875,
                        "gain": -4.179999828338623,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band6": {
                        "frequency": 5995.240234375,
                        "gain": -8.680000305175781,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    },
                    "band7": {
                        "frequency": 14217.0,
                        "gain": 6.110000133514404,
                        "mode": "APO (DR)",
                        "mute": false,
                        "q": 1.229200005531311,
                        "slope": "x1",
                        "solo": false,
                        "type": "Bell",
                        "width": 4.0
                    }
                },
                "split-channels": false
            },
            "plugins_order": [
                "rnnoise#0",
                "equalizer#0",
                "speex#0"
            ],
            "rnnoise#0": {
                "bypass": false,
                "enable-vad": true,
                "input-gain": 0.0,
                "model-path": "",
                "output-gain": 0.0,
                "release": 20.0,
                "vad-thres": 50.0,
                "wet": 0.0
            },
            "speex#0": {
                "bypass": false,
                "enable-agc": false,
                "enable-denoise": true,
                "enable-dereverb": true,
                "input-gain": 0.0,
                "noise-suppression": -70,
                "output-gain": 0.0,
                "vad": {
                    "enable": true,
                    "probability-continue": 90,
                    "probability-start": 95
                }
            }
        }
    }
    '';
  };
}