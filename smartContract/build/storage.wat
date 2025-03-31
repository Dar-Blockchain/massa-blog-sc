(module
 (type $0 (func (param i32 i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func))
 (type $3 (func (param i32)))
 (type $4 (func (param i32 i32) (result i32)))
 (type $5 (func (param i32 i32 i32)))
 (type $6 (func (result i32)))
 (type $7 (func (param i32 i32 i32) (result i32)))
 (type $8 (func (param i32 i32 i32 i32)))
 (type $9 (func (param i32 i32 i64)))
 (type $10 (func (param i64 i32 i32 i64) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $~lib/rt/itcms/white (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/iter (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/state (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/threshold (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/visitCount (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/@massalabs/as-types/assembly/argument/NoArg (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/ACCOUNT_TEMPLATE i32 (i32.const 1632))
 (global $assembly/contracts/storage/OWNER_KEY i32 (i32.const 1696))
 (global $assembly/contracts/storage/USERS (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/ONE_UNIT i64 (i64.const 1000000000))
 (global $assembly/contracts/storage/PROFILE_OWNERS i32 (i32.const 1920))
 (global $assembly/contracts/storage/FACTORY_CONTRACT i32 (i32.const 1968))
 (global $assembly/contracts/storage/START_POST_ID i32 (i32.const 1))
 (global $assembly/contracts/storage/START_LIKE_ID i32 (i32.const 1))
 (global $assembly/contracts/storage/START_COMMENT_ID i32 (i32.const 1))
 (global $assembly/contracts/storage/START_FOLLOW_ID i32 (i32.const 1))
 (global $assembly/contracts/storage/POST_ID_KEY i32 (i32.const 2032))
 (global $assembly/contracts/storage/LIKE_ID_KEY i32 (i32.const 2064))
 (global $assembly/contracts/storage/COMMENT_ID_KEY i32 (i32.const 2096))
 (global $assembly/contracts/storage/FOLLOW_ID_KEY i32 (i32.const 2144))
 (global $assembly/contracts/storage/profileMap (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/postMap (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/repostsMap (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/likesMap (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/commentsMap (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/followsMap (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/usersFollowsMap (mut i32) (i32.const 0))
 (global $assembly/contracts/storage/CATEGORIES_KEY i32 (i32.const 2544))
 (global $assembly/contracts/storage/DEFAULT_CATEGORIES (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 9216))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 42092))
 (memory $0 1)
 (data $0 (i32.const 1036) "<")
 (data $0.1 (i32.const 1048) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
 (data $2 (i32.const 1132) "<")
 (data $2.1 (i32.const 1144) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $3 (i32.const 1196) ",")
 (data $3.1 (i32.const 1208) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data $4 (i32.const 1244) "<")
 (data $4.1 (i32.const 1256) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $7 (i32.const 1372) "<")
 (data $7.1 (i32.const 1384) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $8 (i32.const 1436) ",")
 (data $8.1 (i32.const 1448) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $9 (i32.const 1484) "<")
 (data $9.1 (i32.const 1496) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $10 (i32.const 1548) "\1c")
 (data $10.1 (i32.const 1560) "\05")
 (data $11 (i32.const 1580) "\1c")
 (data $11.1 (i32.const 1592) "\02\00\00\00\04\00\00\00:\00:")
 (data $12 (i32.const 1612) "<")
 (data $12.1 (i32.const 1624) "\02\00\00\00 \00\00\00A\00C\00C\00O\00U\00N\00T\00_\00T\00E\00M\00P\00L\00A\00T\00E")
 (data $13 (i32.const 1676) ",")
 (data $13.1 (i32.const 1688) "\02\00\00\00\12\00\00\00O\00W\00N\00E\00R\00_\00K\00E\00Y")
 (data $14 (i32.const 1724) "\1c")
 (data $14.1 (i32.const 1736) "\02\00\00\00\n\00\00\00U\00S\00E\00R\00S")
 (data $15 (i32.const 1756) "\1c")
 (data $15.1 (i32.const 1768) "\05")
 (data $16 (i32.const 1788) "<")
 (data $16.1 (i32.const 1800) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
 (data $17 (i32.const 1852) ",")
 (data $17.1 (i32.const 1864) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $18 (i32.const 1900) ",")
 (data $18.1 (i32.const 1912) "\02\00\00\00\1c\00\00\00P\00R\00O\00F\00I\00L\00E\00_\00O\00W\00N\00E\00R\00S")
 (data $19 (i32.const 1948) "<")
 (data $19.1 (i32.const 1960) "\02\00\00\00 \00\00\00F\00A\00C\00T\00O\00R\00Y\00_\00C\00O\00N\00T\00R\00A\00C\00T")
 (data $20 (i32.const 2012) "\1c")
 (data $20.1 (i32.const 2024) "\02\00\00\00\0c\00\00\00p\00o\00s\00t\00I\00d")
 (data $21 (i32.const 2044) "\1c")
 (data $21.1 (i32.const 2056) "\02\00\00\00\0c\00\00\00l\00i\00k\00e\00I\00d")
 (data $22 (i32.const 2076) ",")
 (data $22.1 (i32.const 2088) "\02\00\00\00\12\00\00\00c\00o\00m\00m\00e\00n\00t\00I\00d")
 (data $23 (i32.const 2124) ",")
 (data $23.1 (i32.const 2136) "\02\00\00\00\10\00\00\00f\00o\00l\00l\00o\00w\00I\00d")
 (data $24 (i32.const 2172) "\1c")
 (data $24.1 (i32.const 2184) "\02")
 (data $25 (i32.const 2204) ",")
 (data $25.1 (i32.const 2216) "\02\00\00\00\0e\00\00\00p\00r\00o\00f\00i\00l\00e")
 (data $26 (i32.const 2252) "\1c")
 (data $26.1 (i32.const 2264) "\02\00\00\00\08\00\00\00p\00o\00s\00t")
 (data $27 (i32.const 2284) ",")
 (data $27.1 (i32.const 2296) "\02\00\00\00\0e\00\00\00r\00e\00p\00o\00s\00t\00s")
 (data $28 (i32.const 2332) ",")
 (data $28.1 (i32.const 2344) "\02\00\00\00\10\00\00\00l\00i\00k\00e\00s\00M\00a\00p")
 (data $29 (i32.const 2380) ",")
 (data $29.1 (i32.const 2392) "\02\00\00\00\10\00\00\00c\00o\00m\00m\00e\00n\00t\00s")
 (data $30 (i32.const 2428) ",")
 (data $30.1 (i32.const 2440) "\02\00\00\00\0e\00\00\00f\00o\00l\00l\00o\00w\00s")
 (data $31 (i32.const 2476) ",")
 (data $31.1 (i32.const 2488) "\02\00\00\00\16\00\00\00u\00s\00e\00r\00F\00o\00l\00l\00o\00w\00s")
 (data $32 (i32.const 2524) ",")
 (data $32.1 (i32.const 2536) "\02\00\00\00\1c\00\00\00C\00A\00T\00E\00G\00O\00R\00I\00E\00S\00_\00K\00E\00Y")
 (data $33 (i32.const 2572) "\1c")
 (data $33.1 (i32.const 2584) "\02\00\00\00\0c\00\00\00G\00a\00r\00d\00e\00n")
 (data $34 (i32.const 2604) "L\01")
 (data $34.1 (i32.const 2616) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\003\003\000\009\000\001\006\001\007\006\007\00-\00e\006\00f\00f\00e\00d\009\008\006\00c\008\008\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $35 (i32.const 2940) ",")
 (data $35.1 (i32.const 2952) "\02\00\00\00\0e\00\00\00J\00e\00w\00e\00l\00r\00y")
 (data $36 (i32.const 2988) "L\01")
 (data $36.1 (i32.const 3000) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\004\008\005\008\004\001\008\009\000\003\001\000\00-\006\00a\000\005\005\00c\008\008\006\009\008\00a\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $37 (i32.const 3324) ",")
 (data $37.1 (i32.const 3336) "\02\00\00\00\14\00\00\00I\00n\00d\00u\00s\00t\00r\00i\00a\00l")
 (data $38 (i32.const 3372) "L\01")
 (data $38.1 (i32.const 3384) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\004\005\009\004\001\001\005\005\002\008\008\004\00-\008\004\001\00d\00b\009\00b\003\00c\00c\002\00a\00?\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\000\000\00&\00q\00=\008\000")
 (data $39 (i32.const 3708) "\1c")
 (data $39.1 (i32.const 3720) "\02\00\00\00\n\00\00\00T\00o\00o\00l\00s")
 (data $40 (i32.const 3740) "L\01")
 (data $40.1 (i32.const 3752) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\008\001\001\006\003\002\007\006\000\001\004\00-\003\00f\000\002\007\009\005\00d\006\00d\008\008\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $41 (i32.const 4076) ",")
 (data $41.1 (i32.const 4088) "\02\00\00\00\14\00\00\00A\00u\00t\00o\00m\00o\00t\00i\00v\00e")
 (data $42 (i32.const 4124) "L\01")
 (data $42.1 (i32.const 4136) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\004\009\002\001\004\004\005\003\004\006\005\005\00-\00a\00e\007\009\00c\009\006\004\00c\009\00d\007\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $43 (i32.const 4460) "\1c")
 (data $43.1 (i32.const 4472) "\02\00\00\00\08\00\00\00T\00o\00y\00s")
 (data $44 (i32.const 4492) "L\01")
 (data $44.1 (i32.const 4504) "\02\00\00\004\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\005\008\000\006\000\003\007\000\00-\00d\006\004\004\004\007\009\00c\00b\006\00f\007\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $45 (i32.const 4828) ",")
 (data $45.1 (i32.const 4840) "\02\00\00\00\10\00\00\00O\00u\00t\00d\00o\00o\00r\00s")
 (data $46 (i32.const 4876) "L\01")
 (data $46.1 (i32.const 4888) "\02\00\00\004\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\001\009\009\008\001\003\003\007\00-\007\00f\007\00c\005\00a\00c\006\00c\00a\004\00a\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $47 (i32.const 5212) "\1c")
 (data $47.1 (i32.const 5224) "\02\00\00\00\0c\00\00\00H\00e\00a\00l\00t\00h")
 (data $48 (i32.const 5244) "L\01")
 (data $48.1 (i32.const 5256) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\000\005\007\005\001\001\007\002\008\007\006\00-\00f\00a\001\009\002\003\00c\005\00c\005\002\008\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $49 (i32.const 5580) ",")
 (data $49.1 (i32.const 5592) "\02\00\00\00\16\00\00\00E\00l\00e\00c\00t\00r\00o\00n\00i\00c\00s")
 (data $50 (i32.const 5628) "L\01")
 (data $50.1 (i32.const 5640) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\004\009\008\000\004\009\007\009\004\005\006\001\00-\007\007\008\000\00e\007\002\003\001\006\006\001\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $51 (i32.const 5964) "\1c")
 (data $51.1 (i32.const 5976) "\02\00\00\00\0c\00\00\00S\00p\00o\00r\00t\00s")
 (data $52 (i32.const 5996) "L\01")
 (data $52.1 (i32.const 6008) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\004\006\001\008\009\006\008\003\006\009\003\004\00-\00f\00f\00e\006\000\007\00b\00a\008\002\001\001\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $53 (i32.const 6332) ",")
 (data $53.1 (i32.const 6344) "\02\00\00\00\12\00\00\00C\00o\00m\00p\00u\00t\00e\00r\00s")
 (data $54 (i32.const 6380) "L\01")
 (data $54.1 (i32.const 6392) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\001\007\006\009\004\007\001\002\002\000\002\00-\001\004\00d\00d\009\005\003\008\00a\00a\009\007\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $55 (i32.const 6716) "\1c")
 (data $55.1 (i32.const 6728) "\02\00\00\00\0c\00\00\00D\00e\00s\00i\00g\00n")
 (data $56 (i32.const 6748) "L\01")
 (data $56.1 (i32.const 6760) "\02\00\00\004\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\006\001\007\003\006\007\007\008\00-\009\002\00e\005\002\00a\007\007\006\009\00e\00f\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $57 (i32.const 7084) "\1c")
 (data $57.1 (i32.const 7096) "\02\00\00\00\0c\00\00\00B\00e\00a\00u\00t\00y")
 (data $58 (i32.const 7116) "L\01")
 (data $58.1 (i32.const 7128) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\002\002\003\003\005\007\008\009\002\000\003\00-\00a\00a\00b\00d\001\00f\00c\005\004\00b\00c\009\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $59 (i32.const 7452) "\1c")
 (data $59.1 (i32.const 7464) "\02\00\00\00\n\00\00\00B\00o\00o\00k\00s")
 (data $60 (i32.const 7484) "L\01")
 (data $60.1 (i32.const 7496) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\002\004\009\009\005\009\009\007\009\004\006\00-\00a\001\00c\002\00e\003\001\005\00a\004\002\00f\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $61 (i32.const 7820) ",")
 (data $61.1 (i32.const 7832) "\02\00\00\00\14\00\00\00L\00i\00f\00e\00 \00S\00t\00y\00l\00e")
 (data $62 (i32.const 7868) "L\01")
 (data $62.1 (i32.const 7880) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\001\001\009\008\008\006\001\007\005\000\009\00-\00a\005\007\00c\008\00a\002\008\008\006\005\009\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $63 (i32.const 8204) ",")
 (data $63.1 (i32.const 8216) "\02\00\00\00\1c\00\00\00G\00r\00a\00p\00h\00i\00c\00 \00D\00e\00s\00i\00g\00n")
 (data $64 (i32.const 8252) "L\01")
 (data $64.1 (i32.const 8264) "\02\00\00\00:\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\006\002\006\007\008\005\007\007\004\005\007\003\00-\004\00b\007\009\009\003\001\005\003\004\005\00d\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $65 (i32.const 8588) ",")
 (data $65.1 (i32.const 8600) "\02\00\00\00\10\00\00\00P\00o\00l\00i\00t\00i\00c\00s")
 (data $66 (i32.const 8636) "L\01")
 (data $66.1 (i32.const 8648) "\02\00\00\004\01\00\00h\00t\00t\00p\00s\00:\00/\00/\00i\00m\00a\00g\00e\00s\00.\00u\00n\00s\00p\00l\00a\00s\00h\00.\00c\00o\00m\00/\00p\00h\00o\00t\00o\00-\001\005\004\001\008\007\002\007\000\003\00-\007\004\00c\005\00e\004\004\003\006\008\00f\009\00?\00i\00x\00i\00d\00=\00M\00n\00w\00x\00M\00j\00A\003\00f\00D\00B\008\00M\00H\00x\00w\00a\00G\009\000\00b\00y\001\00w\00Y\00W\00d\00l\00f\00H\00x\008\00f\00G\00V\00u\00f\00D\00B\008\00f\00H\00x\008\00&\00i\00x\00l\00i\00b\00=\00r\00b\00-\001\00.\002\00.\001\00&\00a\00u\00t\00o\00=\00f\00o\00r\00m\00a\00t\00&\00f\00i\00t\00=\00c\00r\00o\00p\00&\00w\00=\005\005\000\00&\00q\00=\008\000")
 (data $67 (i32.const 8972) ",")
 (data $67.1 (i32.const 8984) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $68 (i32.const 9020) "\1c\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\0c\00\00\00\00\00\00\00@\06")
 (data $69 (i32.const 9052) "\1c\00\00\00\03\00\00\00\00\00\00\00\19\00\00\00\0c\00\00\00\00\00\00\00@\06")
 (data $70 (i32.const 9084) "<")
 (data $70.1 (i32.const 9096) "\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d")
 (data $71 (i32.const 9148) "<")
 (data $71.1 (i32.const 9160) "\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d")
 (data $72 (i32.const 9216) "\1a\00\00\00 \00\00\00 \00\00\00 ")
 (data $72.1 (i32.const 9240) "d\00\00\00\02\01\00\00\00\00\00\00 ")
 (data $72.2 (i32.const 9312) "\02A\00\00\02\t\00\00\04A")
 (export "ACCOUNT_TEMPLATE" (global $assembly/contracts/storage/ACCOUNT_TEMPLATE))
 (export "OWNER_KEY" (global $assembly/contracts/storage/OWNER_KEY))
 (export "USERS" (global $assembly/contracts/storage/USERS))
 (export "ONE_UNIT" (global $assembly/contracts/storage/ONE_UNIT))
 (export "PROFILE_OWNERS" (global $assembly/contracts/storage/PROFILE_OWNERS))
 (export "FACTORY_CONTRACT" (global $assembly/contracts/storage/FACTORY_CONTRACT))
 (export "START_POST_ID" (global $assembly/contracts/storage/START_POST_ID))
 (export "START_LIKE_ID" (global $assembly/contracts/storage/START_LIKE_ID))
 (export "START_COMMENT_ID" (global $assembly/contracts/storage/START_COMMENT_ID))
 (export "START_FOLLOW_ID" (global $assembly/contracts/storage/START_FOLLOW_ID))
 (export "POST_ID_KEY" (global $assembly/contracts/storage/POST_ID_KEY))
 (export "LIKE_ID_KEY" (global $assembly/contracts/storage/LIKE_ID_KEY))
 (export "COMMENT_ID_KEY" (global $assembly/contracts/storage/COMMENT_ID_KEY))
 (export "FOLLOW_ID_KEY" (global $assembly/contracts/storage/FOLLOW_ID_KEY))
 (export "profileMap" (global $assembly/contracts/storage/profileMap))
 (export "postMap" (global $assembly/contracts/storage/postMap))
 (export "repostsMap" (global $assembly/contracts/storage/repostsMap))
 (export "likesMap" (global $assembly/contracts/storage/likesMap))
 (export "commentsMap" (global $assembly/contracts/storage/commentsMap))
 (export "followsMap" (global $assembly/contracts/storage/followsMap))
 (export "usersFollowsMap" (global $assembly/contracts/storage/usersFollowsMap))
 (export "CATEGORIES_KEY" (global $assembly/contracts/storage/CATEGORIES_KEY))
 (export "DEFAULT_CATEGORIES" (global $assembly/contracts/storage/DEFAULT_CATEGORIES))
 (export "__new" (func $~lib/rt/itcms/__new))
 (export "__pin" (func $~lib/rt/itcms/__pin))
 (export "__unpin" (func $~lib/rt/itcms/__unpin))
 (export "__collect" (func $~lib/rt/itcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "_builduserFollowsKey" (func $export:assembly/contracts/storage/_builduserFollowsKey))
 (export "_buildUserRepostKey" (func $export:assembly/contracts/storage/_buildUserRepostKey))
 (start $~start)
 (func $~lib/rt/itcms/Object#get:color (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  i32.const 3
  i32.and
 )
 (func $~lib/rt/itcms/Object#get:next (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  i32.const -4
  i32.and
 )
 (func $~lib/rt/itcms/Object#set:prev (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=8
 )
 (func $~lib/rt/itcms/Object#set:nextWithColor (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#set:next (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/Object#unlink (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/itcms/Object#get:next
  local.tee $1
  i32.eqz
  if
   local.get $0
   i32.load offset=8
   i32.eqz
   local.get $0
   i32.const 42092
   i32.lt_u
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1056
    i32.const 128
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   return
  end
  local.get $0
  i32.load offset=8
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 1056
   i32.const 132
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  call $~lib/rt/itcms/Object#set:prev
  local.get $0
  local.get $1
  call $~lib/rt/itcms/Object#set:next
 )
 (func $~lib/rt/itcms/initLazy (param $0 i32) (result i32)
  local.get $0
  local.get $0
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $0
  local.get $0
  call $~lib/rt/itcms/Object#set:prev
  local.get $0
 )
 (func $~lib/rt/itcms/Object#linkTo (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.load offset=8
  local.set $3
  local.get $0
  local.get $1
  local.get $2
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $0
  local.get $3
  call $~lib/rt/itcms/Object#set:prev
  local.get $3
  local.get $0
  call $~lib/rt/itcms/Object#set:next
  local.get $1
  local.get $0
  call $~lib/rt/itcms/Object#set:prev
 )
 (func $~lib/rt/itcms/Object#makeGray (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/rt/itcms/iter
  i32.eq
  if
   local.get $0
   i32.load offset=8
   local.tee $1
   i32.eqz
   if
    i32.const 0
    i32.const 1056
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   global.set $~lib/rt/itcms/iter
  end
  local.get $0
  call $~lib/rt/itcms/Object#unlink
  global.get $~lib/rt/itcms/toSpace
  local.set $1
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 2
  i32.le_u
  if (result i32)
   i32.const 1
  else
   local.get $2
   i32.const 9216
   i32.load
   i32.gt_u
   if
    i32.const 1152
    i32.const 1216
    i32.const 21
    i32.const 28
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   i32.const 2
   i32.shl
   i32.const 9220
   i32.add
   i32.load
   i32.const 32
   i32.and
  end
  local.set $2
  local.get $0
  local.get $1
  global.get $~lib/rt/itcms/white
  i32.eqz
  i32.const 2
  local.get $2
  select
  call $~lib/rt/itcms/Object#linkTo
 )
 (func $~lib/rt/itcms/__link (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.eqz
  if
   return
  end
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 1056
   i32.const 295
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 20
  i32.sub
  local.tee $1
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $0
   call $~lib/rt/itcms/Object#get:color
   local.tee $3
   global.get $~lib/rt/itcms/white
   i32.eqz
   i32.eq
   if
    local.get $0
    local.get $1
    local.get $2
    select
    call $~lib/rt/itcms/Object#makeGray
   else
    global.get $~lib/rt/itcms/state
    i32.const 1
    i32.eq
    local.get $3
    i32.const 3
    i32.eq
    i32.and
    if
     local.get $1
     call $~lib/rt/itcms/Object#makeGray
    end
   end
  end
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
 )
 (func $~lib/rt/itcms/visitRoots
  (local $0 i32)
  (local $1 i32)
  call $~lib/rt/__visit_globals
  global.get $~lib/rt/itcms/pinSpace
  local.tee $1
  call $~lib/rt/itcms/Object#get:next
  local.set $0
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.ne
   if
    local.get $0
    call $~lib/rt/itcms/Object#get:color
    i32.const 3
    i32.ne
    if
     i32.const 0
     i32.const 1056
     i32.const 160
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 20
    i32.add
    call $~lib/rt/__visit_members
    local.get $0
    call $~lib/rt/itcms/Object#get:next
    local.set $0
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/itcms/Object#set:color (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const -4
  i32.and
  local.get $1
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/__visit (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#makeGray
   global.get $~lib/rt/itcms/visitCount
   i32.const 1
   i32.add
   global.set $~lib/rt/itcms/visitCount
  end
 )
 (func $~lib/rt/itcms/Object#get:size (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
 )
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.tee $3
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.clz
   i32.sub
   local.tee $4
   i32.const 7
   i32.sub
   local.set $2
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $4
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=8
  local.set $5
  local.get $1
  i32.load offset=4
  local.tee $3
  if
   local.get $3
   local.get $5
   call $~lib/rt/itcms/Object#set:prev
  end
  local.get $5
  if
   local.get $5
   local.get $3
   call $~lib/rt/itcms/Object#set:nextWithColor
  end
  local.get $1
  local.get $0
  local.get $2
  i32.const 4
  i32.shl
  local.get $4
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.tee $1
  i32.load offset=96
  i32.eq
  if
   local.get $1
   local.get $5
   i32.store offset=96
   local.get $5
   i32.eqz
   if
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    local.tee $1
    i32.load offset=4
    i32.const -2
    local.get $4
    i32.rotl
    i32.and
    local.set $3
    local.get $1
    local.get $3
    i32.store offset=4
    local.get $3
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const -2
     local.get $2
     i32.rotl
     i32.and
     call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  local.get $1
  i32.load
  i32.const -4
  i32.and
  i32.add
  local.tee $4
  i32.load
  local.tee $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $3
   i32.const 4
   i32.add
   local.get $2
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
   local.get $1
   i32.const 4
   i32.add
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $4
   i32.load
   local.set $2
  end
  local.get $3
  i32.const 2
  i32.and
  if
   local.get $1
   i32.const 4
   i32.sub
   i32.load
   local.tee $1
   i32.load
   local.tee $6
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1392
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $6
   i32.const 4
   i32.add
   local.get $3
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  end
  local.get $4
  local.get $2
  i32.const 2
  i32.or
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $1
  i32.const 4
  i32.add
  local.get $2
  i32.add
  i32.ne
  if
   i32.const 0
   i32.const 1392
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $2
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $5
   local.get $2
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $2
  i32.const 16
  i32.lt_u
  local.get $5
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $3
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $1
  local.get $3
  call $~lib/rt/itcms/Object#set:prev
  local.get $3
  if
   local.get $3
   local.get $1
   call $~lib/rt/itcms/Object#set:nextWithColor
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $5
  i32.shl
  i32.or
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  local.get $0
  local.get $5
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  local.get $0
  i32.load offset=4
  i32.const 1
  local.get $2
  i32.shl
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $2
  local.get $1
  i64.extend_i32_u
  i64.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.load offset=1568
  local.tee $3
  if
   local.get $3
   i32.const 4
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1392
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.const 16
   i32.sub
   local.tee $5
   local.get $3
   i32.eq
   if
    local.get $3
    i32.load
    local.set $4
    local.get $5
    local.set $1
   end
  else
   local.get $0
   i32.const 1572
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1392
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  i32.wrap_i64
  i32.const -16
  i32.and
  local.get $1
  i32.sub
  local.tee $3
  i32.const 20
  i32.lt_u
  if
   return
  end
  local.get $1
  local.get $4
  i32.const 2
  i32.and
  local.get $3
  i32.const 8
  i32.sub
  local.tee $3
  i32.const 1
  i32.or
  i32.or
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/Object#set:prev
  local.get $1
  i32.const 4
  i32.add
  local.get $3
  i32.add
  local.tee $3
  i32.const 2
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  local.get $0
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/initialize
  (local $0 i32)
  (local $1 i32)
  memory.size
  local.tee $0
  i32.const 0
  i32.le_s
  if (result i32)
   i32.const 1
   local.get $0
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  i32.const 42096
  i32.const 0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  i32.const 43664
  i32.const 0
  i32.store
  loop $for-loop|0
   local.get $1
   i32.const 23
   i32.lt_u
   if
    local.get $1
    i32.const 2
    i32.shl
    i32.const 42096
    i32.add
    i32.const 0
    i32.store offset=4
    i32.const 0
    local.set $0
    loop $for-loop|1
     local.get $0
     i32.const 16
     i32.lt_u
     if
      local.get $1
      i32.const 4
      i32.shl
      local.get $0
      i32.add
      i32.const 2
      i32.shl
      i32.const 42096
      i32.add
      i32.const 0
      i32.store offset=96
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      br $for-loop|1
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 42096
  i32.const 43668
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 42096
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/itcms/step (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      global.get $~lib/rt/itcms/state
      br_table $case0|0 $case1|0 $case2|0 $break|0
     end
     i32.const 1
     global.set $~lib/rt/itcms/state
     i32.const 0
     global.set $~lib/rt/itcms/visitCount
     call $~lib/rt/itcms/visitRoots
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/iter
     global.get $~lib/rt/itcms/visitCount
     return
    end
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.set $1
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    local.set $0
    loop $while-continue|1
     local.get $0
     global.get $~lib/rt/itcms/toSpace
     i32.ne
     if
      local.get $0
      global.set $~lib/rt/itcms/iter
      local.get $0
      call $~lib/rt/itcms/Object#get:color
      local.get $1
      i32.ne
      if
       local.get $0
       local.get $1
       call $~lib/rt/itcms/Object#set:color
       i32.const 0
       global.set $~lib/rt/itcms/visitCount
       local.get $0
       i32.const 20
       i32.add
       call $~lib/rt/__visit_members
       global.get $~lib/rt/itcms/visitCount
       return
      end
      local.get $0
      call $~lib/rt/itcms/Object#get:next
      local.set $0
      br $while-continue|1
     end
    end
    i32.const 0
    global.set $~lib/rt/itcms/visitCount
    call $~lib/rt/itcms/visitRoots
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    global.get $~lib/rt/itcms/toSpace
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     local.set $0
     loop $while-continue|0
      local.get $0
      i32.const 42092
      i32.lt_u
      if
       local.get $0
       i32.load
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.const 4
       i32.add
       local.set $0
       br $while-continue|0
      end
     end
     global.get $~lib/rt/itcms/iter
     call $~lib/rt/itcms/Object#get:next
     local.set $0
     loop $while-continue|2
      local.get $0
      global.get $~lib/rt/itcms/toSpace
      i32.ne
      if
       local.get $0
       call $~lib/rt/itcms/Object#get:color
       local.get $1
       i32.ne
       if
        local.get $0
        local.get $1
        call $~lib/rt/itcms/Object#set:color
        local.get $0
        i32.const 20
        i32.add
        call $~lib/rt/__visit_members
       end
       local.get $0
       call $~lib/rt/itcms/Object#get:next
       local.set $0
       br $while-continue|2
      end
     end
     global.get $~lib/rt/itcms/fromSpace
     local.set $0
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/fromSpace
     local.get $0
     global.set $~lib/rt/itcms/toSpace
     local.get $1
     global.set $~lib/rt/itcms/white
     local.get $0
     call $~lib/rt/itcms/Object#get:next
     global.set $~lib/rt/itcms/iter
     i32.const 2
     global.set $~lib/rt/itcms/state
    end
    global.get $~lib/rt/itcms/visitCount
    return
   end
   global.get $~lib/rt/itcms/iter
   local.tee $0
   global.get $~lib/rt/itcms/toSpace
   i32.ne
   if
    local.get $0
    call $~lib/rt/itcms/Object#get:next
    global.set $~lib/rt/itcms/iter
    local.get $0
    call $~lib/rt/itcms/Object#get:color
    global.get $~lib/rt/itcms/white
    i32.eqz
    i32.ne
    if
     i32.const 0
     i32.const 1056
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 42092
    i32.lt_u
    if
     local.get $0
     i32.const 0
     call $~lib/rt/itcms/Object#set:nextWithColor
     local.get $0
     i32.const 0
     call $~lib/rt/itcms/Object#set:prev
    else
     global.get $~lib/rt/itcms/total
     local.get $0
     call $~lib/rt/itcms/Object#get:size
     i32.sub
     global.set $~lib/rt/itcms/total
     local.get $0
     i32.const 4
     i32.add
     local.tee $1
     i32.const 42092
     i32.ge_u
     if
      global.get $~lib/rt/tlsf/ROOT
      i32.eqz
      if
       call $~lib/rt/tlsf/initialize
      end
      global.get $~lib/rt/tlsf/ROOT
      local.set $2
      local.get $1
      i32.const 4
      i32.sub
      local.set $0
      local.get $1
      i32.const 15
      i32.and
      i32.const 1
      local.get $1
      select
      if (result i32)
       i32.const 1
      else
       local.get $0
       i32.load
       i32.const 1
       i32.and
      end
      if
       i32.const 0
       i32.const 1392
       i32.const 562
       i32.const 3
       call $~lib/builtins/abort
       unreachable
      end
      local.get $0
      local.get $0
      i32.load
      i32.const 1
      i32.or
      call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
      local.get $2
      local.get $0
      call $~lib/rt/tlsf/insertBlock
     end
    end
    i32.const 10
    return
   end
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:nextWithColor
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:prev
   i32.const 0
   global.set $~lib/rt/itcms/state
  end
  i32.const 0
 )
 (func $~lib/rt/tlsf/roundSize (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.const 27
  local.get $0
  i32.clz
  i32.sub
  i32.shl
  i32.add
  i32.const 1
  i32.sub
  local.get $0
  local.get $0
  i32.const 536870910
  i32.lt_u
  select
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $1
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   local.get $1
   call $~lib/rt/tlsf/roundSize
   local.tee $1
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $2
   local.get $1
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $1
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const -1
  local.get $1
  i32.shl
  i32.and
  local.tee $1
  if (result i32)
   local.get $0
   local.get $1
   i32.ctz
   local.get $2
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  else
   local.get $0
   i32.load
   i32.const -1
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.tee $1
   if (result i32)
    local.get $0
    local.get $1
    i32.ctz
    local.tee $1
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.tee $2
    i32.eqz
    if
     i32.const 0
     i32.const 1392
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.get $2
    i32.ctz
    local.get $1
    i32.const 4
    i32.shl
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   else
    i32.const 0
   end
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1264
   i32.const 1392
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 12
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.get $1
  i32.const 12
  i32.le_u
  select
  local.tee $1
  call $~lib/rt/tlsf/searchBlock
  local.tee $2
  i32.eqz
  if
   local.get $1
   i32.const 256
   i32.ge_u
   if (result i32)
    local.get $1
    call $~lib/rt/tlsf/roundSize
   else
    local.get $1
   end
   local.set $2
   memory.size
   local.tee $3
   local.get $2
   i32.const 4
   local.get $0
   i32.load offset=1568
   local.get $3
   i32.const 16
   i32.shl
   i32.const 4
   i32.sub
   i32.ne
   i32.shl
   i32.add
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $2
   local.get $2
   local.get $3
   i32.lt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $2
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
   local.get $0
   local.get $3
   i32.const 16
   i32.shl
   memory.size
   i64.extend_i32_s
   i64.const 16
   i64.shl
   call $~lib/rt/tlsf/addMemory
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/searchBlock
   local.tee $2
   i32.eqz
   if
    i32.const 0
    i32.const 1392
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $1
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.gt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  call $~lib/rt/tlsf/removeBlock
  local.get $2
  i32.load
  local.set $3
  local.get $1
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  if
   i32.const 0
   i32.const 1392
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.get $1
  i32.sub
  local.tee $4
  i32.const 16
  i32.ge_u
  if
   local.get $2
   local.get $1
   local.get $3
   i32.const 2
   i32.and
   i32.or
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
   local.get $2
   i32.const 4
   i32.add
   local.get $1
   i32.add
   local.tee $1
   local.get $4
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $2
   local.get $3
   i32.const -2
   i32.and
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
   local.get $2
   i32.const 4
   i32.add
   local.get $2
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $0
   local.get $0
   i32.load
   i32.const -3
   i32.and
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  end
  local.get $2
 )
 (func $~lib/rt/itcms/Object#set:rtId (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=12
 )
 (func $~lib/rt/itcms/Object#set:rtSize (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=16
 )
 (func $~lib/rt/itcms/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741804
  i32.ge_u
  if
   i32.const 1264
   i32.const 1056
   i32.const 261
   i32.const 31
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.ge_u
  if
   block $__inlined_func$~lib/rt/itcms/interrupt$35
    i32.const 2048
    local.set $2
    loop $do-loop|0
     local.get $2
     call $~lib/rt/itcms/step
     i32.sub
     local.set $2
     global.get $~lib/rt/itcms/state
     i32.eqz
     if
      global.get $~lib/rt/itcms/total
      i64.extend_i32_u
      i64.const 200
      i64.mul
      i64.const 100
      i64.div_u
      i32.wrap_i64
      i32.const 1024
      i32.add
      global.set $~lib/rt/itcms/threshold
      br $__inlined_func$~lib/rt/itcms/interrupt$35
     end
     local.get $2
     i32.const 0
     i32.gt_s
     br_if $do-loop|0
    end
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/threshold
    i32.sub
    i32.const 1024
    i32.lt_u
    i32.const 10
    i32.shl
    i32.add
    global.set $~lib/rt/itcms/threshold
   end
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/tlsf/allocateBlock
  local.tee $2
  local.get $1
  call $~lib/rt/itcms/Object#set:rtId
  local.get $2
  local.get $0
  call $~lib/rt/itcms/Object#set:rtSize
  local.get $2
  global.get $~lib/rt/itcms/fromSpace
  global.get $~lib/rt/itcms/white
  call $~lib/rt/itcms/Object#linkTo
  global.get $~lib/rt/itcms/total
  local.get $2
  call $~lib/rt/itcms/Object#get:size
  i32.add
  global.set $~lib/rt/itcms/total
  local.get $2
  i32.const 20
  i32.add
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $~lib/rt/__newBuffer (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/rt/itcms/__new
  local.set $1
  local.get $2
  if
   local.get $1
   local.get $2
   local.get $0
   memory.copy
  end
  local.get $1
 )
 (func $start:~lib/@massalabs/as-types/assembly/argument
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 1104
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/toSpace
  memory.size
  i32.const 16
  i32.shl
  i32.const 42092
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 1312
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/pinSpace
  i32.const 1344
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/fromSpace
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 5
  i32.const 1568
  call $~lib/rt/__newBuffer
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.const 4
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 5
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $0
  local.get $2
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  global.set $~lib/@massalabs/as-types/assembly/argument/NoArg
 )
 (func $~lib/string/String#get:length (param $0 i32) (result i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String.UTF8.encodeUnsafe (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 1744
  local.set $2
  local.get $0
  i32.const 1
  i32.shl
  i32.const 1744
  i32.add
  local.set $3
  local.get $1
  local.set $0
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $2
    i32.load16_u
    local.tee $1
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $0
     local.get $1
     i32.store8
     local.get $0
     i32.const 1
     i32.add
    else
     local.get $1
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $0
      local.get $1
      i32.const 6
      i32.shr_u
      i32.const 192
      i32.or
      local.get $1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.const 8
      i32.shl
      i32.or
      i32.store16
      local.get $0
      i32.const 2
      i32.add
     else
      local.get $1
      i32.const 63488
      i32.and
      i32.const 55296
      i32.eq
      if
       local.get $1
       i32.const 56320
       i32.lt_u
       local.get $2
       i32.const 2
       i32.add
       local.get $3
       i32.lt_u
       i32.and
       if
        local.get $2
        i32.load16_u offset=2
        local.tee $4
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         local.get $0
         local.get $1
         i32.const 1023
         i32.and
         i32.const 10
         i32.shl
         i32.const 65536
         i32.add
         local.get $4
         i32.const 1023
         i32.and
         i32.or
         local.tee $1
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 24
         i32.shl
         local.get $1
         i32.const 6
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 16
         i32.shl
         i32.or
         local.get $1
         i32.const 12
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 8
         i32.shl
         i32.or
         local.get $1
         i32.const 18
         i32.shr_u
         i32.const 240
         i32.or
         i32.or
         i32.store
         local.get $0
         i32.const 4
         i32.add
         local.set $0
         local.get $2
         i32.const 4
         i32.add
         local.set $2
         br $while-continue|0
        end
       end
       i32.const 1808
       i32.const 1872
       i32.const 742
       i32.const 49
       call $~lib/builtins/abort
       unreachable
      end
      local.get $0
      local.get $1
      i32.const 12
      i32.shr_u
      i32.const 224
      i32.or
      local.get $1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.const 8
      i32.shl
      i32.or
      i32.store16
      local.get $0
      local.get $1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=2
      local.get $0
      i32.const 3
      i32.add
     end
    end
    local.set $0
    local.get $2
    i32.const 2
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
 )
 (func $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix" (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#__uset (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
 )
 (func $~lib/rt/itcms/__pin (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $1
   call $~lib/rt/itcms/Object#get:color
   i32.const 3
   i32.eq
   if
    i32.const 9104
    i32.const 1056
    i32.const 338
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   call $~lib/rt/itcms/Object#unlink
   local.get $1
   global.get $~lib/rt/itcms/pinSpace
   i32.const 3
   call $~lib/rt/itcms/Object#linkTo
  end
  local.get $0
 )
 (func $~lib/rt/itcms/__unpin (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  call $~lib/rt/itcms/Object#get:color
  i32.const 3
  i32.ne
  if
   i32.const 9168
   i32.const 1056
   i32.const 352
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/state
  i32.const 1
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#makeGray
  else
   local.get $0
   call $~lib/rt/itcms/Object#unlink
   local.get $0
   global.get $~lib/rt/itcms/fromSpace
   global.get $~lib/rt/itcms/white
   call $~lib/rt/itcms/Object#linkTo
  end
 )
 (func $~lib/rt/itcms/__collect
  global.get $~lib/rt/itcms/state
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    global.get $~lib/rt/itcms/state
    if
     call $~lib/rt/itcms/step
     drop
     br $while-continue|0
    end
   end
  end
  call $~lib/rt/itcms/step
  drop
  loop $while-continue|1
   global.get $~lib/rt/itcms/state
   if
    call $~lib/rt/itcms/step
    drop
    br $while-continue|1
   end
  end
  global.get $~lib/rt/itcms/total
  i64.extend_i32_u
  i64.const 200
  i64.mul
  i64.const 100
  i64.div_u
  i32.wrap_i64
  i32.const 1024
  i32.add
  global.set $~lib/rt/itcms/threshold
 )
 (func $~lib/rt/__visit_globals
  (local $0 i32)
  i32.const 1632
  call $~lib/rt/itcms/__visit
  i32.const 1696
  call $~lib/rt/itcms/__visit
  global.get $assembly/contracts/storage/USERS
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  i32.const 1920
  call $~lib/rt/itcms/__visit
  i32.const 1968
  call $~lib/rt/itcms/__visit
  i32.const 2032
  call $~lib/rt/itcms/__visit
  i32.const 2064
  call $~lib/rt/itcms/__visit
  i32.const 2096
  call $~lib/rt/itcms/__visit
  i32.const 2144
  call $~lib/rt/itcms/__visit
  global.get $assembly/contracts/storage/profileMap
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/contracts/storage/postMap
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/contracts/storage/repostsMap
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/contracts/storage/likesMap
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/contracts/storage/commentsMap
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/contracts/storage/followsMap
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  global.get $assembly/contracts/storage/usersFollowsMap
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  i32.const 2544
  call $~lib/rt/itcms/__visit
  global.get $assembly/contracts/storage/DEFAULT_CATEGORIES
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  i32.const 1152
  call $~lib/rt/itcms/__visit
  i32.const 1456
  call $~lib/rt/itcms/__visit
  i32.const 1264
  call $~lib/rt/itcms/__visit
  i32.const 9104
  call $~lib/rt/itcms/__visit
  i32.const 9168
  call $~lib/rt/itcms/__visit
  i32.const 1808
  call $~lib/rt/itcms/__visit
  i32.const 1600
  call $~lib/rt/itcms/__visit
  global.get $~lib/@massalabs/as-types/assembly/argument/NoArg
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  i32.const 1600
  call $~lib/rt/itcms/__visit
 )
 (func $~lib/array/Array<usize>~visit (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/structs/follow/Follow~visit (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=8
  local.tee $1
  if
   local.get $1
   call $~lib/rt/itcms/__visit
  end
  local.get $0
  i32.load offset=12
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~lib/rt/__visit_members (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  block $folding-inner0
   block $invalid
    block $~lib/staticarray/StaticArray<~lib/string/String>
     block $~lib/array/Array<i32>
      block $~lib/array/Array<assembly/structs/category/Category>
       block $assembly/structs/category/Category
        block $assembly/structs/follow/Follow
         block $assembly/structs/comment/Comment
          block $assembly/structs/like/Like
           block $assembly/structs/repost/Repost
            block $assembly/structs/post/Post
             block $~lib/@massalabs/as-types/assembly/serializable/Serializable
              block $assembly/structs/profile/Profile
               block $~lib/array/Array<usize>
                block $~lib/staticarray/StaticArray<u8>
                 block $~lib/@massalabs/as-types/assembly/argument/Args
                  block $~lib/string/String
                   block $~lib/arraybuffer/ArrayBuffer
                    block $~lib/object/Object
                     local.get $0
                     i32.const 8
                     i32.sub
                     i32.load
                     br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $folding-inner0 $~lib/@massalabs/as-types/assembly/argument/Args $~lib/staticarray/StaticArray<u8> $~lib/array/Array<usize> $assembly/structs/profile/Profile $~lib/@massalabs/as-types/assembly/serializable/Serializable $folding-inner0 $folding-inner0 $assembly/structs/post/Post $folding-inner0 $assembly/structs/repost/Repost $folding-inner0 $assembly/structs/like/Like $folding-inner0 $assembly/structs/comment/Comment $folding-inner0 $assembly/structs/follow/Follow $folding-inner0 $folding-inner0 $assembly/structs/category/Category $~lib/array/Array<assembly/structs/category/Category> $~lib/array/Array<i32> $~lib/staticarray/StaticArray<~lib/string/String> $invalid
                    end
                    return
                   end
                   return
                  end
                  return
                 end
                 local.get $0
                 i32.load offset=4
                 local.tee $0
                 if
                  local.get $0
                  call $~lib/rt/itcms/__visit
                 end
                 return
                end
                return
               end
               local.get $0
               call $~lib/array/Array<usize>~visit
               return
              end
              local.get $0
              i32.load
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=4
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=8
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=12
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=16
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=20
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=24
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=28
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=32
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=36
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=40
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=44
              local.tee $1
              if
               local.get $1
               call $~lib/rt/itcms/__visit
              end
              local.get $0
              i32.load offset=48
              local.tee $0
              if
               local.get $0
               call $~lib/rt/itcms/__visit
              end
              return
             end
             return
            end
            local.get $0
            i32.load offset=8
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=12
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=16
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=20
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=24
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=28
            local.tee $1
            if
             local.get $1
             call $~lib/rt/itcms/__visit
            end
            local.get $0
            i32.load offset=40
            local.tee $0
            if
             local.get $0
             call $~lib/rt/itcms/__visit
            end
            return
           end
           local.get $0
           i32.load offset=16
           local.tee $0
           if
            local.get $0
            call $~lib/rt/itcms/__visit
           end
           return
          end
          local.get $0
          i32.load offset=8
          local.tee $0
          if
           local.get $0
           call $~lib/rt/itcms/__visit
          end
          return
         end
         local.get $0
         i32.load offset=16
         local.tee $1
         if
          local.get $1
          call $~lib/rt/itcms/__visit
         end
         local.get $0
         i32.load offset=20
         local.tee $0
         if
          local.get $0
          call $~lib/rt/itcms/__visit
         end
         return
        end
        local.get $0
        call $assembly/structs/follow/Follow~visit
        return
       end
       local.get $0
       call $assembly/structs/follow/Follow~visit
       return
      end
      global.get $~lib/memory/__stack_pointer
      i32.const 4
      i32.sub
      global.set $~lib/memory/__stack_pointer
      call $~stack_check
      global.get $~lib/memory/__stack_pointer
      i32.const 0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load offset=4
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $1
      local.get $0
      i32.load offset=12
      i32.const 2
      i32.shl
      i32.add
      local.set $3
      loop $while-continue|0
       local.get $1
       local.get $3
       i32.lt_u
       if
        local.get $1
        i32.load
        local.tee $2
        if
         local.get $2
         call $~lib/rt/itcms/__visit
        end
        local.get $1
        i32.const 4
        i32.add
        local.set $1
        br $while-continue|0
       end
      end
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load
      call $~lib/rt/itcms/__visit
      global.get $~lib/memory/__stack_pointer
      i32.const 4
      i32.add
      global.set $~lib/memory/__stack_pointer
      return
     end
     local.get $0
     call $~lib/array/Array<usize>~visit
     return
    end
    local.get $0
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.add
    local.set $1
    loop $while-continue|00
     local.get $0
     local.get $1
     i32.lt_u
     if
      local.get $0
      i32.load
      local.tee $2
      if
       local.get $2
       call $~lib/rt/itcms/__visit
      end
      local.get $0
      i32.const 4
      i32.add
      local.set $0
      br $while-continue|00
     end
    end
    return
   end
   unreachable
  end
  local.get $0
  i32.load
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~start
  call $start:assembly/contracts/storage
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 9324
  i32.lt_s
  if
   i32.const 42112
   i32.const 42160
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/@massalabs/as-types/assembly/serialization/strings/stringToBytes (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  block $folding-inner0
   i32.const 1744
   call $~lib/string/String#get:length
   i32.eqz
   if
    i32.const 0
    i32.const 5
    i32.const 1776
    call $~lib/rt/__newBuffer
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 1744
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1744
   i32.store
   i32.const 1744
   local.set $1
   i32.const 1740
   i32.load
   i32.const 1744
   i32.add
   local.set $2
   loop $while-continue|0
    local.get $1
    local.get $2
    i32.lt_u
    if
     local.get $1
     i32.load16_u
     local.tee $3
     i32.const 128
     i32.lt_u
     if (result i32)
      local.get $0
      i32.const 1
      i32.add
     else
      local.get $3
      i32.const 2048
      i32.lt_u
      if (result i32)
       local.get $0
       i32.const 2
       i32.add
      else
       local.get $3
       i32.const 64512
       i32.and
       i32.const 55296
       i32.eq
       local.get $1
       i32.const 2
       i32.add
       local.get $2
       i32.lt_u
       i32.and
       if
        local.get $1
        i32.load16_u offset=2
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         local.get $0
         i32.const 4
         i32.add
         local.set $0
         local.get $1
         i32.const 4
         i32.add
         local.set $1
         br $while-continue|0
        end
       end
       local.get $0
       i32.const 3
       i32.add
      end
     end
     local.set $0
     local.get $1
     i32.const 2
     i32.add
     local.set $1
     br $while-continue|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 1
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 1744
   i32.store
   i32.const 1744
   call $~lib/string/String#get:length
   local.get $0
   call $~lib/string/String.UTF8.encodeUnsafe
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String.__concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  local.tee $2
  i32.store
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  block $__inlined_func$~lib/string/String#concat$62
   local.get $1
   call $~lib/string/String#get:length
   i32.const 1
   i32.shl
   local.tee $4
   local.get $3
   i32.add
   local.tee $0
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8
    i32.add
    global.set $~lib/memory/__stack_pointer
    i32.const 2192
    local.set $0
    br $__inlined_func$~lib/string/String#concat$62
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store offset=4
   local.get $0
   local.get $2
   local.get $3
   memory.copy
   local.get $0
   local.get $3
   i32.add
   local.get $1
   local.get $4
   memory.copy
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/structs/category/Category#constructor (param $0 i64) (param $1 i32) (param $2 i32) (param $3 i64) (result i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.const 22
  call $~lib/rt/itcms/__new
  local.tee $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $4
  local.get $1
  i32.store offset=8
  local.get $4
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $4
  local.get $2
  i32.store offset=12
  local.get $4
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $3
  i64.store offset=16
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $~lib/array/ensureCapacity (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $2
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 268435455
   i32.gt_u
   if
    i32.const 1456
    i32.const 8992
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   block $__inlined_func$~lib/rt/itcms/__renew$101
    i32.const 1073741820
    local.get $2
    i32.const 1
    i32.shl
    local.tee $2
    local.get $2
    i32.const 1073741820
    i32.ge_u
    select
    local.tee $2
    i32.const 8
    local.get $1
    local.get $1
    i32.const 8
    i32.le_u
    select
    i32.const 2
    i32.shl
    local.tee $1
    local.get $1
    local.get $2
    i32.lt_u
    select
    local.tee $3
    local.get $0
    i32.load
    local.tee $2
    i32.const 20
    i32.sub
    local.tee $4
    i32.load
    i32.const -4
    i32.and
    i32.const 16
    i32.sub
    i32.le_u
    if
     local.get $4
     local.get $3
     call $~lib/rt/itcms/Object#set:rtSize
     local.get $2
     local.set $1
     br $__inlined_func$~lib/rt/itcms/__renew$101
    end
    local.get $3
    local.get $4
    i32.load offset=12
    call $~lib/rt/itcms/__new
    local.tee $1
    local.get $2
    local.get $3
    local.get $4
    i32.load offset=16
    local.tee $4
    local.get $3
    local.get $4
    i32.lt_u
    select
    memory.copy
   end
   local.get $1
   local.get $2
   i32.ne
   if
    local.get $0
    local.get $1
    i32.store
    local.get $0
    local.get $1
    i32.store offset=4
    local.get $0
    local.get $1
    i32.const 0
    call $~lib/rt/itcms/__link
   end
   local.get $0
   local.get $3
   i32.store offset=8
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<assembly/structs/category/Category>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 1152
    i32.const 8992
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   call $~lib/array/ensureCapacity
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $3
   call $~lib/rt/itcms/Object#set:rtId
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $start:assembly/contracts/storage
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  call $start:~lib/@massalabs/as-types/assembly/argument
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  call $~lib/@massalabs/as-types/assembly/serialization/strings/stringToBytes
  global.set $assembly/contracts/storage/USERS
  global.get $~lib/memory/__stack_pointer
  i32.const 2224
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 10
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 2224
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1600
  i32.store offset=16
  i32.const 2224
  i32.const 1600
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  global.set $assembly/contracts/storage/profileMap
  global.get $~lib/memory/__stack_pointer
  i32.const 2272
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 12
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 2272
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1600
  i32.store offset=16
  i32.const 2272
  i32.const 1600
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  global.set $assembly/contracts/storage/postMap
  global.get $~lib/memory/__stack_pointer
  i32.const 2304
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 14
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 2304
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1600
  i32.store offset=16
  i32.const 2304
  i32.const 1600
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  global.set $assembly/contracts/storage/repostsMap
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 16
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1600
  i32.store offset=16
  i32.const 2352
  i32.const 1600
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  global.set $assembly/contracts/storage/likesMap
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 18
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1600
  i32.store offset=16
  i32.const 2400
  i32.const 1600
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  global.set $assembly/contracts/storage/commentsMap
  global.get $~lib/memory/__stack_pointer
  i32.const 2448
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 20
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 2448
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1600
  i32.store offset=16
  i32.const 2448
  i32.const 1600
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  global.set $assembly/contracts/storage/followsMap
  global.get $~lib/memory/__stack_pointer
  i32.const 2496
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 21
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 2496
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1600
  i32.store offset=16
  i32.const 2496
  i32.const 1600
  call $~lib/string/String.__concat
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $"assembly/libraries/PersistentMap/PersistentMap<~lib/string/String,assembly/structs/profile/Profile>#set:_elementPrefix"
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  global.set $assembly/contracts/storage/usersFollowsMap
  global.get $~lib/memory/__stack_pointer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 68
  i32.const 1
  i32.const 0
  call $~lib/rt/__newBuffer
  local.tee $2
  i32.store
  i32.const 16
  i32.const 23
  call $~lib/rt/itcms/__new
  local.tee $0
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.const 0
  call $~lib/rt/itcms/__link
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  i32.const 68
  i32.store offset=8
  local.get $0
  i32.const 17
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2624
  i32.store offset=12
  local.get $0
  i32.const 0
  i64.const 1
  i32.const 2592
  i32.const 2624
  i64.const 13
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 2960
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 3008
  i32.store offset=12
  local.get $0
  i32.const 1
  i64.const 2
  i32.const 2960
  i32.const 3008
  i64.const 16
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 3344
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 3392
  i32.store offset=12
  local.get $0
  i32.const 2
  i64.const 3
  i32.const 3344
  i32.const 3392
  i64.const 15
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 3728
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 3760
  i32.store offset=12
  local.get $0
  i32.const 3
  i64.const 4
  i32.const 3728
  i32.const 3760
  i64.const 21
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4096
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4144
  i32.store offset=12
  local.get $0
  i32.const 4
  i64.const 5
  i32.const 4096
  i32.const 4144
  i64.const 19
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4480
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4512
  i32.store offset=12
  local.get $0
  i32.const 5
  i64.const 6
  i32.const 4480
  i32.const 4512
  i64.const 17
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 4848
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4896
  i32.store offset=12
  local.get $0
  i32.const 6
  i64.const 7
  i32.const 4848
  i32.const 4896
  i64.const 14
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 5232
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 5264
  i32.store offset=12
  local.get $0
  i32.const 7
  i64.const 8
  i32.const 5232
  i32.const 5264
  i64.const 23
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 5600
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 5648
  i32.store offset=12
  local.get $0
  i32.const 8
  i64.const 9
  i32.const 5600
  i32.const 5648
  i64.const 25
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 5984
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 6016
  i32.store offset=12
  local.get $0
  i32.const 9
  i64.const 10
  i32.const 5984
  i32.const 6016
  i64.const 18
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 6352
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 6400
  i32.store offset=12
  local.get $0
  i32.const 10
  i64.const 11
  i32.const 6352
  i32.const 6400
  i64.const 22
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 6736
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 6768
  i32.store offset=12
  local.get $0
  i32.const 11
  i64.const 12
  i32.const 6736
  i32.const 6768
  i64.const 20
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 7104
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 7136
  i32.store offset=12
  local.get $0
  i32.const 12
  i64.const 13
  i32.const 7104
  i32.const 7136
  i64.const 24
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 7472
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 7504
  i32.store offset=12
  local.get $0
  i32.const 13
  i64.const 14
  i32.const 7472
  i32.const 7504
  i64.const 16
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 7840
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 7888
  i32.store offset=12
  local.get $0
  i32.const 14
  i64.const 15
  i32.const 7840
  i32.const 7888
  i64.const 21
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 8224
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8272
  i32.store offset=12
  local.get $0
  i32.const 15
  i64.const 16
  i32.const 8224
  i32.const 8272
  i64.const 19
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  global.get $~lib/memory/__stack_pointer
  i32.const 8608
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8656
  i32.store offset=12
  local.get $0
  i32.const 16
  i64.const 17
  i32.const 8608
  i32.const 8656
  i64.const 15
  call $assembly/structs/category/Category#constructor
  call $~lib/array/Array<assembly/structs/category/Category>#__set
  local.get $0
  global.set $assembly/contracts/storage/DEFAULT_CATEGORIES
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/string/String.__ne (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  i32.eqz
  i32.eqz
 )
 (func $~lib/util/string/joinReferenceArray<~lib/string/String> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  block $folding-inner0
   local.get $1
   i32.const 1
   i32.sub
   local.tee $3
   i32.const 0
   i32.lt_s
   if
    i32.const 2192
    local.set $0
    br $folding-inner0
   end
   local.get $3
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load
    local.tee $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    call $~lib/string/String.__ne
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
    else
     i32.const 2192
     local.set $0
    end
    br $folding-inner0
   end
   i32.const 2192
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 2192
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 2192
   i32.store offset=4
   i32.const 2192
   call $~lib/string/String#get:length
   local.set $5
   loop $for-loop|0
    local.get $3
    local.get $4
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     local.get $4
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     call $~lib/string/String.__ne
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $1
      local.get $2
      call $~lib/string/String.__concat
      local.tee $1
      i32.store offset=8
     end
     local.get $5
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 2192
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.const 2192
      call $~lib/string/String.__concat
      local.tee $1
      i32.store offset=8
     end
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   local.get $3
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $~lib/string/String.__ne
   if
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $1
    local.get $0
    call $~lib/string/String.__concat
    local.tee $1
    i32.store offset=8
   end
   local.get $1
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/contracts/storage/_builduserFollowsKey (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  i32.const 9040
  call $byn$mgfn-shared$export:assembly/contracts/storage/_builduserFollowsKey
 )
 (func $export:assembly/contracts/storage/_buildUserRepostKey (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  i32.const 9072
  call $byn$mgfn-shared$export:assembly/contracts/storage/_builduserFollowsKey
 )
 (func $byn$mgfn-shared$export:assembly/contracts/storage/_builduserFollowsKey (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  local.get $2
  i32.const 0
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=12
  local.get $2
  i32.const 2
  local.get $1
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2192
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 2
  i32.shr_u
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 2192
  i32.store
  local.get $2
  local.get $0
  call $~lib/util/string/joinReferenceArray<~lib/string/String>
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
)
