package haxe_syslog;

import haxe_syslog.Facility;
import haxe_syslog.Option;
import haxe_syslog.Priority;
import haxe_syslog.ExternSyslog;

@:keep
@:include('linc_syslog.h')
class Syslog {

    public static inline var facilitiesCount :Int = 24;

    /**
     * open() opens a connection to the system logger for a program.
     * It will call the C function openlog() of syslog, from `man 3 openlog`:
     * "The use of openlog() is optional; it will automatically be called by
     * syslog() if	necessary, in which case ident will default to NULL."
     *
     * @param (String ident) The  string ident is prepended to every message,
     *                       and is typically set to the program name. If
     *                       ident is null, the program name is used.
     * @param (Array<Option>) Flags which control the operation of openlog() and
     *                       subsequent calls to syslog(). The facility argument establishes
     *                       a default to be used  if none is specified in
     *                       subsequent calls to syslog().
     * @param (Facility)     The facility argument is used to specify what type
     *                       of program is logging the  message. This lets
     *                       the configuration file specify that messages from
     *                       different facilities will be handled differently.
    **/
    public static function open(ident:String, options:Array<Option>, facility:Facility) : Void {
#if cpp
        if (options == null) options = [];
        var opt = 0;
        for (e in options) opt |= switch e {
            case Pid       : 0x01;
            case Cons      : 0x02;
            case ODelay    : 0x04;
            case NDelay    : 0x08;
            // case NoWait : 0x10;   // deprecated in .h, better not include it
            case PError    : 0x20;
        }
        ExternSyslog._open(ident, opt, facility);
#end
    }

    /**
     * emerg(), alert(), crit(), err(), warn(), notice(), info(), debug().
     * @param (String) Message to send to syslog.
     * @param (Facility) If no facility value is OR-ed into priority, then the default value
     *                   set by	openlog() is used, or, if there was no
     *                   preceding openlog() call, a default of LOG_USER is
     *                   employed.
     */
    public static inline function emerg  (msg:String, faci:Facility=0) : Void syslog(0, msg, faci);
    public static inline function alert  (msg:String, faci:Facility=0) : Void syslog(1, msg, faci);
    public static inline function crit   (msg:String, faci:Facility=0) : Void syslog(2, msg, faci);
    public static inline function err    (msg:String, faci:Facility=0) : Void syslog(3, msg, faci);
    public static inline function warn   (msg:String, faci:Facility=0) : Void syslog(4, msg, faci);
    public static inline function notice (msg:String, faci:Facility=0) : Void syslog(5, msg, faci);
    public static inline function info   (msg:String, faci:Facility=0) : Void syslog(6, msg, faci);
    public static inline function debug  (msg:String, faci:Facility=0) : Void syslog(7, msg, faci);

    /**
     * syslog() generates a log message, which will be distributed by syslogd(8).
     * @param (Priority) E.g. Warn, Notice...
     * @param (String msg) Message to send to syslog.
     * @param (Facility) If no facility value is OR-ed into priority, then the default value
     *                   set by	openlog() is used, or, if there was no
     *                   preceding openlog() call, a default of LOG_USER is
     *                   employed.
    **/
    public static function syslog(pri:Priority, msg:String, faci:Facility=0) : Void {
#if cpp
        var p : Int = cast pri;
        var f : Int = cast faci;
        ExternSyslog._syslog(p | f, msg); 
#end
    }


    /**
     * Set minimum log level. 
     * All levels with a lesser priority will not be logged.
     * @param (Priority) E.g. Warn.
     * @return (Int) This function returns the previous log priority mask.
     * @example
     * logUpTo(Warn);       // will allow Warn, Err, Crit, Alert, Emerg
     * @endexample
     */
    public static function logUpTo(pri:Priority) : Int {
#if cpp
        if (cast (pri, Int) < 0 || cast(pri, Int) > 7) {
            trace("logUpTo: invalid value " + pri);
            return ExternSyslog._setLogMask(0);   // don't change anything
        }
        return ExternSyslog._setLogMask((1 << (cast(pri, Int)+1)) - 1);
#else 
        return 0;
#end
    }

    /** 
     * close() will close the file descriptor being used to write to the
     * system logger. The use of close() is optional.
     */
    public static function close() : Void {
#if cpp
        ExternSyslog._close();
#end
    }

}
