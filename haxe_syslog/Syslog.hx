package haxe_syslog;

import haxe_syslog.Facility;
import haxe_syslog.Option;
import haxe_syslog.Priority;
import haxe_syslog.ExternSyslog;

@:keep
@:include('linc_syslog.h')
class Syslog {

    public static inline var facilitiesCount:Int = 24;
    public static inline var facilityMask:Int = 0x03f8; // mask to extract facility part
    /**
     * openlog() opens a connection to the system logger for a program.
     * The use of openlog() is optional; it will automatically be called by syslog() if	 nec‐
     * essary, in which case ident will default to null.
     * @param (String ident) The  string ident is prepended to every message,
     *                       and is typically set to the program name.  If
     *                       ident is null, the program name is used.
     * @param (Int option)   flags which control the operation of openlog() and
     *                       subsequent calls
     *                       to syslog().  The facility argument establishes
     *                       a default to be used  if none  is	 specified in
     *                       subsequent calls to syslog().
     * @param (Facility)     The facility argument is used to specify what type
     *                       of program is logging the  message.  This  lets
     *                       the configuration file specify that messages from
     *                       different facilities will be handled differently.
     *                       Below are syslog.hx codes, see Facility.hx:
     *  LOG_AUTH	   security/authorization messages
     *  LOG_AUTHPRIV   security/authorization messages (private)
     *  LOG_CRON	   clock daemon (cron and at)
     *  LOG_DAEMON     system daemons without separate facility value
     *  LOG_FTP	       ftp daemon
     *  LOG_KERN	   kernel messages (these can't be generated from user processes)
     *  LOG_LOCAL0-7   reserved for local use
     *  LOG_LPR	       line printer subsystem
     *  LOG_MAIL	   mail subsystem
     *  LOG_NEWS	   USENET news subsystem
     *  LOG_SYSLOG     messages generated internally by syslogd(8)
     *  LOG_USER (def) generic user-level messages 
     *  LOG_UUCP	   UUCP subsystem
     *
    **/
    public static function open(ident:String, options:Array<Option>, facility:Facility) : Void {
        if (options == null) options = [];
        var opt = 0;
        for (e in options) opt |= switch e {
            case LogPid       : 0x01;
            case LogCons      : 0x02;
            case LogODelay    : 0x04;
            case LogNDelay    : 0x08;
            // case LogNoWait : 0x10;   // deprecated in .h, better not include it
            case LogPError    : 0x20;
        }
        ExternSyslog._open(ident, opt, facility);
    }


    /**
     * syslog() generates a log message, which will be distributed by syslogd(8).
     * @param (Priority)
     * @param (String msg)
     * @param (Facility) If no facility value is OR-ed into priority, then the default value
     *                   set by	openlog() is used, or, if there was no
     *                   preceding openlog() call, a default of LOG_USER is
     *                   employed.
    **/
    public static function syslog(pri:Priority, msg:String, faci:Facility=0) : Void {
        var p : Int = cast pri;
        var f : Int = cast faci;
        ExternSyslog._syslog(p | f, msg); 
    }

    /**
     * Set minimum log level. All levels with a less priority will not be
     * logged.
     * @param (Priority) E.g. Warn.
     * @return (Int) This function returns the previous log priority mask.
     * @example
     * logUpTo(Warn);       // will allow Warn, Err, Crit, Alert, Emerg
     * @endexample
     */
    public static function logUpTo(pri:Priority) : Int {
        if (cast (pri, Int) < 0 || cast(pri, Int) > 7) {
            trace("logUpTo: invalid value " + pri);
            return ExternSyslog._setLogMask(0);   // don't change anything
        }
        return ExternSyslog._setLogMask((1 << (cast(pri, Int)+1)) - 1);
    }

    /** 
     * closelog()  closes  the file descriptor being used to write to the
     * system logger.  The use of closelog() is optional.
     */
    public static function close() : Void
        ExternSyslog._close();

}
