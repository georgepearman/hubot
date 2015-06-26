# Description:
#   Assorted silly sayings.

module.exports = (robot) ->

  robot.respond /find us at (.*)/i, (res) ->
    loc = res.match[1]
    if msg.message.user.name.toLowerCase() == 'george' or msg.message.user.name.toLowerCase() == 'gfiddy' or msg.message.user.name.toLowerCase() == 'vikram':
        spawn '/home/hubot/update_findus.sh', [loc]
        res.reply "I updated georgepearman.com/europe/findus"

