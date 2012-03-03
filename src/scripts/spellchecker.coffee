# Allows Hubot to spellcheck phrases.
# Will work straight away with: https://github.com/markwillis82/php-googleSpellchecker
#
# spell me <phrase> - Sends the phrase to a url to be checked -

spellUrl=""

module.exports = (robot) ->

  robot.respond /spell me (.*)$/i, (msg) ->
    msg.http(spellUrl)
    .get() (err, res, body) ->
      results = for word, matches of JSON.parse(body)
      	"(#{word}) Did you mean: "+matches.join(", ")+"\r\n"
      msg.send results
