package syslog;

/*
 * priorities/facilities are encoded into a single 32-bit quantity, where the
 * bottom 3 bits are the priority (0-7) and the top 28 bits are the facility
 * (0-big number).  Both the priorities and the facilities map roughly
 * one-to-one to strings in the syslogd(8) source code.  
 */
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
