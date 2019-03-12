import syslog.Syslog;
import syslog.Priority;
import syslog.Facility;
import syslog.Option;

class Test {
    static function main() {
        Syslog.open("syslog-test", [LogPid, LogCons], Faci_User);
        Syslog.syslog(Warn, "Hello this is just a test");
        trace(Emerg);
        trace(Warn);
        trace(Faci_Daemon);
    }
}
