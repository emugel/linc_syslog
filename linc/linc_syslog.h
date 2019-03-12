#pragma once

//hxcpp include should always be first    
#ifndef HXCPP_H
#include <hxcpp.h>
#endif

//include other library includes as needed
// #include "../lib/____"
#include <syslog.h>

namespace linc {

    namespace syslog {
        void closelog(void);
        void openlog(const char *__ident, int __option, int __facility);
        int setlogmask(int __mask);
        void _syslog(int pri, const char *s);
    }

} //linc
