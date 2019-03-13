# linc_syslog

This provides full syslog features for Haxe (with hxcpp).
This was only tested on Linux (contributions welcomed). It also works on systemd with journalctl.

`man 3 syslog` is a good start before using this lib, as this is a very direct usage of it.

## Example

```haxe
Syslog.open("syslog-test", [Pid, Cons], Facility_User);
Syslog.syslog(Warn, "Hello this is just a test");
Syslog.warn("This is a faster way");
Syslog.close();
```

This was created using [linc](http://snowkit.github.io/linc/)
