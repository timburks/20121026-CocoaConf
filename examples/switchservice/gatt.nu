(set gatt
     (&configuration
                    (&service uuid:"1800"
                         (&description "Generic Access Profile")
                         (&characteristic uuid:"2a00"
                              (&properties read:"true" const:"true")
                              (&value "Switch Service Demo"))
                         (&characteristic uuid:"2a01"
                              (&properties read:"true" const:"true")
                              (&value type:"hex" "4142")))
                    
                    (&service type:"primary" uuid:"9000" id:"manufacturer"
                         (&characteristic uuid:"9100"
                              (&properties read:"true" const:"true")
                              (&value type:"hex" "000780c0ffeef00d"))
                         (&characteristic uuid:"9101"
                              (&properties read:"true" const:"true")
                              (&value "modelnumber"))
                         (&characteristic uuid:"9106"
                              (&properties read:"true" const:"true")
                              (&value "Bluegiga")))
                    
                    (&service uuid:"A696CB2B-F3A4-4240-B74D-C457C253857B" advertise:"true"
                         (&description "Switch Service")
                         (&characteristic uuid:"AEDA780E-1CCF-4B85-BCA0-3484F295D031" id:"xgatt_switch_state"
                              (&description "Switch State")
                              (&properties read:"true" write:"true")
                              (&value type:"hex" length:"1")))))

(puts gatt)