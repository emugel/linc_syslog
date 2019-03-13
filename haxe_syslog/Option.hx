package haxe_syslog;

/**
 * Options for Syslog.open().
 * Example: Syslog.open("my_program", [Pid, PError], Daemon);
 */
@:keep
enum Option {
    Pid;            // Log the pid with each message
    Cons;           // Log on the console if errors in sending
    ODelay;         // Delay open until first syslog() (default)
    NDelay;         // Don't delay open
    // NoWait;      // Don't wait for console forks: DEPRECATED
    PError;         // Log to stderr as well
}
