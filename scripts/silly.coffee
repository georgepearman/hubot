# Description:
#   Assorted silly sayings.

module.exports = (robot) ->
  SUPER_EFFECTIVE_FREQ = 0.25

  robot.hear /\ uses /i, (res) ->
    res.send "It's super effective!" if Math.random() < SUPER_EFFECTIVE_FREQ

  robot.hear /[a-z]+-ass \w+/i, (res) ->
    res.send res.message.toString().replace('-ass ', ' ass-')

  robot.hear /\ _?ex/i, (res) ->
    res.send res.message.toString().replace(' ex', ' sex').replace(' _ex', ' _sex')
