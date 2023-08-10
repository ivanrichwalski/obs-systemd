## Stream automation for OBS

I needed to setup an automated daily stream using OBS, and
created the couple scripts along with the systemd unit files
to make things easier.

There are 2 systemd services, triggered by 2 timers. All of the
units are able to run in the user's context, without any elevated
privileges. The timers should be set to run before the earliest
expected sunrise/sunset times of the year, and the services will
wait until the actual sunrise/sunset time before continuing.

Other projects neede:

* obs-cli-v5: https://github.com/onyx-and-iris/obs-cli-v5

    Used to control OBS through the websocket interface.
    This implementation supports OBS's v5 protocol included
    with OBS version >28.0.0.

    In obs-launch, and the stream is started and it cycles
    through the opening scene sequence. When obs-shutdown
    runs, the closing scene sequence is played, and the
    stream is ended.

* sunwait: https://github.com/risacher/sunwait

    Used to pause execution until the sun reaches the required
    position in the sky, based on latitude/longitude.

* ydotool: https://github.com/ReimuNotMoe/ydotool

    There's no websocket command to exit OBS, so ydotool is
    used to send crtl-Q to close the program. The current
    version of ydotool expects to talk to it's included
    daemon, also running with it's own user level service.
