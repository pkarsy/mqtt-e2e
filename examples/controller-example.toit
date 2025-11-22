import ..mqtt-e2e
import .shared
import host.os
import host.pipe
import io
import log

/*
Can only be run on the PC due to the host module
*/

main:
  log.set-default (log.default.with-level log.INFO_LEVEL)
  // blocks until time is set. After that fixes the time every 1h in the background
  //ntp-time --max-rtt=(Duration --s=10)
  // Now the time is in sync
  m:= MqttE2E
      --key=encryption-key
      --host=mqtt-host
      --pad-size=pad-size
      --publish-suffix=controller-suffix
      --subscribe-suffix="iot/#" // aLL THE iOT devices publish on xyz/iot/#
  task::
    print "Type commands : \"status\" or \"ping\""
    while true:
      w:=pipe.stdin.in.read-line.trim
      if w=="wrongtime":
        m.send-bogus w --time-deviation
      else if w=="wrongkey":
        // Note the topic is the correct one
        // otherwise the receiver does not get anything anyway
        m.send-bogus w --wrong-key
      else if w=="bogus-size":
        m.send-bogus w --bogus-size
      else:
        m.send w
  task::
    print 
    while true:
      err := catch:
        msg:=m.receive
        msg-str := msg[1].to-string.trim
        print "Incoming message:  $msg[0] $msg-str"
      if err:
        print "Receiving message error = $err"
