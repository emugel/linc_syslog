# linc_syslog

This provides full syslog features for Haxe (with hxcpp).
This was only tested on Linux (contributions welcomed). It also works on systemd with journalctl.

`man 3 syslog` is a good start before using this lib, as this is a very direct usage of it.

## To use

1. Clone this lib, e.g. `haxelib git https://github.com/emugel/linc_syslog`.
2. Put a `-lib linc_syslog` in your **hxml** file (remember, target is hxcpp).

## Example

```haxe
import haxe_syslog.Syslog;

Syslog.open("syslog-test", [Pid, Cons], Facility_User);
Syslog.syslog(Warn, "Hello this is just a test");
Syslog.warn("Another warning");
Syslog.close();
```

To check entries were added with *systemd*, try something like `journalctl -t "syslog-test" in a Linux console`. 

This was created using [linc](http://snowkit.github.io/linc/)
