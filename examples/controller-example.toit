import mqtt-e2e show MqttE2E ntp-time
import .shared
import host.os
import host.pipe
import io
import log

/*
Edit "shared.toit" before you run it with

jag run -d host controller-example.toit

Can only be run on the PC due to the host module.
*/

main:
  // Comment out to see debug info, rejected messages, mqtt pings, etc
  log.set-default (log.default.with-level log.INFO_LEVEL)
  //
  m:= MqttE2E
      --key=aes-key
      --host=mqtt-host
      --pad-size=pad-size
      --publish-suffix=controller-suffix
      --subscribe-suffix="iot/#" // aLL THE iOT devices publish on xyz/iot/#
  task::
    print "Type commands : \"status\" or \"ping\""
    while true:
      w:=pipe.stdin.in.read-line.trim
      if w.size>0:
        print "Sending \"$w\""
        m.send w
      /*
      if w=="wrongtime":
        m.send-bogus w --time-deviation
      else if w=="wrongkey":
        // Note the topic is the correct one
        // otherwise the receiver does not get anything anyway
        m.send-bogus w --wrong-key
      else if w=="bogus-size":
        m.send-bogus w --bogus-size
      else:
        m.send w */

  task::
    print 
    while true:
      err := catch:
        msg:=m.receive
        msg-str := msg[1].to-string.trim
        print
        print "Incoming message:"
        print "topic = \"$msg[0]\""
        print "message = \"$msg-str\""
      if err:
        print "Receiving message error = $err"
