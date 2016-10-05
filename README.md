Snapcast startup
================
Scripts for running Snapcast server and client on system start. Specific instructions for Volumio2.

Prepend all commands with `sudo` or run as root.

Installation
------------
### Update MPD config

	$ nano /etc/mpd.conf 

Change

	audio_output {
	               type            "alsa"
	               name            "alsa"
	               device          "hw:0,0"
	               dop                     "yes"
	}

	audio_output {
	    type            "fifo"
	    enabled         "no"
	    name            "multiroom"
	    path            "/tmp/snapfifo"
	    format          "44100:16:2"
	}

to

	#audio_output {
	#               type            "alsa"
	#               name            "alsa"
	#               device          "hw:0,0"
	#               dop                     "yes"
	#}

	audio_output {
	    type            "fifo"
	    enabled         "yes"
	    name            "multiroom"
	    path            "/tmp/snapfifo"
	    format          "44100:16:2"
	}

Restart mpd

	$ /etc/init.d/mpd restart

### Server

	$ chmod +x snapserver.sh
	$ ln -s snapserver.sh /etc/init.d/snapserver
	$ update-rc.d snapserver defaults
	$ /etc/init.d/snapserver start

Change CODEC variable if you have a fast network.

### Client

	$ chmod +x snapclient.sh
	$ ln -s snapclient.sh /etc/init.d/snapclient
	$ update-rc.d snapclient defaults
	$ /etc/init.d/snapclient start

Change SERVER variable if running client on other device.


Links
-----
* [Snapcast](https://github.com/badaix/snapcast)
* [Volumio2](https://volumio.org)