# Description:
#   for lookat me
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   

module.exports = (robot) ->
    robot.hear /(mood)/i, (msg) ->
        msg.send hello.replace "%", msg.message.user.name

