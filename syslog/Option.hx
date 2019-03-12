package syslog;

/**
 * Options as used with Syslog.open().
 * @note we include 2 sets here. One is using the same Syslog terminology,
 * one is using a more simple terminology. In the end they are synonymous,
 * e.g. LOG_PID is similar to LogPid and LOG_PERROR is similar to LogToStderr;
 *
 * To use, just pass something like this:
 * @example
 * Syslog.open("my_program", [LOG_PID, LOG_PERROR], Daemon);
 * @endexample
 */
@:keep
enum Option {
    LogPid	   ;	/* log the pid with each message */
    LogCons    ;	/* log on the console if errors in sending */
    LogODelay  ;	/* delay open until first syslog() (default) */
    LogNDelay  ;	/* don't delay open */
    // LogNoWait ;	/* don't wait for console forks: DEPRECATED */
    LogPError  ;	/* log to stderr as well */

}
