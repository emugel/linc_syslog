import haxe_syslog.Syslog;
import haxe_syslog.Priority;
import haxe_syslog.Facility;
import haxe_syslog.Option;

class Test {
    static function main() {
        Syslog.open("syslog-test", [Pid, Cons], Facility_User);
        Syslog.syslog(Warn, "Hello this is just a test");
        trace(Emerg);
        trace(Warn);
        trace(Facility_Daemon);
    }
}
