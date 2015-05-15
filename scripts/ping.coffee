userCanKillMe  = ['george']
refuseToDie    = ['Well, give me a reason',
                  'Why you want to kill me',
                  'Are you sure?',
                  'Don\'t like me? I am only trying to help',
                  'I refused to die']

sleep = (ms) ->
  start = new Date().getTime()
  continue while new Date().getTime() - start < ms

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    if msg.message.user.name in userCanKillMe
      msg.send "I will be back ..."
      process.exit 0
    else
      msg.send msg.random refuseToDie
