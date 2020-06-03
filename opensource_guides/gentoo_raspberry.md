# Gentoo Linux, repair a broken disk, OpenPGP, LUKS and LVM. An orgies.

![*the gentoo penguins*](https://steemitimages.com/640x0/https://upload.wikimedia.org/wikipedia/commons/a/a3/Gentoo_Penguin_AdF.jpg)

In our journey, in our adventure, in our war with the *privacy cannibals* we use to find or be found by a few good fellows. This time we use another base system operative, we start to be helped by [**Gentoo Linux**](https://www.gentoo.org/).

This is a very special, historic distribution, his goal is that there's no precompile binary and all the system is optimised for the host hardware. The result is a ultra fast operative system, like the pet that represent it: the [gentoo *rapid swimming* penguin](https://en.wikipedia.org/wiki/Gentoo_penguin).

Speaking about those penguins, i want to do a little parenthesis. I want to speak about [**climate changes**](https://en.wikipedia.org/wiki/Climate_change). And i will not use correct words. **I'm furious**. Furious because we're the real plague in earth. We're hable only to speak about money, luxury and power. There's only a little problem, our world, our earth, the nature that live here, the same nature that after a very long evolution have give us, [*homo sapiens sapiens*](https://en.wikipedia.org/wiki/Homo_sapiens), the opportunity **to be** , is rapidly dying. Because we have not decided to be, we decided to destroy.

Those little, innocent, funny penguins are dying. Because the medium temperature in their natural enviroment have changed, a lot. It's important to understand that a change in a scale of decimal have got devastating effects. I'm not an expert, but there's many documents that can proove this fact. Look a this paper:

[**IAATO ACCE Fact Sheet**](https://iaato.org/documents/10157/100441/ClimateChangeA4.pdf)

If you don't want to read, simply look at this photos that were taken in the same place with a difference of 100 years, the site is in Artic and not in Antartica but the concept is the same:

![climate change](https://steemitimages.com/640x0/https://pbs.twimg.com/media/DW_qtWhWAAAFXlX.jpg)

## Speaking about unix, monitoring and repair SCSI disk

------

But this is an article about computer science and not about nature, because i'm an IT addicted, nature for me is a passion but i don't have the right knowledge to speak about it.

Let's start with deep configuration, the escenario is that we've got a new harddisk in our **Gentoo** host and we want to dedicate it for guest machines in a **QEMU/KVM** enviroment. But the disk it's not *new*, so we've to check it's hardware integrity; we know that is produced by [Hitachi](https://en.wikipedia.org/wiki/Hitachi):

```
taglio@cyberdream ~ $ lsblk --output NAME,MODEL,VENDOR |grep Hitachi
sdb                                                    Hitachi HTS72323 ATA     
taglio@cyberdream ~ $ 
taglio@cyberdream ~ $ sudo blkid | grep sdb
/dev/sdb1: LABEL="Reservado para el sistema" UUID="128A32078A31E7BD" TYPE="ntfs" PARTUUID="410fac6e-01"
/dev/sdb2: UUID="86A83F08A83EF5F1" TYPE="ntfs" PARTUUID="410fac6e-02"
taglio@cyberdream ~ $ 
```

We've found it using `lsblk` and identify the `UUID` of two active partitions in it using `blkid` with root power. Now let's check errors with `smartctl`:

```
taglio@cyberdream ~ $ emerge -s smartmontools
  
[ Results for search key : smartmontools ]
Searching...

*  sys-apps/smartmontools
      Latest version available: 6.6
      Latest version installed: 6.6
      Size of files: 883 KiB
      Homepage:      https://www.smartmontools.org
      Description:   Tools to monitor storage systems to provide advanced warning of disk degradation
      License:       GPL-2

[ Applications found : 1 ]

taglio@cyberdream ~ $
taglio@cyberdream ~ $ sudo emerge -av smartmontools
...
taglio@cyberdream ~ $
taglio@cyberdream ~ $ sudo rc-config add smartd default
Adding smartd to following runlevels
  default                   [done]
taglio@cyberdream ~ $ 
taglio@cyberdream ~ $ sudo rc-config start smartd
Starting init script
smartd            | * Starting smartd ...                                                                                 [ ok ]
taglio@cyberdream ~ $ 
taglio@cyberdream ~ $ sudo smartctl -x /dev/sdb
smartctl 6.6 2017-11-05 r4594 [x86_64-linux-4.9.76-gentoo-r18828] (local build)
Copyright (C) 2002-17, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Device Model:     Hitachi HTS723232A7A364
Serial Number:    E3834563HMKERN
LU WWN Device Id: 5 000cca 61dd6fc08
Firmware Version: EC2OA60W
User Capacity:    320,072,933,376 bytes [320 GB]
Sector Size:      512 bytes logical/physical
Rotation Rate:    7200 rpm
Form Factor:      2.5 inches
Device is:        Not in smartctl database [for details use: -P showall]
ATA Version is:   ATA8-ACS T13/1699-D revision 6
SATA Version is:  SATA 2.6, 3.0 Gb/s
Local Time is:    Wed Mar  7 16:40:33 2018 CET
SMART support is: Available - device has SMART capability.
SMART support is: Enabled
AAM feature is:   Unavailable
APM level is:     128 (minimum power consumption without standby)
Rd look-ahead is: Enabled
Write cache is:   Disabled
DSN feature is:   Unavailable
ATA Security is:  Disabled, frozen [SEC2]
Wt Cache Reorder: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: FAILED!
Drive failure expected in less than 24 hours. SAVE ALL DATA.
See vendor-specific Attribute list for failed Attributes.

General SMART Values:
Offline data collection status:  (0x00) Offline data collection activity
                    was never started.
                    Auto Offline Data Collection: Disabled.
Self-test execution status:      (  73) The previous self-test completed having
                    a test element that failed and the test
                    element that failed is not known.
Total time to complete Offline 
data collection:        (   45) seconds.
Offline data collection
capabilities:            (0x51) SMART execute Offline immediate.
                    No Auto Offline data collection support.
                    Suspend Offline collection upon new
                    command.
                    No Offline surface scan supported.
                    Self-test supported.
                    No Conveyance Self-test supported.
                    Selective Self-test supported.
SMART capabilities:            (0x0003) Saves SMART data before entering
                    power-saving mode.
                    Supports SMART auto save timer.
Error logging capability:        (0x01) Error logging supported.
                    General Purpose Logging supported.
Short self-test routine 
recommended polling time:    (   2) minutes.
Extended self-test routine
recommended polling time:    (  78) minutes.
SCT capabilities:          (0x003d) SCT Status supported.
                    SCT Error Recovery Control supported.
                    SCT Feature Control supported.
                    SCT Data Table supported.

SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAGS    VALUE WORST THRESH FAIL RAW_VALUE
  1 Raw_Read_Error_Rate     POSR-K   087   025   062    Past 3342383
  2 Throughput_Performance  P-S--K   100   100   040    -    0
  3 Spin_Up_Time            PO---K   243   100   033    -    1
  4 Start_Stop_Count        -O--CK   096   096   000    -    6522
  5 Reallocated_Sector_Ct   PO--CK   001   001   005    NOW  2307 (0 2079)
  7 Seek_Error_Rate         POSR-K   100   099   067    -    0
  8 Seek_Time_Performance   P-S--K   100   100   040    -    0
  9 Power_On_Hours          -O--CK   069   069   000    -    13986
 10 Spin_Retry_Count        PO--CK   100   100   060    -    0
 12 Power_Cycle_Count       -O--CK   097   097   000    -    5749
183 Runtime_Bad_Block       -O--CK   100   100   000    -    0
184 End-to-End_Error        PO--CK   100   100   097    -    0
187 Reported_Uncorrect      -O--CK   100   006   000    -    251268471652846
188 Command_Timeout         -O--CK   100   001   000    -    3633959802393
190 Airflow_Temperature_Cel -O---K   073   049   045    -    27 (Min/Max 26/27)
191 G-Sense_Error_Rate      -O--CK   001   001   000    -    65755
192 Power-Off_Retract_Count -O--CK   100   100   000    -    10158235
193 Load_Cycle_Count        -O--CK   049   049   000    -    513620
196 Reallocated_Event_Count -O--CK   009   009   000    -    2262
197 Current_Pending_Sector  -O--CK   091   057   000    -    444
198 Offline_Uncorrectable   ----CK   100   100   000    -    0
199 UDMA_CRC_Error_Count    -OS-CK   100   100   000    -    1
223 Load_Retry_Count        -O-R-K   100   100   000    -    0
                            ||||||_ K auto-keep
                            |||||__ C event count
                            ||||___ R error rate
                            |||____ S speed/performance
                            ||_____ O updated online
                            |______ P prefailure warning

General Purpose Log Directory Version 1
SMART           Log Directory Version 1 [multi-sector log support]
Address    Access  R/W   Size  Description
0x00       GPL,SL  R/O      1  Log Directory
0x01           SL  R/O      1  Summary SMART error log
0x02           SL  R/O      1  Comprehensive SMART error log
0x03       GPL     R/O      1  Ext. Comprehensive SMART error log
0x04       GPL     R/O      7  Device Statistics log
0x06           SL  R/O      1  SMART self-test log
0x07       GPL     R/O      1  Extended self-test log
0x09           SL  R/W      1  Selective self-test log
0x10       GPL     R/O      1  NCQ Command Error log
0x11       GPL     R/O      1  SATA Phy Event Counters log
0x80-0x9f  GPL,SL  R/W     16  Host vendor specific log
0xe0       GPL,SL  R/W      1  SCT Command/Status
0xe1       GPL,SL  R/W      1  SCT Data Transfer

SMART Extended Comprehensive Error Log Version: 1 (1 sectors)
Device Error Count: 31665 (device log contains only the most recent 4 errors)
    CR     = Command Register
    FEATR  = Features Register
    COUNT  = Count (was: Sector Count) Register
    LBA_48 = Upper bytes of LBA High/Mid/Low Registers ]  ATA-8
    LH     = LBA High (was: Cylinder High) Register    ]   LBA
    LM     = LBA Mid (was: Cylinder Low) Register      ] Register
    LL     = LBA Low (was: Sector Number) Register     ]
    DV     = Device (was: Device/Head) Register
    DC     = Device Control Register
    ER     = Error register
    ST     = Status register
Powered_Up_Time is measured from power on, and printed as
DDd+hh:mm:SS.sss where DD=days, hh=hours, mm=minutes,
SS=sec, and sss=millisec. It "wraps" after 49.710 days.

Error 31665 [0] occurred at disk power-on lifetime: 13986 hours (582 days + 18 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER -- ST COUNT  LBA_48  LH LM LL DV DC
  -- -- -- == -- == == == -- -- -- -- --
  40 -- 51 00 01 00 00 00 03 2b 97 00 00  Error: UNC at LBA = 0x00032b97 = 207767

  Commands leading to the command that caused the error were:
  CR FEATR COUNT  LBA_48  LH LM LL DV DC  Powered_Up_Time  Command/Feature_Name
  -- == -- == -- == == == -- -- -- -- --  ---------------  --------------------
  60 00 08 00 b0 00 00 00 03 2b 90 40 00     00:36:04.809  READ FPDMA QUEUED
  60 00 08 00 a8 00 00 00 03 2b 88 40 00     00:36:03.852  READ FPDMA QUEUED
  60 00 08 00 a0 00 00 00 03 2b 80 40 00     00:36:03.852  READ FPDMA QUEUED
  60 00 08 00 98 00 00 00 03 2b 78 40 00     00:36:03.851  READ FPDMA QUEUED
  60 00 08 00 90 00 00 00 03 2b 70 40 00     00:36:03.851  READ FPDMA QUEUED

Error 31664 [3] occurred at disk power-on lifetime: 13986 hours (582 days + 18 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER -- ST COUNT  LBA_48  LH LM LL DV DC
  -- -- -- == -- == == == -- -- -- -- --
  40 -- 51 00 4a 00 00 00 03 2b b6 00 00  Error: UNC at LBA = 0x00032bb6 = 207798

  Commands leading to the command that caused the error were:
  CR FEATR COUNT  LBA_48  LH LM LL DV DC  Powered_Up_Time  Command/Feature_Name
  -- == -- == -- == == == -- -- -- -- --  ---------------  --------------------
  60 01 00 00 88 00 00 00 03 2b 00 40 00     00:36:01.150  READ FPDMA QUEUED
  60 01 00 00 80 00 00 00 03 2a 00 40 00     00:36:01.043  READ FPDMA QUEUED
  60 00 f0 00 78 00 00 00 03 29 10 40 00     00:36:01.042  READ FPDMA QUEUED
  60 00 90 00 70 00 00 00 03 28 80 40 00     00:36:01.041  READ FPDMA QUEUED
  60 00 38 00 68 00 00 00 03 28 40 40 00     00:36:01.041  READ FPDMA QUEUED

Error 31663 [2] occurred at disk power-on lifetime: 13986 hours (582 days + 18 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER -- ST COUNT  LBA_48  LH LM LL DV DC
  -- -- -- == -- == == == -- -- -- -- --
  40 -- 51 00 1c 00 00 00 03 2b e4 00 00  Error: UNC at LBA = 0x00032be4 = 207844

  Commands leading to the command that caused the error were:
  CR FEATR COUNT  LBA_48  LH LM LL DV DC  Powered_Up_Time  Command/Feature_Name
  -- == -- == -- == == == -- -- -- -- --  ---------------  --------------------
  60 01 00 00 48 00 00 00 03 2b 00 40 00     00:35:31.764  READ FPDMA QUEUED
  60 01 00 00 40 00 00 00 03 2a 00 40 00     00:35:31.738  READ FPDMA QUEUED
  60 00 f0 00 38 00 00 00 03 29 10 40 00     00:35:31.731  READ FPDMA QUEUED
  60 00 90 00 30 00 00 00 03 28 80 40 00     00:35:31.730  READ FPDMA QUEUED
  60 00 38 00 28 00 00 00 03 28 40 40 00     00:35:31.730  READ FPDMA QUEUED

Error 31662 [1] occurred at disk power-on lifetime: 13985 hours (582 days + 17 hours)
  When the command that caused the error occurred, the device was active or idle.

  After command completion occurred, registers were:
  ER -- ST COUNT  LBA_48  LH LM LL DV DC
  -- -- -- == -- == == == -- -- -- -- --
  40 -- 51 00 08 00 00 00 03 2b d0 00 00  Error: UNC at LBA = 0x00032bd0 = 207824

  Commands leading to the command that caused the error were:
  CR FEATR COUNT  LBA_48  LH LM LL DV DC  Powered_Up_Time  Command/Feature_Name
  -- == -- == -- == == == -- -- -- -- --  ---------------  --------------------
  60 00 08 00 d0 00 00 00 03 2b d0 40 00     00:01:48.238  READ FPDMA QUEUED
  b0 00 d5 00 01 00 00 00 c2 4f 01 00 00     00:01:47.992  SMART READ LOG
  60 00 08 00 b0 00 00 00 03 2b c8 40 00     00:01:47.905  READ FPDMA QUEUED
  b0 00 d5 00 01 00 00 00 c2 4f 06 00 00     00:01:47.659  SMART READ LOG
  60 00 08 00 90 00 00 00 03 2b c0 40 00     00:01:47.406  READ FPDMA QUEUED

SMART Extended Self-test Log Version: 1 (1 sectors)
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Short offline       Completed: unknown failure    90%     13985         0
# 2  Short offline       Completed: read failure       90%     10168         28292250
# 3  Short offline       Completed: read failure       90%     10168         28292250
# 4  Extended offline    Completed: read failure       90%     10165         353774
# 5  Short offline       Completed: read failure       90%     10165         353774
# 6  Extended offline    Completed without error       00%      9306         -
# 7  Short offline       Completed without error       00%      9304         -
# 8  Extended offline    Completed without error       00%      9304         -
# 9  Short offline       Completed without error       00%      9303         -
#10  Short offline       Completed without error       00%      9275         -
#11  Short offline       Completed without error       00%      9213         -
#12  Short offline       Completed without error       00%      9110         -
#13  Short offline       Completed without error       00%      9095         -
#14  Short offline       Completed without error       00%      9072         -
#15  Short offline       Completed without error       00%      9008         -
#16  Short offline       Completed without error       00%      8959         -
#17  Short offline       Aborted by host               80%      6559         -
#18  Short offline       Completed without error       00%         4         -

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.

SCT Status Version:                  3
SCT Version (vendor specific):       256 (0x0100)
SCT Support Level:                   1
Device State:                        Active (0)
Current Temperature:                    27 Celsius
Power Cycle Min/Max Temperature:     26/27 Celsius
Lifetime    Min/Max Temperature:      3/51 Celsius
Lifetime    Average Temperature:        32 Celsius
Under/Over Temperature Limit Count:   0/0

SCT Temperature History Version:     2
Temperature Sampling Period:         1 minute
Temperature Logging Interval:        1 minute
Min/Max recommended Temperature:      0/60 Celsius
Min/Max Temperature Limit:           -40/65 Celsius
Temperature History Size (Index):    128 (104)

Index    Estimated Time   Temperature Celsius
 105    2018-03-07 14:33    27  ********
 ...    ..( 13 skipped).    ..  ********
 119    2018-03-07 14:47    27  ********
 120    2018-03-07 14:48    26  *******
 ...    ..( 10 skipped).    ..  *******
   3    2018-03-07 14:59    26  *******
   4    2018-03-07 15:00    27  ********
   5    2018-03-07 15:01    26  *******
   6    2018-03-07 15:02    26  *******
   7    2018-03-07 15:03    27  ********
   8    2018-03-07 15:04    26  *******
   9    2018-03-07 15:05    26  *******
  10    2018-03-07 15:06    27  ********
  11    2018-03-07 15:07    27  ********
  12    2018-03-07 15:08    26  *******
  13    2018-03-07 15:09    27  ********
  14    2018-03-07 15:10    27  ********
  15    2018-03-07 15:11    26  *******
  16    2018-03-07 15:12    26  *******
  17    2018-03-07 15:13    27  ********
  18    2018-03-07 15:14    26  *******
  19    2018-03-07 15:15    27  ********
 ...    ..(  9 skipped).    ..  ********
  29    2018-03-07 15:25    27  ********
  30    2018-03-07 15:26    26  *******
  31    2018-03-07 15:27    26  *******
  32    2018-03-07 15:28    27  ********
  33    2018-03-07 15:29    27  ********
  34    2018-03-07 15:30    27  ********
  35    2018-03-07 15:31    26  *******
  36    2018-03-07 15:32    27  ********
  37    2018-03-07 15:33    27  ********
  38    2018-03-07 15:34    27  ********
  39    2018-03-07 15:35    26  *******
  40    2018-03-07 15:36    27  ********
  41    2018-03-07 15:37    27  ********
  42    2018-03-07 15:38    26  *******
  43    2018-03-07 15:39    27  ********
  44    2018-03-07 15:40    27  ********
  45    2018-03-07 15:41    27  ********
  46    2018-03-07 15:42    26  *******
  47    2018-03-07 15:43    26  *******
  48    2018-03-07 15:44    27  ********
  49    2018-03-07 15:45    27  ********
  50    2018-03-07 15:46    26  *******
  51    2018-03-07 15:47    27  ********
  52    2018-03-07 15:48    26  *******
  53    2018-03-07 15:49    26  *******
  54    2018-03-07 15:50     ?  -
  55    2018-03-07 15:51    27  ********
 ...    ..(  3 skipped).    ..  ********
  59    2018-03-07 15:55    27  ********
  60    2018-03-07 15:56    26  *******
  61    2018-03-07 15:57    27  ********
 ...    ..( 12 skipped).    ..  ********
  74    2018-03-07 16:10    27  ********
  75    2018-03-07 16:11    26  *******
  76    2018-03-07 16:12    27  ********
  77    2018-03-07 16:13    27  ********
  78    2018-03-07 16:14    27  ********
  79    2018-03-07 16:15    26  *******
  80    2018-03-07 16:16    27  ********
 ...    ..( 23 skipped).    ..  ********
 104    2018-03-07 16:40    27  ********

SCT Error Recovery Control:
           Read:     85 (8.5 seconds)
          Write:     85 (8.5 seconds)

Device Statistics (GP Log 0x04)
Page  Offset Size        Value Flags Description
0x01  =====  =               =  ===  == General Statistics (rev 1) ==
0x01  0x008  4            5749  ---  Lifetime Power-On Resets
0x01  0x010  4           13986  ---  Power-on Hours
0x01  0x018  6     23880099276  ---  Logical Sectors Written
0x01  0x020  6       525642514  ---  Number of Write Commands
0x01  0x028  6     44822287873  ---  Logical Sectors Read
0x01  0x030  6       954672703  ---  Number of Read Commands
0x03  =====  =               =  ===  == Rotating Media Statistics (rev 1) ==
0x03  0x008  4           13288  ---  Spindle Motor Power-on Hours
0x03  0x010  4           13250  ---  Head Flying Hours
0x03  0x018  4          513621  ---  Head Load Events
0x03  0x020  4            2079  ---  Number of Reallocated Logical Sectors
0x03  0x028  4         1381497  ---  Read Recovery Attempts
0x03  0x030  4               2  ---  Number of Mechanical Start Failures
0x04  =====  =               =  ===  == General Errors Statistics (rev 1) ==
0x04  0x008  4             494  ---  Number of Reported Uncorrectable Errors
0x04  0x010  4            5657  ---  Resets Between Cmd Acceptance and Completion
0x05  =====  =               =  ===  == Temperature Statistics (rev 1) ==
0x05  0x008  1              27  ---  Current Temperature
0x05  0x010  1              26  N--  Average Short Term Temperature
0x05  0x018  1              33  N--  Average Long Term Temperature
0x05  0x020  1              51  ---  Highest Temperature
0x05  0x028  1               3  ---  Lowest Temperature
0x05  0x030  1              41  N--  Highest Average Short Term Temperature
0x05  0x038  1              24  N--  Lowest Average Short Term Temperature
0x05  0x040  1              38  N--  Highest Average Long Term Temperature
0x05  0x048  1              25  N--  Lowest Average Long Term Temperature
0x05  0x050  4               0  ---  Time in Over-Temperature
0x05  0x058  1              60  ---  Specified Maximum Operating Temperature
0x05  0x060  4               0  ---  Time in Under-Temperature
0x05  0x068  1               0  ---  Specified Minimum Operating Temperature
0x06  =====  =               =  ===  == Transport Statistics (rev 1) ==
0x06  0x008  4           13637  ---  Number of Hardware Resets
0x06  0x010  4            2565  ---  Number of ASR Events
0x06  0x018  4               1  ---  Number of Interface CRC Errors
                                |||_ C monitored condition met
                                ||__ D supports DSN
                                |___ N normalized value

Pending Defects log (GP Log 0x0c) not supported

SATA Phy Event Counters (GP Log 0x11)
ID      Size     Value  Description
0x0001  2            0  Command failed due to ICRC error
0x0002  2            0  R_ERR response for data FIS
0x0003  2            0  R_ERR response for device-to-host data FIS
0x0004  2            0  R_ERR response for host-to-device data FIS
0x0005  2            0  R_ERR response for non-data FIS
0x0006  2            0  R_ERR response for device-to-host non-data FIS
0x0007  2            0  R_ERR response for host-to-device non-data FIS
0x0009  2            2  Transition from drive PhyRdy to drive PhyNRdy
0x000a  2            2  Device-to-host register FISes sent due to a COMRESET
0x000b  2            0  CRC errors within host-to-device FIS
0x000d  2            0  Non-CRC errors within host-to-device FIS

taglio@cyberdream ~ $ 
```

With `-x` we're printing all **SMART** and non-SMART information about the device. It's the same than using `-H -i -g all -A -l error -l selftest -l background -l sasphy` that mean:

1. `-H` prints the health status of the device.
2. `-i` *unknown.*
3. `-g all` get all **non-SMART** device settings.
4. `-A` For SCSI devices the "attributes" are obtained from the temperature and start-stop cycle counter log pages. Certain vendor specific attributes are listed if recognised. The attributes are output in a relatively free format (compared with ATA disk attributes).
5. `-l error` in `SCSI` prints the error counter log pages for reads, write and verifies. The verify row is only output if it has an element other than zero.
6. `-l selftest` in `SCSI` It identifies the test that failed and consists of either the number of the segment that failed during the test, or the number of the test that failed and the number of the segment in which the test was run, using a vendor-specific method of putting both numbers into a single byte. The Logical Block Address (LBA) of the first error is printed in hexadecimal notation.
7. `-l background` in `SCSI` he background scan results log outputs information derived from Background Media Scans (BMS) done after power up and/or periodically (e.g. every 24 hours) on recent SCSI disks.
8. `-l sasphy` in `SCSI` prints values and descriptions of the SAS (SSP) Protocol Specific log page (log page 0x18).

As we can appreciate from the selftest's results there are various error in this harddisk. Now we put the harddisk in `offline` mode and launch the `long` test:

```
taglio@cyberdream ~ $ sudo smartctl -t offline /dev/sdb
taglio@cyberdream ~ $ sudo smartctl -t long /dev/sdb
taglio@cyberdream ~ $ sudo smartctl -A /dev/sdb
```

Now we try to repair bad blocks using an other utility:

```
taglio@cyberdream ~ $ sudo emerge -av sys-block/hdrecover
taglio@cyberdream ~ $ sudo hdrecover /dev/sdb
```

recheck the `SMART` status with `smartctl -A` and verify that `Current_Pending_Sector` is now 0 and
`Reallocated_Event_Count` will have risen by the number of sectors the drive decided to reallocate. Remember that `hdrecover` will destroy data.

## New partition table, partition, cipher and LVM

------

![gnome Parted](https://steemitimages.com/640x0/https://upload.wikimedia.org/wikipedia/commons/6/64/GParted.png)

Now that we've hopefully repair our disk we can inizialize it:

```
taglio@cyberdream ~ $ sudo parted -a optimal /dev/sdb
Password:  
GNU Parted 3.2
Using /dev/sdb
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) mktable gpt                                                      
Warning: The existing disk label on /dev/sdb will be destroyed and all data on
this disk will be lost. Do you want to continue?
Yes/No? Yes                                                               
(parted) unit s
(parted) print free                                                       
Model: ATA Hitachi HTS72323 (scsi)
Disk /dev/sdb: 625142448s
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags: 

Number  Start  End         Size        File system  Name  Flags
        34s    625142414s  625142381s  Free Space

(parted) mkpart primary 2048s 625141760s
(parted) print                                                            
Model: ATA Hitachi HTS72323 (scsi)
Disk /dev/sdb: 625142448s
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags: 

Number  Start  End         Size        File system  Name     Flags
 1      2048s  625141760s  625139713s               primary

(parted) quit
```

This is the best way we can create a new `gpt` disk table and a new primary partition. We've to select the correct start and end sector using this formula:

```
taglio@cyberdream ~ $ echo "$((((34 + 2047) / 2048) * 2048))s $((625142414 - (625142414 % 2048)))s"
2048s 625141760s
taglio@cyberdream ~ $ 
```

Next we're going to create a `urandom` seed of `8192KiB` that will be encrypted with **OpenPGP**.

```
taglio@cyberdream ~/.gnupg/disk_seed $ dd if=/dev/urandom bs=8388607 count=1 | gpg --symmetric --cipher-algo AES256 --output luks-key.gpg
1+0 records in
1+0 records out
8388607 bytes (8.4 MB, 8.0 MiB) copied, 10.7103 s, 783 kB/s
taglio@cyberdream ~/.gnupg/disk_seed $ du -h luks-key.gpg 
8.1M    luks-key.gpg
taglio@cyberdream ~/.gnupg/disk_seed $ 
```

We've encrypt using the cipher `AES256`, in my machine there's a lot more available:

```
taglio@cyberdream ~/.gnupg/disk_seed $ gpg --version
gpg (GnuPG) 2.2.5
libgcrypt 1.8.2
Copyright (C) 2018 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Home: /home/taglio/.gnupg
Supported algorithms:
Pubkey: RSA, ELG, DSA, ECDH, ECDSA, EDDSA
Cipher: IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH,
        CAMELLIA128, CAMELLIA192, CAMELLIA256
Hash: SHA1, RIPEMD160, SHA256, SHA384, SHA512, SHA224
Compression: Uncompressed, ZIP, ZLIB, BZIP2
taglio@cyberdream ~/.gnupg/disk_seed $ 
```

Next we will pipe our `urandom` seed to `cryptsetup`, the Linux utility to manipulate [`LUKS` ](https://gitlab.com/cryptsetup/cryptsetup/blob/master/README.md).

```
taglio@cyberdream ~/.gnupg/disk_seed $ su
Password: 
cyberdream /home/taglio/.gnupg/disk_seed # gpg --decrypt luks-key.gpg | cryptsetup --cipher serpent-xts-plain64 --key-size 512 --hash whirlpool --key-file - luksFormat /dev/sdb1
gpg: AES256 encrypted data
gpg: encrypted with 1 passphrase
cyberdream /home/taglio/.gnupg/disk_seed # cryptsetup luksDump /dev/sdb1
LUKS header information for /dev/sdb1

Version:        1
Cipher name:    serpent
Cipher mode:    xts-plain64
Hash spec:      whirlpool
Payload offset: 4096
MK bits:        512
MK digest:      a2 2b 25 4e 6b 24 eb 59 38 be b5 2c 1d c8 ab 2f 79 f2 e3 6b 
MK salt:        be a5 be c9 40 76 92 bc 1b e7 89 24 56 ec 31 ab 
                de 44 d7 a4 54 b9 7f 10 ff 33 52 7c fe 35 f9 7f 
MK iterations:  215250
UUID:           5416f85d-ea43-4b3e-bb06-d125900145ab

Key Slot 0: ENABLED
    Iterations:             1726812
    Salt:                   45 07 5a 07 6c 56 5c e8 3d eb 2f 3a a5 e2 7f d8 
                            17 a6 cc 35 6a 61 a4 23 c5 1f 87 2a c6 3f d2 b5 
    Key material offset:    8
    AF stripes:             4000
Key Slot 1: DISABLED
Key Slot 2: DISABLED
Key Slot 3: DISABLED
Key Slot 4: DISABLED
Key Slot 5: DISABLED
Key Slot 6: DISABLED
Key Slot 7: DISABLED
```

Let's understand the meaning of `cryptsetup` options:

1. `--cipher serpent-xts-plain64` we've selected encryption cipher [**serpent**](https://en.wikipedia.org/wiki/Serpent_(cipher)), encryption mode [**xts**](https://en.wikipedia.org/wiki/Disk_encryption_theory#XTS) and Initial Vector (IV) generator **plain64** (*The IV offset is a sector count that is added to the sector number before creating the IV. It can be used to create a map that starts after the first encrypted sector. Usually you'll set it to zero except your device is only partially available or you need to configure some mode compatible with other encryption system.*).
2. `--key-size 512` sets key size in bits. The argument has to be a multiple of 8. The possible key-sizes are limited by the cipher and mode used.
3. `--hash whirlpool` Specifies the hash used in the LUKS key setup scheme and volume key digest for luksFormat. The specified hash is used as hash-parameter for PBKDF2 and for the AF splitter. We have select [**whirlpool**](https://en.wikipedia.org/wiki/Whirlpool_(cryptography))
4. `--key-file -` got the key file from the piped result of `gpg --decrypt`
5. `luksFormat /dev/sdb1` formats `sdb1` as LUKS device

With the `luksDump sdb1` command we want to be sure that our `luksFormat` was good as you can see from the output.

Now we open the encrypted device and create a physical volume and a volume group for [**LVM**](https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)).

```
cyberdream /home/taglio/.gnupg/disk_seed # echo RELOADAGENT | gpg-connect-agent
OK
cyberdream /home/taglio/.gnupg/disk_seed # gpg --decrypt luks-key.gpg | cryptsetup --key-file - luksOpen /dev/sdb1 virtualrepo
gpg: AES256 encrypted data
gpg: encrypted with 1 passphrase
cyberdream /home/taglio/.gnupg/disk_seed # ls -al /dev/mapper/virtualrepo 
lrwxrwxrwx 1 root root 7 Mar  8 12:04 /dev/mapper/virtualrepo -> ../dm-4
cyberdream /home/taglio/.gnupg/disk_seed # pvcreate /dev/mapper/virtualrepo 
  Physical volume "/dev/mapper/virtualrepo" successfully created.
cyberdream /home/taglio/.gnupg/disk_seed # vgcreate vg3 /dev/mapper/virtualrepo 
  Volume group "vg3" successfully created
cyberdream /home/taglio/.gnupg/disk_seed # 
```

With the `RELOADAGENT` we indicate to `gpg-agent` to restart it. Next we map the crypto device /dev/sdb1 in the virtual device `/dev/mapper/virtualrepo`.

The last thing we're doing for our **QEMU/KVM** enviroment with direct **LVM** disk access is create a physical volume that will be used to store the volume group on with `pvcreate /dev/mapper/virtualrepo` and the create a volume that will be used to store the logical volumes on with `vgcreate vg3 /dev/mapper/virtualrepo`. More informations about **Gentoo** and **LVM** can be found [here](https://wiki.gentoo.org/wiki/LVM).



# Cross compile in Gentoo to obtain a custom Raspberry Pi 3 firmware.

## ¿What is a cross compiler?

------

![a bridge crossing the ocean](https://steemitimages.com/640x0/https://images6.alphacoders.com/480/thumb-1920-480025.jpg)

First of all a *compiler* is a computer software that translate one *programming language* to another. To be more exact, it normally translate a **high level** source programming language code to a **low level** one. For example the `gcc` compiler translate `C` source code in `asm` (**assembler**) machine code.

A *cross compiler* is a compiler that generete machine code for a different *architecture* respect the one where the compiler is executed. The example that we will explain in this guide is **from x64 intel processor to a quad-core ARM Cortex A53 (ARMv8) cluster, classificated under the arm64 family**.

## Gentoo cross compiling environment

------

![gentoo penguin](https://steemitimages.com/640x0/https://c402277.ssl.cf1.rackcdn.com/photos/1560/images/story_full_width/HI_292876WHYMatter1.jpg?1345547525)

[The Gentoo Linux distribution](https://www.gentoo.org/) have got a script package that simplify the life of a *system administrator* speaking about the work of preparing the correct *cross compiler environment*. Its name is [**crossdev**](https://packages.gentoo.org/packages/sys-devel/crossdev). These are the steps to obtain a working `arm64` compile environment.

First of all we `emerge` the package using the options:

- `-a` Before performing the action, display what will take place
  then ask whether to proceed with the action or abort.
  Using --ask is more efficient than using --pretend and then exe‐
  cuting the same command without --pretend, as dependencies will
  only need to be calculated once.
- `-v` Tell emerge to run in verbose mode.

```
cyberdream /home/taglio # emerge -av crossdev

These are the packages that would be merged, in order:

Calculating dependencies... done!
[ebuild  N     ] sys-devel/crossdev-20171230::gentoo  23 KiB

Total: 1 package (1 new), Size of downloads: 23 KiB

Would you like to merge these packages? [Yes/No] Yes
>>> Verifying ebuild manifests
>>> Emerging (1 of 1) sys-devel/crossdev-20171230::gentoo
>>> Installing (1 of 1) sys-devel/crossdev-20171230::gentoo
>>> Recording sys-devel/crossdev in "world" favorites file...
>>> Jobs: 1 of 1 complete                           Load avg: 0.67, 0.55, 0.29

 * Messages for package sys-devel/crossdev-20171230:

 * Package:    sys-devel/crossdev-20171230
 * Repository: gentoo
 * Maintainer: crossdev@gentoo.org embedded@gentoo.org
 * USE:        abi_x86_64 amd64 elibc_glibc kernel_linux userland_GNU
 * FEATURES:   preserve-libs sandbox userpriv usersandbox
 * Final size of build directory: 196 KiB
 * Final size of installed tree:  204 KiB
 >>> Auto-cleaning packages...

>>> No outdated packages were found on your system.

 * GNU info directory index is up-to-date.
 
cyberdream /home/taglio #
```

Next we've got to configure an [**overlay **](https://wiki.gentoo.org/wiki/Project:Overlays/Overlays_guide) to use with `crossdev`.

- Make correct tree directories using the [**Gentoo portage**](https://wiki.gentoo.org/wiki/Portage) instructions.

```
cyberdream /usr/local # mkdir -pv /usr/local/portage-crossdev/{profiles,metadata}
mkdir: created directory '/usr/local/portage-crossdev'
mkdir: created directory '/usr/local/portage-crossdev/profiles'
mkdir: created directory '/usr/local/portage-crossdev/metadata'
cyberdream /usr/local # echo 'crossdev' > /usr/local/portage-crossdev/profiles/repo_name
cyberdream /usr/local # echo 'masters = gentoo' > /usr/local/portage-crossdev/metadata/layout.conf
cyberdream /usr/local # chown -R portage:portage /usr/local/portage-crossdev
cyberdream /usr/local # cat << EOF > /etc/portage/repos.conf/crossdev.conf
[crossdev]

location = /usr/local/portage-crossdev
priority = 10
masters = gentoo
auto-sync = no
EOF
cyberdream /usr/local #
```

Now we're going to build the **toolchain** for the `arm64` architecture using the **stable branch** tools. Those are the options used:

- `--stable` Use latest stable tools version as default.

- ```
  -t
  ```

   

  Choose an architecture between:

  - [alpha](https://en.wikipedia.org/wiki/DEC_Alpha)
  - [hppa (parisc)](https://en.wikipedia.org/wiki/PA-RISC)
  - [i386 / i486 / i586 / i686 (x86)](https://en.wikipedia.org/wiki/X86) *32 bit version*
  - [mips / mipsel / mips64 / mips64el](https://en.wikipedia.org/wiki/MIPS_architecture)
  - [powerpc (ppc) / powerpc64 (ppc64)](https://en.wikipedia.org/wiki/PowerPC)
  - [sparc / sparc64](https://en.wikipedia.org/wiki/SPARC)
  - [sh / sh[1-5\] / sh64](https://en.wikipedia.org/wiki/SuperH)
  - [arm / armeb / aarch64](https://en.wikipedia.org/wiki/ARM_architecture)
  - [ia64](https://en.wikipedia.org/wiki/IA-64)
  - [m68k](https://en.wikipedia.org/wiki/Motorola_68000_series)
  - [s390 / s390x](https://en.wikipedia.org/wiki/Z/Architecture)
  - [x86_64 (amd64)](https://en.wikipedia.org/wiki/X86) *64 bit version*

- `-genv` Specify environment for `gcc`

```
cyberdream /etc/portage/repos.conf # crossdev --stable -t aarch64-unknown-linux-gnu --genv 'USE="cxx multilib fortran -mudflap nls openmp -sanitize"'
-                                                                               
 * crossdev version:      20171230
 * Host Portage ARCH:     amd64
 * Target Portage ARCH:   arm64
 * Target System:         aarch64-unknown-linux-gnu
 * Stage:                 4 (C/C++ compiler)
 * ABIs:                  arm64

 * binutils:              binutils-[stable]
 * gcc:                   gcc-[stable]
 * headers:               linux-headers-[stable]
 * libc:                  glibc-[stable]

 * CROSSDEV_OVERLAY:      /usr/local/portage-crossdev
 * PORT_LOGDIR:           /var/log/portage
 * PORTAGE_CONFIGROOT:    /
 * Portage flags:         
                                                                                
 * leaving metadata/layout.conf alone in /usr/local/portage-crossdev
                                                                                
 * Log: /var/log/portage/cross-aarch64-unknown-linux-gnu-binutils.log
 * Emerging cross-binutils ...                                            [ ok ]
 * Log: /var/log/portage/cross-aarch64-unknown-linux-gnu-linux-headers-quick.log
 * Emerging cross-linux-headers-quick ...                                 [ ok ]
 * Log: /var/log/portage/cross-aarch64-unknown-linux-gnu-glibc-headers.log
 * Emerging cross-glibc-headers ...                                       [ ok ]
 * Log: /var/log/portage/cross-aarch64-unknown-linux-gnu-gcc-stage1.log
 * Emerging cross-gcc-stage1 ...                                          [ ok ]
 * Log: /var/log/portage/cross-aarch64-unknown-linux-gnu-linux-headers.log
 * Emerging cross-linux-headers ...                                       [ ok ]
 * Log: /var/log/portage/cross-aarch64-unknown-linux-gnu-glibc.log
 * Emerging cross-glibc ...                                               [ ok ]
 * Log: /var/log/portage/cross-aarch64-unknown-linux-gnu-gcc-stage2.log
 * Emerging cross-gcc-stage2 ...                                          [ ok ]
cyberdream /etc/portage/repos.conf # 
```

After some time the process will end, and we have the **toolchain** ready to build the code that we want to use. In this case we're going to build the kernel and base system for a [**Rasberry Pi 3**](https://www.raspberrypi.org/).

We can check the version of our new tools:

```
taglio@cyberdream ~ $ aarch64-unknown-linux-gnu-g++ --version
aarch64-unknown-linux-gnu-g++ (Gentoo 6.4.0-r1 p1.3) 6.4.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

taglio@cyberdream ~ $ aarch64-unknown-linux-gnu-c++ --version
aarch64-unknown-linux-gnu-c++ (Gentoo 6.4.0-r1 p1.3) 6.4.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

taglio@cyberdream ~ $aarch64-unknown-linux-gnu-gcc --version
aarch64-unknown-linux-gnu-gcc (Gentoo 6.4.0-r1 p1.3) 6.4.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

taglio@cyberdream ~ $
```

## The Raspberry Pi 3

------

![a raspberry plant](https://steemitimages.com/640x0/https://www.urbanseedling.com/wp-content/uploads/2015/03/Raspberry-Festival--600x600.jpg)

The **Raspberry Pi** is a [*single board computer*](https://en.wikipedia.org/wiki/Single-board_computer) that have sold more than 19 million of devices. It's developed in the United Kindom by the [**Raspberry Pi Foundation**](https://en.wikipedia.org/wiki/Raspberry_Pi_Foundation) that is a charity with the goal to introduce computer science in third world schools.

With its third version it's possible to run a lightweight desktop without any problem under Linux. Look at this screenshot of the [**xfce desktop**](https://xfce.org/) environment.

![raspberry pi3 linux and xfce desktop](https://steemitimages.com/640x0/https://raw.GitHubusercontent.com/sakaki-/resources/master/raspberrypi/pi3/demo-screenshot-small-3.jpg)

Let's begin with the compile process for this single board device.

### The Kernel

First we download the latest stable kernel from the official Raspberry Pi [**GitHub kernel repository**](https://github.com/raspberrypi/linux). At the time of writing is the `rpi-4.14.y`. We use this `git` options:

- `clone`: Clones a repository into a newly created directory, creates remote-tracking branches for each branch in the cloned repository (visible using git branch -r), and creates and checks out an initial branch that is forked from the cloned repository’s currently active branch.
- `--depth`: Create a shallow clone with a history truncated to the specified number of commits (`1`).
- `-b`: Clone a determinated branch.

```
taglio@cyberdream ~/Sources/Rpi3/kbuild $ git clone --depth 1 https://GitHub.com/raspberrypi/linux.git -b rpi-4.14.y
Cloning into 'linux'...
remote: Counting objects: 65735, done.
remote: Compressing objects: 100% (60168/60168), done.
Receiving objects: 100% (65735/65735), 174.15 MiB | 7.88 MiB/s, done.
remote: Total 65735 (delta 7072), reused 15358 (delta 4598), pack-reused 0
Resolving deltas: 100% (7072/7072), done.
Checking out files: 100% (61808/61808), done.
taglio@cyberdream ~/Sources/Rpi3/kbuild $
```

Next compile the kernel, modules, firmware and [u-boot](https://en.wikipedia.org/wiki/Das_U-Boot) stuff.

We set two variables:

- `ARCH=arm64`
- `CROSS_COMPILE=aarch64-unknown-linux-gnu-`

And we start `make` using two different options:

- ```
  distclean
  ```

   

  : Remove all generated files, config, various backup files and editor backup and patch files

  - `bcmrpi3_defconfig` : Use prestablished config located in `arch/arm64/configs` (https://ghostbin.com/paste/cg62q)

```
taglio@cyberdream ~/Sources/Rpi3/kbuild/linux $ make ARCH=arm64 CROSS_COMPILE=aarch64-unknown-linux-gnu- distclean
  CLEAN   .
  CLEAN   arch/arm64/kernel/vdso
  CLEAN   arch/arm64/kernel
  CLEAN   drivers/firmware/efi/libstub
  CLEAN   drivers/tty/vt
  CLEAN   drivers/video/logo
  CLEAN   kernel/debug/kdb
  CLEAN   kernel
  CLEAN   lib/raid6
  CLEAN   lib
  CLEAN   usr
  CLEAN   arch/arm64/boot
  CLEAN   arch/arm64/boot/dts/broadcom/../overlays
  CLEAN   arch/arm64/boot/dts/broadcom
  CLEAN   .tmp_versions
  CLEAN   scripts/basic
  CLEAN   scripts/dtc
  CLEAN   scripts/genksyms
  CLEAN   scripts/kconfig
  CLEAN   scripts/mod
  CLEAN   scripts
  CLEAN   include/config include/generated arch/arm64/include/generated
  CLEAN   .config .version Module.symvers
taglio@cyberdream ~/Sources/Rpi3/kbuild/linux $ make ARCH=arm64 CROSS_COMPILE=aarch64-unknown-linux-gnu- bcmrpi3_defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
taglio@cyberdream ~/Sources/Rpi3/kbuild/linux $
```

Next we start the real kernel cross compile. We use the command `time` to mesure the real minutes to build our `arm64` kernel. With `-j$(nprocs)` we start many threads like many processor core we have.

```
taglio@cyberdream ~/Sources/Rpi3/kbuild/linux $ time make ARCH=arm64 CROSS_COMPILE=aarch64-unknown-linux-gnu- -j$(nproc)
.
.
.
real    5m47.534s
user    38m35.320s
sys 1m34.610s
taglio@cyberdream ~/Sources/Rpi3/kbuild/linux $
```

You can read about all the output here:

https://ghostbin.com/paste/damwc

### The Firmware

Like we've done before lets *shallow clone* [`--depth 1`] the GitHub raspberry firmware repository (after we exec two `ls` to see what we've downloaded):

```
taglio@cyberdream ~/Sources/Rpi3 $ git clone --depth 1  https://GitHub.com/raspberrypi/firmware
Cloning into 'firmware'...
remote: Counting objects: 4379, done.
remote: Compressing objects: 100% (2676/2676), done.
remote: Total 4379 (delta 1498), reused 2183 (delta 1359), pack-reused 0
Receiving objects: 100% (4379/4379), 84.19 MiB | 10.97 MiB/s, done.
Resolving deltas: 100% (1498/1498), done.
taglio@cyberdream ~/Sources/Rpi3 $ cd firmware/
taglio@cyberdream ~/Sources/Rpi3/firmware $ ls
README.md  boot  documentation  extra  hardfp  modules  opt
taglio@cyberdream ~/Sources/Rpi3/firmware $ cd boot/
taglio@cyberdream ~/Sources/Rpi3/firmware/boot $ ls -al
total 21772
drwxr-xr-x 3 taglio taglio    4096 Apr 17 17:41 .
drwxr-xr-x 9 taglio taglio    4096 Apr 17 17:41 ..
-rw-r--r-- 1 taglio taglio   18693 Apr 17 17:41 COPYING.linux
-rw-r--r-- 1 taglio taglio    1494 Apr 17 17:41 LICENCE.broadcom
-rw-r--r-- 1 taglio taglio   22264 Apr 17 17:41 bcm2708-rpi-0-w.dtb
-rw-r--r-- 1 taglio taglio   22020 Apr 17 17:41 bcm2708-rpi-b-plus.dtb
-rw-r--r-- 1 taglio taglio   21761 Apr 17 17:41 bcm2708-rpi-b.dtb
-rw-r--r-- 1 taglio taglio   21474 Apr 17 17:41 bcm2708-rpi-cm.dtb
-rw-r--r-- 1 taglio taglio   23044 Apr 17 17:41 bcm2709-rpi-2-b.dtb
-rw-r--r-- 1 taglio taglio   24503 Apr 17 17:41 bcm2710-rpi-3-b-plus.dtb
-rw-r--r-- 1 taglio taglio   24240 Apr 17 17:41 bcm2710-rpi-3-b.dtb
-rw-r--r-- 1 taglio taglio   22952 Apr 17 17:41 bcm2710-rpi-cm3.dtb
-rw-r--r-- 1 taglio taglio   52064 Apr 17 17:41 bootcode.bin
-rw-r--r-- 1 taglio taglio    6575 Apr 17 17:41 fixup.dat
-rw-r--r-- 1 taglio taglio    2599 Apr 17 17:41 fixup_cd.dat
-rw-r--r-- 1 taglio taglio    9726 Apr 17 17:41 fixup_db.dat
-rw-r--r-- 1 taglio taglio    9730 Apr 17 17:41 fixup_x.dat
-rw-r--r-- 1 taglio taglio 4676016 Apr 17 17:41 kernel.img
-rw-r--r-- 1 taglio taglio 4922144 Apr 17 17:41 kernel7.img
drwxr-xr-x 2 taglio taglio    4096 Apr 17 17:41 overlays
-rw-r--r-- 1 taglio taglio 2825124 Apr 17 17:41 start.elf
-rw-r--r-- 1 taglio taglio  673444 Apr 17 17:41 start_cd.elf
-rw-r--r-- 1 taglio taglio 4968292 Apr 17 17:41 start_db.elf
-rw-r--r-- 1 taglio taglio 3912164 Apr 17 17:41 start_x.elf
taglio@cyberdream ~/Sources/Rpi3/firmware/boot $
```

### The partition table

We've to insert the [**microSD card**](https://simple.wikipedia.org/wiki/MicroSD) in our principal Gentoo PC to create the correct partition table for our **Raspberry Pi 3**. The layout have to be:

- [partition](https://en.wikipedia.org/wiki/Disk_partitioning) disklabel type (*partitioning scheme*): `DOS`
- first primary partition: size `128M`, type `c` (*W95 FAT32 (LBA)*), bootable flag `a` active
- second primary partition: size `2G`, type `82` (*Linux swap / Solaris*)
- third primary partition: size all, type `83` (*Linux*)

Here is the correct commands from the Linux `fdisk` shell:

```
cyberdream ~ # fdisk /dev/mmcblk0

Welcome to fdisk (util-linux 2.30.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help): o
Created a new DOS disklabel with disk identifier 0x718393ba.

Command (m for help): p
Disk /dev/mmcblk0: 29.8 GiB, 32010928128 bytes, 62521344 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x718393ba

Command (m for help): p
Disk /dev/mmcblk0: 29.8 GiB, 32010928128 bytes, 62521344 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x718393ba

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-62521343, default 2048): 
Last sector, +sectors or +size{K,M,G,T,P} (2048-62521343, default 62521343): +128M

Created a new partition 1 of type 'Linux' and of size 128 MiB.

Command (m for help): n
Partition type
   p   primary (1 primary, 0 extended, 3 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (2-4, default 2): 
First sector (264192-62521343, default 264192): 
Last sector, +sectors or +size{K,M,G,T,P} (264192-62521343, default 62521343): +2G

Created a new partition 2 of type 'Linux' and of size 2 GiB.

Command (m for help): n
Partition type
   p   primary (2 primary, 0 extended, 2 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (3,4, default 3): 
First sector (4458496-62521343, default 4458496): 
Last sector, +sectors or +size{K,M,G,T,P} (4458496-62521343, default 62521343): 
 
Created a new partition 3 of type 'Linux' and of size 27.7 GiB.

Command (m for help): p
Disk /dev/mmcblk0: 29.8 GiB, 32010928128 bytes, 62521344 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x718393ba

Device         Boot   Start      End  Sectors  Size Id Type
/dev/mmcblk0p1         2048   264191   262144  128M 83 Linux
/dev/mmcblk0p2       264192  4458495  4194304    2G 83 Linux
/dev/mmcblk0p3      4458496 62521343 58062848 27.7G 83 Linux

Command (m for help): a
Partition number (1-3, default 3): 1

The bootable flag on partition 1 is enabled now.

Command (m for help): t
Partition number (1-3, default 3): 1
Hex code (type L to list all codes): c

Changed type of partition 'Linux' to 'W95 FAT32 (LBA)'.

Command (m for help): t
Partition number (1-3, default 3): 2
Hex code (type L to list all codes): 82

Changed type of partition 'Linux' to 'Linux swap / Solaris'.

Command (m for help): p
Disk /dev/mmcblk0: 29.8 GiB, 32010928128 bytes, 62521344 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x718393ba

Device         Boot   Start      End  Sectors  Size Id Type
/dev/mmcblk0p1 *       2048   264191   262144  128M  c W95 FAT32 (LBA)
/dev/mmcblk0p2       264192  4458495  4194304    2G 82 Linux swap / Solaris
/dev/mmcblk0p3      4458496 62521343 58062848 27.7G 83 Linux

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.

cyberdream ~ # 
```

Next we format the three partition with the correct `fs` type, using those commands and options:

- `mkfs -t vfat -F 32`: used to create an MS-DOS filesystem under Linux. `-F` Specifies the type of file allocation tables used (*in this case 32 bit*).

- `mkswap`: sets up a Linux swap area on a device or in a file.

- ```
  mkfs -i 8192 -t ext4
  ```

  :

  - `-i`: Specify the bytes/inode ratio. `mke2fs` creates an inode for
    every bytes-per-inode bytes of space on the disk. The larger
    the bytes-per-inode ratio, the fewer inodes will be created.
  - `-t`: choose between [`ext{2,3,4}`](https://en.wikipedia.org/wiki/Extended_file_system)

```
cyberdream ~ # mkfs -t vfat -F 32 /dev/mmcblk0p1 
mkfs.fat 4.0 (2016-05-06)
cyberdream ~ # mkswap /dev/mmcblk0p2 
Setting up swapspace version 1, size = 2 GiB (2147479552 bytes)
no label, UUID=0ed9f502-c3a4-4821-b646-91a0cda22dc9
cyberdream ~ # mkfs -i 8192 -t ext4 /dev/mmcblk0p3 
mke2fs 1.43.6 (29-Aug-2017)
/dev/mmcblk0p3 contains `ISO-8859 text, with very long lines, with no line terminators' data
Proceed anyway? (y,N) y
Creating filesystem with 7257856 4k blocks and 3630144 inodes
Filesystem UUID: fdd18e6c-377b-47e8-9595-46b1f036dd84
Superblock backups stored on blocks: 
    32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
    4096000

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done   

cyberdream ~ #
```

### The filesystem

Next we have to populate the `/boot` (*1*) and `/` (*3*) partitions.

Gentoo use the concept of *stage tarballs*; they are archives containing files that will be used in the installation process. More in deep we're going to download `stage3` `arm64` tarballs that contains what the gentoo crew call [a system set](https://wiki.gentoo.org/wiki/System_set_(Portage)); also we're going to verificate that the archive has not been manipulated during the fetch process:

```
taglio@cyberdream ~/Sources/Rpi3/stage3 $ wget http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20180305.tar.bz2{,.CONTENTS,.DIGESTS}
--2018-04-18 09:16:19--  http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20180305.tar.bz2
Resolving distfiles.gentoo.org... 137.226.34.46, 216.165.129.135, 64.50.233.100, ...
Connecting to distfiles.gentoo.org|137.226.34.46|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 233168546 (222M) [application/octet-stream]
Saving to: ‘stage3-arm64-20180305.tar.bz2’

stage3-arm64-201803 100%[===================>] 222.37M  35.4MB/s    in 6.6s    

2018-04-18 09:16:26 (33.8 MB/s) - ‘stage3-arm64-20180305.tar.bz2’ saved [233168546/233168546]

--2018-04-18 09:16:26--  http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20180305.tar.bz2.CONTENTS
Reusing existing connection to distfiles.gentoo.org:80.
HTTP request sent, awaiting response... 200 OK
Length: 5281799 (5.0M) [application/octet-stream]
Saving to: ‘stage3-arm64-20180305.tar.bz2.CONTENTS’

stage3-arm64-201803 100%[===================>]   5.04M  30.3MB/s    in 0.2s    

2018-04-18 09:16:26 (30.3 MB/s) - ‘stage3-arm64-20180305.tar.bz2.CONTENTS’ saved [5281799/5281799]

--2018-04-18 09:16:26--  http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20180305.tar.bz2.DIGESTS
Reusing existing connection to distfiles.gentoo.org:80.
HTTP request sent, awaiting response... 200 OK
Length: 712 [application/octet-stream]
Saving to: ‘stage3-arm64-20180305.tar.bz2.DIGESTS’

stage3-arm64-201803 100%[===================>]     712  --.-KB/s    in 0s      

2018-04-18 09:16:26 (298 MB/s) - ‘stage3-arm64-20180305.tar.bz2.DIGESTS’ saved [712/712]

FINISHED --2018-04-18 09:16:26--
Total wall clock time: 7.3s
Downloaded: 3 files, 227M in 6.7s (33.7 MB/s)
taglio@cyberdream ~/Sources/Rpi3/stage3 $
```

Next we verify the `sha512sum` of the tarball using this options:

- With `awk` we print in `stdout` only the line containing the `SHA512` hash.
- The `sed` invocation is necessary to probably correct an *error* from the Gentoo team (reported [here](https://www.reddit.com/r/Gentoo/comments/8d415b/errata/))

```
taglio@cyberdream ~/Sources/Rpi3/stage3 $ awk '/SHA512 HASH/{getline;print}' stage3-arm64-20180305.tar.bz2.DIGESTS | sed s/2008.0/20180305/g | sha512sum --check
stage3-arm64-20180305.tar.bz2: OK
stage3-arm64-20180305.tar.bz2.CONTENTS: OK
taglio@cyberdream ~/Sources/Rpi3/stage3 $
```

Let's begin to move our files in the *microSD* partitions. After creating the mountpoint `/mnt/piboot` and `/mnt/piroot`, start with the firmware, the kernel and the kernel modules.

Speaking about the `/boot` partiotion note that we delete all the `.dtb` file after copying the entire directory in the microSD card. This is why we want to use the `64 bit` version of the **device tree binary** file. A good reference that i found in the web is:

[https://events.static.linuxfound.org/sites/events/files/slides/petazzoni-device-tree-dummies.pdf](https://events.static.linuxfound.org/sites/events/files/slides/petazzoni-device-tree-dummies)

You can evaluate the output of the command `strings` in a `.dtb` file here:

https://ghostbin.com/paste/gn8wj

```
cyberdream /mnt # mkdir -pv /mnt/pi{boot,root}
mkdir: created directory 'piboot'
mkdir: created directory 'piroot'
cyberdream /mnt # mount -v /dev/mmcblk0p1 /mnt/piboot
mount: /dev/mmcblk0p1 mounted on /mnt/piboot.
cyberdream /mnt # 
cyberdream /mnt # mount -v /dev/mmcblk0p3 /mnt/piroot
mount: /dev/mmcblk0p3 mounted on /mnt/piroot.
cyberdream /mnt # cd /home/taglio/Sources/Rpi3/firmware
cyberdream /home/taglio/Sources/Rpi3/firmware # cp -rv boot/* /mnt/piboot/
'boot/COPYING.linux' -> '/mnt/piboot/COPYING.linux'
'boot/LICENCE.broadcom' -> '/mnt/piboot/LICENCE.broadcom'
'boot/bcm2708-rpi-0-w.dtb' -> '/mnt/piboot/bcm2708-rpi-0-w.dtb'
'boot/bcm2708-rpi-b-plus.dtb' -> '/mnt/piboot/bcm2708-rpi-b-plus.dtb'
'boot/bcm2708-rpi-b.dtb' -> '/mnt/piboot/bcm2708-rpi-b.dtb'
'boot/bcm2708-rpi-cm.dtb' -> '/mnt/piboot/bcm2708-rpi-cm.dtb'
'boot/bcm2709-rpi-2-b.dtb' -> '/mnt/piboot/bcm2709-rpi-2-b.dtb'
'boot/bcm2710-rpi-3-b-plus.dtb' -> '/mnt/piboot/bcm2710-rpi-3-b-plus.dtb'
'boot/bcm2710-rpi-3-b.dtb' -> '/mnt/piboot/bcm2710-rpi-3-b.dtb'
'boot/bcm2710-rpi-cm3.dtb' -> '/mnt/piboot/bcm2710-rpi-cm3.dtb'
'boot/bootcode.bin' -> '/mnt/piboot/bootcode.bin'
'boot/fixup.dat' -> '/mnt/piboot/fixup.dat'
'boot/fixup_cd.dat' -> '/mnt/piboot/fixup_cd.dat'
'boot/fixup_db.dat' -> '/mnt/piboot/fixup_db.dat'
'boot/fixup_x.dat' -> '/mnt/piboot/fixup_x.dat'
'boot/kernel.img' -> '/mnt/piboot/kernel.img'
'boot/kernel7.img' -> '/mnt/piboot/kernel7.img'
'boot/overlays' -> '/mnt/piboot/overlays'
'boot/overlays/README' -> '/mnt/piboot/overlays/README'
'boot/overlays/adau1977-adc.dtbo' -> '/mnt/piboot/overlays/adau1977-adc.dtbo'
'boot/overlays/adau7002-simple.dtbo' -> '/mnt/piboot/overlays/adau7002-simple.dtbo'
'boot/overlays/ads1015.dtbo' -> '/mnt/piboot/overlays/ads1015.dtbo'
'boot/overlays/ads1115.dtbo' -> '/mnt/piboot/overlays/ads1115.dtbo'
'boot/overlays/ads7846.dtbo' -> '/mnt/piboot/overlays/ads7846.dtbo'
'boot/overlays/akkordion-iqdacplus.dtbo' -> '/mnt/piboot/overlays/akkordion-iqdacplus.dtbo'
'boot/overlays/allo-boss-dac-pcm512x-audio.dtbo' -> '/mnt/piboot/overlays/allo-boss-dac-pcm512x-audio.dtbo'
'boot/overlays/allo-digione.dtbo' -> '/mnt/piboot/overlays/allo-digione.dtbo'
'boot/overlays/allo-piano-dac-pcm512x-audio.dtbo' -> '/mnt/piboot/overlays/allo-piano-dac-pcm512x-audio.dtbo'
'boot/overlays/allo-piano-dac-plus-pcm512x-audio.dtbo' -> '/mnt/piboot/overlays/allo-piano-dac-plus-pcm512x-audio.dtbo'
'boot/overlays/applepi-dac.dtbo' -> '/mnt/piboot/overlays/applepi-dac.dtbo'
'boot/overlays/at86rf233.dtbo' -> '/mnt/piboot/overlays/at86rf233.dtbo'
'boot/overlays/audioinjector-addons.dtbo' -> '/mnt/piboot/overlays/audioinjector-addons.dtbo'
'boot/overlays/audioinjector-wm8731-audio.dtbo' -> '/mnt/piboot/overlays/audioinjector-wm8731-audio.dtbo'
'boot/overlays/audremap.dtbo' -> '/mnt/piboot/overlays/audremap.dtbo'
'boot/overlays/bmp085_i2c-sensor.dtbo' -> '/mnt/piboot/overlays/bmp085_i2c-sensor.dtbo'
'boot/overlays/dht11.dtbo' -> '/mnt/piboot/overlays/dht11.dtbo'
'boot/overlays/dionaudio-loco-v2.dtbo' -> '/mnt/piboot/overlays/dionaudio-loco-v2.dtbo'
'boot/overlays/dionaudio-loco.dtbo' -> '/mnt/piboot/overlays/dionaudio-loco.dtbo'
'boot/overlays/dpi18.dtbo' -> '/mnt/piboot/overlays/dpi18.dtbo'
'boot/overlays/dpi24.dtbo' -> '/mnt/piboot/overlays/dpi24.dtbo'
'boot/overlays/dwc-otg.dtbo' -> '/mnt/piboot/overlays/dwc-otg.dtbo'
'boot/overlays/dwc2.dtbo' -> '/mnt/piboot/overlays/dwc2.dtbo'
'boot/overlays/enc28j60-spi2.dtbo' -> '/mnt/piboot/overlays/enc28j60-spi2.dtbo'
'boot/overlays/enc28j60.dtbo' -> '/mnt/piboot/overlays/enc28j60.dtbo'
'boot/overlays/exc3000.dtbo' -> '/mnt/piboot/overlays/exc3000.dtbo'
'boot/overlays/fe-pi-audio.dtbo' -> '/mnt/piboot/overlays/fe-pi-audio.dtbo'
'boot/overlays/goodix.dtbo' -> '/mnt/piboot/overlays/goodix.dtbo'
'boot/overlays/googlevoicehat-soundcard.dtbo' -> '/mnt/piboot/overlays/googlevoicehat-soundcard.dtbo'
'boot/overlays/gpio-ir-tx.dtbo' -> '/mnt/piboot/overlays/gpio-ir-tx.dtbo'
'boot/overlays/gpio-ir.dtbo' -> '/mnt/piboot/overlays/gpio-ir.dtbo'
'boot/overlays/gpio-key.dtbo' -> '/mnt/piboot/overlays/gpio-key.dtbo'
'boot/overlays/gpio-poweroff.dtbo' -> '/mnt/piboot/overlays/gpio-poweroff.dtbo'
'boot/overlays/gpio-shutdown.dtbo' -> '/mnt/piboot/overlays/gpio-shutdown.dtbo'
'boot/overlays/hifiberry-amp.dtbo' -> '/mnt/piboot/overlays/hifiberry-amp.dtbo'
'boot/overlays/hifiberry-dac.dtbo' -> '/mnt/piboot/overlays/hifiberry-dac.dtbo'
'boot/overlays/hifiberry-dacplus.dtbo' -> '/mnt/piboot/overlays/hifiberry-dacplus.dtbo'
'boot/overlays/hifiberry-digi-pro.dtbo' -> '/mnt/piboot/overlays/hifiberry-digi-pro.dtbo'
'boot/overlays/hifiberry-digi.dtbo' -> '/mnt/piboot/overlays/hifiberry-digi.dtbo'
'boot/overlays/hy28a.dtbo' -> '/mnt/piboot/overlays/hy28a.dtbo'
'boot/overlays/hy28b.dtbo' -> '/mnt/piboot/overlays/hy28b.dtbo'
'boot/overlays/i2c-bcm2708.dtbo' -> '/mnt/piboot/overlays/i2c-bcm2708.dtbo'
'boot/overlays/i2c-gpio.dtbo' -> '/mnt/piboot/overlays/i2c-gpio.dtbo'
'boot/overlays/i2c-mux.dtbo' -> '/mnt/piboot/overlays/i2c-mux.dtbo'
'boot/overlays/i2c-pwm-pca9685a.dtbo' -> '/mnt/piboot/overlays/i2c-pwm-pca9685a.dtbo'
'boot/overlays/i2c-rtc-gpio.dtbo' -> '/mnt/piboot/overlays/i2c-rtc-gpio.dtbo'
'boot/overlays/i2c-rtc.dtbo' -> '/mnt/piboot/overlays/i2c-rtc.dtbo'
'boot/overlays/i2c-sensor.dtbo' -> '/mnt/piboot/overlays/i2c-sensor.dtbo'
'boot/overlays/i2c0-bcm2708.dtbo' -> '/mnt/piboot/overlays/i2c0-bcm2708.dtbo'
'boot/overlays/i2c1-bcm2708.dtbo' -> '/mnt/piboot/overlays/i2c1-bcm2708.dtbo'
'boot/overlays/i2s-gpio28-31.dtbo' -> '/mnt/piboot/overlays/i2s-gpio28-31.dtbo'
'boot/overlays/iqaudio-dac.dtbo' -> '/mnt/piboot/overlays/iqaudio-dac.dtbo'
'boot/overlays/iqaudio-dacplus.dtbo' -> '/mnt/piboot/overlays/iqaudio-dacplus.dtbo'
'boot/overlays/iqaudio-digi-wm8804-audio.dtbo' -> '/mnt/piboot/overlays/iqaudio-digi-wm8804-audio.dtbo'
'boot/overlays/jedec-spi-nor.dtbo' -> '/mnt/piboot/overlays/jedec-spi-nor.dtbo'
'boot/overlays/justboom-dac.dtbo' -> '/mnt/piboot/overlays/justboom-dac.dtbo'
'boot/overlays/justboom-digi.dtbo' -> '/mnt/piboot/overlays/justboom-digi.dtbo'
'boot/overlays/lirc-rpi.dtbo' -> '/mnt/piboot/overlays/lirc-rpi.dtbo'
'boot/overlays/mbed-dac.dtbo' -> '/mnt/piboot/overlays/mbed-dac.dtbo'
'boot/overlays/mcp23017.dtbo' -> '/mnt/piboot/overlays/mcp23017.dtbo'
'boot/overlays/mcp23s17.dtbo' -> '/mnt/piboot/overlays/mcp23s17.dtbo'
'boot/overlays/mcp2515-can0.dtbo' -> '/mnt/piboot/overlays/mcp2515-can0.dtbo'
'boot/overlays/mcp2515-can1.dtbo' -> '/mnt/piboot/overlays/mcp2515-can1.dtbo'
'boot/overlays/mcp3008.dtbo' -> '/mnt/piboot/overlays/mcp3008.dtbo'
'boot/overlays/mcp3202.dtbo' -> '/mnt/piboot/overlays/mcp3202.dtbo'
'boot/overlays/media-center.dtbo' -> '/mnt/piboot/overlays/media-center.dtbo'
'boot/overlays/midi-uart0.dtbo' -> '/mnt/piboot/overlays/midi-uart0.dtbo'
'boot/overlays/midi-uart1.dtbo' -> '/mnt/piboot/overlays/midi-uart1.dtbo'
'boot/overlays/mmc.dtbo' -> '/mnt/piboot/overlays/mmc.dtbo'
'boot/overlays/mpu6050.dtbo' -> '/mnt/piboot/overlays/mpu6050.dtbo'
'boot/overlays/mz61581.dtbo' -> '/mnt/piboot/overlays/mz61581.dtbo'
'boot/overlays/papirus.dtbo' -> '/mnt/piboot/overlays/papirus.dtbo'
'boot/overlays/pi3-act-led.dtbo' -> '/mnt/piboot/overlays/pi3-act-led.dtbo'
'boot/overlays/pi3-disable-bt.dtbo' -> '/mnt/piboot/overlays/pi3-disable-bt.dtbo'
'boot/overlays/pi3-disable-wifi.dtbo' -> '/mnt/piboot/overlays/pi3-disable-wifi.dtbo'
'boot/overlays/pi3-miniuart-bt.dtbo' -> '/mnt/piboot/overlays/pi3-miniuart-bt.dtbo'
'boot/overlays/pibell.dtbo' -> '/mnt/piboot/overlays/pibell.dtbo'
'boot/overlays/piscreen.dtbo' -> '/mnt/piboot/overlays/piscreen.dtbo'
'boot/overlays/piscreen2r.dtbo' -> '/mnt/piboot/overlays/piscreen2r.dtbo'
'boot/overlays/pisound.dtbo' -> '/mnt/piboot/overlays/pisound.dtbo'
'boot/overlays/pitft22.dtbo' -> '/mnt/piboot/overlays/pitft22.dtbo'
'boot/overlays/pitft28-capacitive.dtbo' -> '/mnt/piboot/overlays/pitft28-capacitive.dtbo'
'boot/overlays/pitft28-resistive.dtbo' -> '/mnt/piboot/overlays/pitft28-resistive.dtbo'
'boot/overlays/pitft35-resistive.dtbo' -> '/mnt/piboot/overlays/pitft35-resistive.dtbo'
'boot/overlays/pps-gpio.dtbo' -> '/mnt/piboot/overlays/pps-gpio.dtbo'
'boot/overlays/pwm-2chan.dtbo' -> '/mnt/piboot/overlays/pwm-2chan.dtbo'
'boot/overlays/pwm-ir-tx.dtbo' -> '/mnt/piboot/overlays/pwm-ir-tx.dtbo'
'boot/overlays/pwm.dtbo' -> '/mnt/piboot/overlays/pwm.dtbo'
'boot/overlays/qca7000.dtbo' -> '/mnt/piboot/overlays/qca7000.dtbo'
'boot/overlays/rotary-encoder.dtbo' -> '/mnt/piboot/overlays/rotary-encoder.dtbo'
'boot/overlays/rpi-backlight.dtbo' -> '/mnt/piboot/overlays/rpi-backlight.dtbo'
'boot/overlays/rpi-cirrus-wm5102.dtbo' -> '/mnt/piboot/overlays/rpi-cirrus-wm5102.dtbo'
'boot/overlays/rpi-dac.dtbo' -> '/mnt/piboot/overlays/rpi-dac.dtbo'
'boot/overlays/rpi-display.dtbo' -> '/mnt/piboot/overlays/rpi-display.dtbo'
'boot/overlays/rpi-ft5406.dtbo' -> '/mnt/piboot/overlays/rpi-ft5406.dtbo'
'boot/overlays/rpi-proto.dtbo' -> '/mnt/piboot/overlays/rpi-proto.dtbo'
'boot/overlays/rpi-sense.dtbo' -> '/mnt/piboot/overlays/rpi-sense.dtbo'
'boot/overlays/rpi-tv.dtbo' -> '/mnt/piboot/overlays/rpi-tv.dtbo'
'boot/overlays/rra-digidac1-wm8741-audio.dtbo' -> '/mnt/piboot/overlays/rra-digidac1-wm8741-audio.dtbo'
'boot/overlays/sc16is750-i2c.dtbo' -> '/mnt/piboot/overlays/sc16is750-i2c.dtbo'
'boot/overlays/sc16is752-i2c.dtbo' -> '/mnt/piboot/overlays/sc16is752-i2c.dtbo'
'boot/overlays/sc16is752-spi1.dtbo' -> '/mnt/piboot/overlays/sc16is752-spi1.dtbo'
'boot/overlays/sdhost.dtbo' -> '/mnt/piboot/overlays/sdhost.dtbo'
'boot/overlays/sdio-1bit.dtbo' -> '/mnt/piboot/overlays/sdio-1bit.dtbo'
'boot/overlays/sdio.dtbo' -> '/mnt/piboot/overlays/sdio.dtbo'
'boot/overlays/sdtweak.dtbo' -> '/mnt/piboot/overlays/sdtweak.dtbo'
'boot/overlays/smi-dev.dtbo' -> '/mnt/piboot/overlays/smi-dev.dtbo'
'boot/overlays/smi-nand.dtbo' -> '/mnt/piboot/overlays/smi-nand.dtbo'
'boot/overlays/smi.dtbo' -> '/mnt/piboot/overlays/smi.dtbo'
'boot/overlays/spi-gpio35-39.dtbo' -> '/mnt/piboot/overlays/spi-gpio35-39.dtbo'
'boot/overlays/spi-rtc.dtbo' -> '/mnt/piboot/overlays/spi-rtc.dtbo'
'boot/overlays/spi0-cs.dtbo' -> '/mnt/piboot/overlays/spi0-cs.dtbo'
'boot/overlays/spi0-hw-cs.dtbo' -> '/mnt/piboot/overlays/spi0-hw-cs.dtbo'
'boot/overlays/spi1-1cs.dtbo' -> '/mnt/piboot/overlays/spi1-1cs.dtbo'
'boot/overlays/spi1-2cs.dtbo' -> '/mnt/piboot/overlays/spi1-2cs.dtbo'
'boot/overlays/spi1-3cs.dtbo' -> '/mnt/piboot/overlays/spi1-3cs.dtbo'
'boot/overlays/spi2-1cs.dtbo' -> '/mnt/piboot/overlays/spi2-1cs.dtbo'
'boot/overlays/spi2-2cs.dtbo' -> '/mnt/piboot/overlays/spi2-2cs.dtbo'
'boot/overlays/spi2-3cs.dtbo' -> '/mnt/piboot/overlays/spi2-3cs.dtbo'
'boot/overlays/superaudioboard.dtbo' -> '/mnt/piboot/overlays/superaudioboard.dtbo'
'boot/overlays/sx150x.dtbo' -> '/mnt/piboot/overlays/sx150x.dtbo'
'boot/overlays/tinylcd35.dtbo' -> '/mnt/piboot/overlays/tinylcd35.dtbo'
'boot/overlays/uart0.dtbo' -> '/mnt/piboot/overlays/uart0.dtbo'
'boot/overlays/uart1.dtbo' -> '/mnt/piboot/overlays/uart1.dtbo'
'boot/overlays/upstream-aux-interrupt.dtbo' -> '/mnt/piboot/overlays/upstream-aux-interrupt.dtbo'
'boot/overlays/upstream.dtbo' -> '/mnt/piboot/overlays/upstream.dtbo'
'boot/overlays/vc4-fkms-v3d.dtbo' -> '/mnt/piboot/overlays/vc4-fkms-v3d.dtbo'
'boot/overlays/vc4-kms-v3d.dtbo' -> '/mnt/piboot/overlays/vc4-kms-v3d.dtbo'
'boot/overlays/vga666.dtbo' -> '/mnt/piboot/overlays/vga666.dtbo'
'boot/overlays/w1-gpio-pullup.dtbo' -> '/mnt/piboot/overlays/w1-gpio-pullup.dtbo'
'boot/overlays/w1-gpio.dtbo' -> '/mnt/piboot/overlays/w1-gpio.dtbo'
'boot/overlays/wittypi.dtbo' -> '/mnt/piboot/overlays/wittypi.dtbo'
'boot/start.elf' -> '/mnt/piboot/start.elf'
'boot/start_cd.elf' -> '/mnt/piboot/start_cd.elf'
'boot/start_db.elf' -> '/mnt/piboot/start_db.elf'
'boot/start_x.elf' -> '/mnt/piboot/start_x.elf'
cyberdream /home/taglio/Sources/Rpi3/firmware # cd ../kbuild/linux/
cyberdream /home/taglio/Sources/Rpi3/kbuild/linux # rm /mnt/piboot/*.dtb
cyberdream /home/taglio/Sources/Rpi3/kbuild/linux # cp -v arch/arm64/boot/dts/broadcom/bcm2710-rpi-3-b-plus.dtb /mnt/piboot/
'arch/arm64/boot/dts/broadcom/bcm2710-rpi-3-b-plus.dtb' -> '/mnt/piboot/bcm2710-rpi-3-b-plus.dtb'
cyberdream /home/taglio/Sources/Rpi3/kbuild/linux # cp -v arch/arm64/boot/dts/broadcom/bcm{2710,2837}-rpi-3-b.dtb /mnt/piboot/
'arch/arm64/boot/dts/broadcom/bcm2710-rpi-3-b.dtb' -> '/mnt/piboot/bcm2710-rpi-3-b.dtb'
'arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb' -> '/mnt/piboot/bcm2837-rpi-3-b.dtb'
cyberdream /home/taglio/Sources/Rpi3/kbuild/linux # 
```

Going ahead with the kernel and its related modules; we can see that we invoque `modules_install` option of `make` declaring three variables:

1. `ARCH=arm64`
2. `CROSS_COMPILE=aarch64-unknown-linux-gnu-`
3. `INSTALL_MOD_PATH="/mnt/piroot"`

You can appreciate the output of the entire command here:

https://ghostbin.com/paste/okxwe

```
cyberdream /home/taglio/Sources/Rpi3/kbuild/linux # cp -v arch/arm64/boot/Image /mnt/piboot/kernel8.img
'arch/arm64/boot/Image' -> '/mnt/piboot/kernel8.img'
cyberdream /home/taglio/Sources/Rpi3/kbuild/linux # make ARCH=arm64 CROSS_COMPILE=aarch64-unknown-linux-gnu- modules_install INSTALL_MOD_PATH="/mnt/piroot"
.
.
.
DEPMOD  4.14.34-v8+
cyberdream /home/taglio/Sources/Rpi3/kbuild/linux #
```

The result of an `ls` of the `/boot` carpet is:

```
cyberdream /mnt/piboot # ls -al
total 34634
drwxr-xr-x 3 root root     2048 Apr 18 15:13 .
drwxr-xr-x 7 root root     4096 Apr 18 09:59 ..
-rwxr-xr-x 1 root root    18693 Apr 18 13:47 COPYING.linux
-rwxr-xr-x 1 root root     1494 Apr 18 13:47 LICENCE.broadcom
-rwxr-xr-x 1 root root    24519 Apr 18 15:13 bcm2710-rpi-3-b-plus.dtb
-rwxr-xr-x 1 root root    24256 Apr 18 15:13 bcm2710-rpi-3-b.dtb
-rwxr-xr-x 1 root root    17314 Apr 18 15:13 bcm2837-rpi-3-b.dtb
-rwxr-xr-x 1 root root    52064 Apr 18 13:47 bootcode.bin
-rwxr-xr-x 1 root root     6575 Apr 18 13:47 fixup.dat
-rwxr-xr-x 1 root root     2599 Apr 18 13:47 fixup_cd.dat
-rwxr-xr-x 1 root root     9726 Apr 18 13:47 fixup_db.dat
-rwxr-xr-x 1 root root     9730 Apr 18 13:47 fixup_x.dat
-rwxr-xr-x 1 root root  4676016 Apr 18 13:47 kernel.img
-rwxr-xr-x 1 root root  4922144 Apr 18 13:47 kernel7.img
-rwxr-xr-x 1 root root 13300224 Apr 18 17:46 kernel8.img
drwxr-xr-x 2 root root    11264 Apr 18 13:47 overlays
-rwxr-xr-x 1 root root  2825124 Apr 18 13:47 start.elf
-rwxr-xr-x 1 root root   673444 Apr 18 13:47 start_cd.elf
-rwxr-xr-x 1 root root  4968292 Apr 18 13:47 start_db.elf
-rwxr-xr-x 1 root root  3912164 Apr 18 13:47 start_x.elf
cyberdream /mnt/piboot #
```

Next we're going to extract the `stage3` tarball in the `/` mounted over `/mnt/piroot`.

We're going to use `tar` in an advaced mode:

- `-x`: Extract files from an archive.
- `-v`: Verbosely list files processed.
- `-j`: Filter the archive through bzip2.
- `-p`: Extract information about file permissions.
- `-f`: Use archive file or device ARCHIVE (`stage3-arm64-20180305.tar.bz2`)
- `--xattrs-include`: Specify the include PATTERN for xattr keys. (`*.*`)
- `--numeric-owner`: Always use numbers for user/group names.

Full output here:

https://ghostbin.com/paste/yvs2x

```
cyberdream /mnt/piroot # tar xvjpf /home/taglio/Sources/Rpi3/stage3/stage3-arm64-20180305.tar.bz2 --xattrs-include='*.*' --numeric-owner
.
.
.
cyberdream /mnt/piroot #
```

### The portage latest snapshot

The next step is to install a **Portage** snapshot, a set of files updated on a daily basis informing Portage what software is available to install, what profiles are available, and so on.

```
taglio@cyberdream ~/Sources/Rpi3/portage $ wget http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2{,.gpgsig,.md5sum}
--2018-04-20 10:15:21--  http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2
Resolving distfiles.gentoo.org... 64.50.236.52, 140.211.166.134, 137.226.34.46, ...
Connecting to distfiles.gentoo.org|64.50.236.52|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 52621953 (50M) [application/x-bzip2]
Saving to: ‘portage-latest.tar.bz2’

portage-latest.tar. 100%[===================>]  50.18M  6.93MB/s    in 9.5s    

2018-04-20 10:15:31 (5.30 MB/s) - ‘portage-latest.tar.bz2’ saved [52621953/52621953]

--2018-04-20 10:15:31--  http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2.gpgsig
Reusing existing connection to distfiles.gentoo.org:80.
HTTP request sent, awaiting response... 200 OK
Length: 963 [application/x-bzip2]
Saving to: ‘portage-latest.tar.bz2.gpgsig’

portage-latest.tar. 100%[===================>]     963  --.-KB/s    in 0s      

2018-04-20 10:15:31 (297 MB/s) - ‘portage-latest.tar.bz2.gpgsig’ saved [963/963]

--2018-04-20 10:15:31--  http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2.md5sum
Reusing existing connection to distfiles.gentoo.org:80.
HTTP request sent, awaiting response... 200 OK
Length: 57 [application/x-bzip2]
Saving to: ‘portage-latest.tar.bz2.md5sum’

portage-latest.tar. 100%[===================>]      57  --.-KB/s    in 0s      

2018-04-20 10:15:31 (21.2 MB/s) - ‘portage-latest.tar.bz2.md5sum’ saved [57/57]

FINISHED --2018-04-20 10:15:31--
Total wall clock time: 10s
Downloaded: 3 files, 50M in 9.5s (5.30 MB/s)
taglio@cyberdream ~/Sources/Rpi3/portage $ 
```

Next to verify the gpg signature we're going to fetch with `gpg` the latest key from the *Gentoo Portage Snapshot signing Key (Automated signing key)*. We have to find the `Key ID` in the official page de Release Engeneer:

https://wiki.gentoo.org/wiki/Project:RelEng#Keys

In our case is `0xDB6B8C1F96D8BF6D`.

Various options to launch with `gpg`:

- `--search`: search for keys on a keyserver.
- `1`: public key imported.
- `--edit-key`: Present a menu which enables you to do most of the key management related tasks.
- `fpr`: show key fingerprint.
- `trust`: change the ownertrust.
- `5`: ultimate trust.
- `--verify`: Assume that the first argument is a signed file and verify it
  without generating any output. With no arguments, the signature
  packet is read from STDIN. If only one argument is given, the
  specified file is expected to include a complete signature.

```
taglio@cyberdream ~/Sources/Rpi3/portage $ gpg --search 0xDB6B8C1F96D8BF6D
gpg: data source: http://37.191.226.104:11371
(1) Gentoo Portage Snapshot Signing Key (Automated Signing Key)
      4096 bit RSA key 0xDB6B8C1F96D8BF6D, created: 2011-11-25, expires: 2019-01-01
Keys 1-1 of 1 for "0xDB6B8C1F96D8BF6D".  Enter number(s), N)ext, or Q)uit > 1
gpg: key 0xDB6B8C1F96D8BF6D: 13 signatures not checked due to missing keys
gpg: key 0xDB6B8C1F96D8BF6D: public key "Gentoo Portage Snapshot Signing Key (Automated Signing Key)" imported
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: depth: 0  valid:   3  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 3u
gpg: next trustdb check due at 2019-08-22
gpg: Total number processed: 1
gpg:               imported: 1
taglio@cyberdream ~/Sources/Rpi3/portage 
taglio@cyberdream ~/Sources/Rpi3/portage $ gpg --edit-key 0xDB6B8C1F96D8BF6D
gpg (GnuPG) 2.2.6; Copyright (C) 2018 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.


pub  rsa4096/0xDB6B8C1F96D8BF6D
     created: 2011-11-25  expires: 2019-01-01  usage: C   
     trust: unknown       validity: unknown
sub  rsa4096/0xEC590EEAC9189250
     created: 2011-11-25  expires: 2019-01-01  usage: S   
[ unknown] (1). Gentoo Portage Snapshot Signing Key (Automated Signing Key)
gpg> fpr
pub   rsa4096/0xDB6B8C1F96D8BF6D 2011-11-25 Gentoo Portage Snapshot Signing Key (Automated Signing Key)
 Primary key fingerprint: DCD0 5B71 EAB9 4199 527F  44AC DB6B 8C1F 96D8 BF6D

gpg> trust
pub  rsa4096/0xDB6B8C1F96D8BF6D
     created: 2011-11-25  expires: 2019-01-01  usage: C   
     trust: unknown       validity: unknown
sub  rsa4096/0xEC590EEAC9189250
     created: 2011-11-25  expires: 2019-01-01  usage: S   
[ unknown] (1). Gentoo Portage Snapshot Signing Key (Automated Signing Key)

Please decide how far you trust this user to correctly verify other users' keys
(by looking at passports, checking fingerprints from different sources, etc.)

  1 = I don't know or won't say
  2 = I do NOT trust
  3 = I trust marginally
  4 = I trust fully
  5 = I trust ultimately
  m = back to the main menu

Your decision? 5
Do you really want to set this key to ultimate trust? (y/N) y

pub  rsa4096/0xDB6B8C1F96D8BF6D
     created: 2011-11-25  expires: 2019-01-01  usage: C   
     trust: ultimate      validity: unknown
sub  rsa4096/0xEC590EEAC9189250
     created: 2011-11-25  expires: 2019-01-01  usage: S   
[unknown] (1). Gentoo Portage Snapshot Signing Key (Automated Signing Key)
Please note that the shown key validity is not necessarily correct
unless you restart the program.
taglio@cyberdream ~/Sources/Rpi3/portage $ mv portage-latest.tar.bz2.gpgsig portage-latest.tar.bz2.sig
taglio@cyberdream ~/Sources/Rpi3/portage $ gpg --verify portage-latest.tar.bz2.sig
gpg: assuming signed data in 'portage-latest.tar.bz2'
gpg: Signature made Fri 20 Apr 2018 02:51:21 CEST
gpg:                using RSA key E1D6ABB63BFCFB4BA02FDF1CEC590EEAC9189250
gpg: Good signature from "Gentoo Portage Snapshot Signing Key (Automated Signing Key)" [ultimate]
Primary key fingerprint: DCD0 5B71 EAB9 4199 527F  44AC DB6B 8C1F 96D8 BF6D
     Subkey fingerprint: E1D6 ABB6 3BFC FB4B A02F  DF1C EC59 0EEA C918 9250
taglio@cyberdream ~/Sources/Rpi3/portage $ 
```

`untar` the tarball following the last `tar` command:

```
cyberdream /mnt/piroot/usr # tar xvjpf /home/taglio/Sources/Rpi3/portage/portage-latest.tar.bz2 --xattrs-include='*.*' --numeric-owner
.
.
.
cyberdream /mnt/piroot/usr #
```

### Wireless and bluetooth closed source firmware

The chipset of the wi-fi interface that come inside the single-board Raspberry Pi 3 is a **Broadcom BRM43430** and needs two files to be present under `/lib/firmware/brcm`.

The `.bin` is a [*binary blob*](https://en.wikipedia.org/wiki/Binary_blob) closed source piece of software. We can download it from the GitHub.com repository of the [**armbian**](https://www.armbian.com/) linux distribution. `brcmfmac` is a *Full-mac* driver we can read more about it here:

https://wireless.wiki.kernel.org/en/developers/documentation/glossary

```
taglio@cyberdream ~/Sources/Rpi3/wireless_firmware $ wget https://raw.GitHubusercontent.com/armbian/firmware/master/brcm/brcmfmac43430-sdio.txt
--2018-04-25 02:18:14--  https://raw.GitHubusercontent.com/armbian/firmware/master/brcm/brcmfmac43430-sdio.txt
Resolving raw.GitHubusercontent.com... 151.101.36.133
Connecting to raw.GitHubusercontent.com|151.101.36.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 902 [text/plain]
Saving to: ‘brcmfmac43430-sdio.txt’

brcmfmac43430-sdio. 100%[===================>]     902  --.-KB/s    in 0s      

2018-04-25 02:18:15 (309 MB/s) - ‘brcmfmac43430-sdio.txt’ saved [902/902]

taglio@cyberdream ~/Sources/Rpi3/wireless_firmware $ wget https://GitHub.com/armbian/firmware/raw/master/brcm/brcmfmac43430-sdio.bin
--2018-04-25 02:21:43--  https://GitHub.com/armbian/firmware/raw/master/brcm/brcmfmac43430-sdio.bin
Resolving GitHub.com... 192.30.253.112, 192.30.253.113
Connecting to GitHub.com|192.30.253.112|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://raw.GitHubusercontent.com/armbian/firmware/master/brcm/brcmfmac43430-sdio.bin [following]
--2018-04-25 02:21:44--  https://raw.GitHubusercontent.com/armbian/firmware/master/brcm/brcmfmac43430-sdio.bin
Resolving raw.GitHubusercontent.com... 151.101.36.133
Connecting to raw.GitHubusercontent.com|151.101.36.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 416477 (407K) [application/octet-stream]
Saving to: ‘brcmfmac43430-sdio.bin’

brcmfmac43430-sdio. 100%[===================>] 406.72K  1.61MB/s    in 0.2s    

2018-04-25 02:21:44 (1.61 MB/s) - ‘brcmfmac43430-sdio.bin’ saved [416477/416477]

taglio@cyberdream ~/Sources/Rpi3/wireless_firmware $ 
cyberdream /mnt/piroot/lib # mkdir -pv firmware/brcm
mkdir: created directory 'firmware'
mkdir: created directory 'firmware/brcm'
cyberdream /mnt/piroot/lib # cp -v /home/taglio/Sources/Rpi3/wireless_firmware/brcmfmac43430-sdio.* firmware/brcm/
'/home/taglio/Sources/Rpi3/wireless_firmware/brcmfmac43430-sdio.bin' -> 'firmware/brcm/brcmfmac43430-sdio.bin'
'/home/taglio/Sources/Rpi3/wireless_firmware/brcmfmac43430-sdio.txt' -> 'firmware/brcm/brcmfmac43430-sdio.txt'
cyberdream /mnt/piroot/lib # 
```

Next we have to fetch another *bynary blob* for the bluetooth chip that is a **BCM2837** and it is connected to the [**hardware UART**](https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter). We can do it from the Raspbian [bluez-firmware](https://github.com/RPi-Distro/bluez-firmware/tree/master/broadcom) GitHub repository.

```
taglio@cyberdream ~/Sources/Rpi3/wireless_firmware $ wget https://raw.githubusercontent.com/RPi-Distro/bluez-firmware/master/broadcom/BCM43430A1.hcd
--2018-04-25 02:51:22--  https://raw.githubusercontent.com/RPi-Distro/bluez-firmware/master/broadcom/BCM43430A1.hcd
Resolving raw.githubusercontent.com... 151.101.36.133
Connecting to raw.githubusercontent.com|151.101.36.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 36264 (35K) [application/octet-stream]
Saving to: ‘BCM43430A1.hcd’

BCM43430A1.hcd      100%[===================>]  35.41K  --.-KB/s    in 0.06s   

2018-04-25 02:51:22 (629 KB/s) - ‘BCM43430A1.hcd’ saved [36264/36264]

taglio@cyberdream ~/Sources/Rpi3/wireless_firmware $ 
cyberdream /mnt/piroot/lib # cp -v /home/taglio/Sources/Rpi3/wireless_firmware/BCM43430A1.hcd firmware/brcm/
'/home/taglio/Sources/Rpi3/wireless_firmware/BCM43430A1.hcd' -> 'firmware/brcm/BCM43430A1.hcd'
cyberdream /mnt/piroot/lib #
```

### Custom config files

We've to change some files under `/mnt/piroot` and `/mnt/piboot` to make the *first run* possible. They are:

- `etc/fstab`: static information about the filesystems.
- `config.txt`: more information at https://elinux.org/RPiconfig
- `cmdline.txt`: more information at https://elinux.org/RPi_cmdline.txt
- `etc/conf.d/keymaps`: keyboard table descriptions for loadkeys and dumpkeys.
- `etc/shadow`: shadowed password file (set `root` passwod to *raspberry*).

```
cyberdream /mnt/piroot/etc # cat > fstab << EOF
> /dev/mmcblk0p1          /boot           vfat            noauto,noatime  1 2
> /dev/mmcblk0p2          none            swap            sw              0 0
> /dev/mmcblk0p3          /               ext4            noatime         0 1
> EOF
cyberdream /mnt/piroot/etc # 
cyberdream /mnt/piboot # cat > config.txt << EOF
> # have a properly sized image
> disable_overscan=1
> 
> # lets have the VC4 hardware accelerated video
> dtoverlay=vc4-fkms-v3d
> 
> # for sound over HDMI
> hdmi_drive=2
> 
> # Enable audio (loads snd_bcm2835)
> dtparam=audioon
> 
> # gpu_mem is for closed-source driver only; since we are only using the
> # open-source driver here, set low
> gpu_mem=16
> EOF
cyberdream /mnt/piboot # 
cyberdream /mnt/piboot # cat > cmdline.txt << EOF
> root=/dev/mmcblk0p3 rootfstype=ext4 rootwait
> EOF
cyberdream /mnt/piboot #
cyberdream /mnt/piroot/etc/conf.d # cat > keymaps << EOF
> # Use keymap to specify the default console keymap.  There is a complete tree
> # of keymaps in /usr/share/keymaps to choose from.
> keymap='es'
> 
> # Should we first load the 'windowkeys' console keymap?  Most x86 users will
> # say "yes" here.  Note that non-x86 users should leave it as "no".
> # Loading this keymap will enable VT switching (like ALT+Left/Right)
> # using the special windows keys on the linux console.
> windowkeys="YES"
> 
> # The maps to load for extended keyboards.  Most users will leave this as is.
> extended_keymaps=""
> #extended_keymaps="backspace keypad euro2"
> 
> # Tell dumpkeys(1) to interpret character action codes to be
> # from the specified character set.
> # This only matters if you set unicode="yes" in /etc/rc.conf.
> # For a list of valid sets, run `dumpkeys --help`
> dumpkeys_charset=""
> 
> # Some fonts map AltGr-E to the currency symbol instead of the Euro.
> # To fix this, set to "yes"
> fix_euro="NO"
> EOF
cyberdream /mnt/piroot/etc/conf.d #
cyberdream /mnt/piroot/etc # cat > shadow << EOF
>
root:/Td5iP$/7Asdgq0ux2sgNkklnndcG4g3493kUYfrrdenBXjxBxEsoLneJpDAwOyX/kkpFB4pU5dlhHEyN0SK4eh/WpmO0:10770:0:::::
> halt:*:9797:0:::::
> operator:*:9797:0:::::
> shutdown:*:9797:0:::::
> sync:*:9797:0:::::
> bin:*:9797:0:::::
> daemon:*:9797:0:::::
> adm:*:9797:0:::::
> lp:*:9797:0:::::
> news:*:9797:0:::::
> uucp:*:9797:0:::::
> portage:*:9797:0:::::
> nobody:*:9797:0:::::
> man:!:17595::::::
> sshd:!:17595::::::
> EOF
cyberdream /mnt/piroot/etc #
```

### First boot

`umount` and `sync` the *microSD* partition and insert it in the **Raspberry pi 3** slot.

```
cyberdream ~ # umount -v /mnt/piroot/
umount: /mnt/piroot/ unmounted
cyberdream ~ # umount -v /mnt/piboot/
umount: /mnt/piboot/ unmounted
cyberdream ~ # sync
cyberdream ~ # 
```

Connect an *HDMI* cable to a monitor and a *USB* mouse and keyboard to the **Raspberry pi 3** ports.