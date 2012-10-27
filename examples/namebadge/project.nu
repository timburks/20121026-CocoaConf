#!/usr/local/bin/nush

;; Run this script to generate a project and install it on a BLE112.
;; The BLE112 must be attached to a TI CC Debugger that is connected to your computer.

;; The markup operators require a recent version of Nu (http://github.com/timburks/nu)
;; bgbuild and cc-tool must be in your path (OS X 10.8 or later required).
	
(set prefix "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n")

(set project (+ prefix
                (&project
                         (&gatt in:"gatt.xml")
                         (&hardware in:"hardware.xml")
                         (&script in:"namebadge.bgs")
                         (&usb_main in:"cdc.xml")
                         (&image out:"out.hex"))))

(project writeToFile:"project.xml" atomically:NO)

(set USERNAME "Tim Burks")

(set gatt (+ prefix
             (&configuration
                            (&service uuid:"1800"
                                 (&description "Generic Access Profile")
                                 (&characteristic uuid:"2a00"
                                      (&properties read:"true" const:"true")
                                      (&value USERNAME))
                                 (&characteristic uuid:"2a01"
                                      (&properties read:"true" const:"true")
                                      (&value type:"hex" "4142")))
                            
                            (&service type:"primary" uuid:"180A" id:"manufacturer"
                                 (&characteristic uuid:"2A25"
                                      (&properties read:"true" const:"true")
                                      (&value type:"hex" "000780c0ffeef00d"))
                                 (&characteristic uuid:"2A24"
                                      (&properties read:"true" const:"true")
                                      (&value "modelnumber"))
                                 (&characteristic uuid:"2A29"
                                      (&properties read:"true" const:"true")
                                      (&value "Radtastical"))))))

(gatt writeToFile:"gatt.xml" atomically:NO)

(system "bgbuild project.xml")
(system "cc-tool -e -w out.hex")
(system "cc-tool --read-mac-address")

