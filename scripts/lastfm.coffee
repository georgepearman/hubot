remSongs = ['King of Birds',
            'These Days',
            'World Leader Pretend',
            'Cuyahoga',
            'What\'s the Frequency, Kenneth?',
            'Radio Free Europe',
            'Losing My Religion',
            'Talk About the Passion',
            'Man on the Moon']
getSong = (msg, usr) ->
  user = usr ? msg.match[2]
  apiKey = process.env.HUBOT_LASTFM_APIKEY
  msg.http('http://ws.audioscrobbler.com/2.0/?')
    .query(method: 'user.getrecenttracks', user: user, api_key: apiKey, format: 'json')
    .get() (err, res, body) ->
      results = JSON.parse(body)
      if results.error
        msg.send results.message
        return
      song = results.recenttracks.track[0]
      msg.send "#{song.name} by #{song.artist['#text']}"

module.exports = (robot) ->
  robot.respond /what(')?s (.*) playing/i, (msg) ->
    getSong(msg)
  robot.respond /music me/i, (msg) ->
    if msg.message.user.name != 'gfiddy'
      getSong(msg, "vaaal")
      return
    song = msg.random remSongs
    msg.send "#{song} by R.E.M."

