package haxe_syslog;

@:keep
@:enum abstract Facility(Int) from Int {
    var Facility_Kern     =  0<<3; /* kernel messages */
    var Facility_User     =  1<<3; /* random user-level messages */
    var Facility_Mail     =  2<<3; /* mail system */
    var Facility_Daemon   =  3<<3; /* system daemons */
    var Facility_Auth     =  4<<3; /* security/authorization messages */
    var Facility_Syslog   =  5<<3; /* messages generated internally by syslogd */
    var Facility_Lpr      =  6<<3; /* line printer subsystem */
    var Facility_News     =  7<<3; /* network news subsystem */
    var Facility_Uucp     =  8<<3; /* UUCP subsystem */
    var Facility_Cron     =  9<<3; /* clock daemon */
    var Facility_AuthPriv = 10<<3; /* security/authorization messages (private) */
    var Facility_Ftp      = 11<<3; /* ftp daemon */
	/* other codes through 15 reserved for system use */
    var Facility_Local0   = 16<<3; /* reserved for local use */
    var Facility_Local1   = 17<<3; /* reserved for local use */
    var Facility_Local2   = 18<<3; /* reserved for local use */
    var Facility_Local3   = 19<<3; /* reserved for local use */
    var Facility_Local4   = 20<<3; /* reserved for local use */
    var Facility_Local5   = 21<<3; /* reserved for local use */
    var Facility_Local6   = 22<<3; /* reserved for local use */
    var Facility_Local7   = 23<<3; /* reserved for local use */
}

