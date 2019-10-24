package haxe_syslog;

import haxe_syslog.Facility;
import haxe_syslog.Option;
import haxe_syslog.Priority;

#if cpp
@:keep
@:include('linc_syslog.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('syslog'))
#end
extern class ExternSyslog {

    @:native("linc::ns_syslog::closelog")
    static function _close() : Void;

    @:native("linc::ns_syslog::openlog")
    static function _open(ident:String, option:Int, facility:Facility) : Void;

    @:native("linc::ns_syslog::setlogmask")
    static function _setLogMask(mask:Int) : Int;

    @:native("linc::ns_syslog::_syslog")
    static function _syslog(pri:Int, msg:String) : Void;

}
#end
