//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_syslog.h"

namespace linc {

    namespace syslog {

        void closelog(void) { ::closelog(); }
        void openlog(const char *__ident, int __option, int __facility) {
            ::openlog(__ident, __option, __facility);
        }
        int setlogmask(int __mask) { return ::setlogmask(__mask); }

        /** ... in C is variable length argument
         */
        void _syslog(int pri, const char *s) {
            ::syslog(pri, "%s", s);
        }
    } 

} //linc
