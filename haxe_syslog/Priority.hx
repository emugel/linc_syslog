package haxe_syslog;

@:keep
@:enum abstract Priority(Int) from Int {
    /* priorities (these are ordered) */
    var Emerg  = 0;     /* system is unusable */
    var Alert  = 1;     /* action must be taken immediately */
    var Crit   = 2;     /* critical conditions */
    var Err    = 3;     /* error conditions */
    var Warn   = 4;     /* warning conditions */
    var Notice = 5;     /* normal but significant condition */
    var Info   = 6;     /* informational */                        
    var Debug  = 7;     /* debug-level messages */

}
