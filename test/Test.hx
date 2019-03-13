import haxe_syslog.Syslog;
import haxe_syslog.Priority;
import haxe_syslog.Facility;
import haxe_syslog.Option;

class Test {
    static function main() {
        Syslog.open("syslog-test", [LogPid, LogCons], Faci_User);
        Syslog.log(Warn, "Hello this is just a test");
        trace(Emerg);
        trace(Warn);
        trace(Faci_Daemon);
    }
}
