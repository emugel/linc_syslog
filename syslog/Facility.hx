package syslog;

/*
 * priorities/facilities are encoded into a single 32-bit quantity, where the
 * bottom 3 bits are the priority (0-7) and the top 28 bits are the facility
 * (0-big number).  Both the priorities and the facilities map roughly
 * one-to-one to strings in the syslogd(8) source code.  
 */
@:keep
@:enum abstract Facility(Int) from Int {
    /* Facility codes */

    var Faci_Kern     =  0<<3; /* kernel messages */
    var Faci_User     =  1<<3; /* random user-level messages */
    var Faci_Mail     =  2<<3; /* mail system */
    var Faci_Daemon   =  3<<3; /* system daemons */
    var Faci_Auth     =  4<<3; /* security/authorization messages */
    var Faci_Syslog   =  5<<3; /* messages generated internally by syslogd */
    var Faci_Lpr      =  6<<3; /* line printer subsystem */
    var Faci_News     =  7<<3; /* network news subsystem */
    var Faci_Uucp     =  8<<3; /* UUCP subsystem */
    var Faci_Cron     =  9<<3; /* clock daemon */
    var Faci_AuthPriv = 10<<3; /* security/authorization messages (private) */
    var Faci_Ftp      = 11<<3; /* ftp daemon */
	/* other codes through 15 reserved for system use */
    var Faci_Local0   = 16<<3; /* reserved for local use */
    var Faci_Local1   = 17<<3; /* reserved for local use */
    var Faci_Local2   = 18<<3; /* reserved for local use */
    var Faci_Local3   = 19<<3; /* reserved for local use */
    var Faci_Local4   = 20<<3; /* reserved for local use */
    var Faci_Local5   = 21<<3; /* reserved for local use */
    var Faci_Local6   = 22<<3; /* reserved for local use */
    var Faci_Local7   = 23<<3; /* reserved for local use */
}

