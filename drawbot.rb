require 'discordrb'
require 'yaml'
require 'rest_client'

# at the beginning of your program in global scope
# $ symbol denotes a global variable

#-------YAML THINGS------#
$db = YAML.load(File.read('db.yaml'))

BoopAction = $db['BoopAction']
WaterContainer = $db['WaterContainer']
Outfit = $db['Outfit']
DrawTopic = $db['DrawTopic']
DrawComboTopic = $db['DrawComboTopic']
LewdDrawTopic = $db['LewdDrawTopic']
NormalDrawTopic = $db['NormalDrawTopic']
Artists = $db['Artists']
LewdDrawFagTopic = $db['LewdDrawFagTopic']
Snake = $db['Snake']
Puns = $db['Puns']
Pokemon = $db['Pokemon']
Token = $db['token']
Fpose = $db['fpose']
Pout = $db['pout']
Told = $db['told'].join("\n")
Rekt = $db['rekt'].join("\n")

DEVCHANNEL = 180323434226647040

EIGHTBALL= ["What? Yea, fine whatever. Yes",
            "Ugh not this time. No.",
            "would you hate me if I said no? because... no.",
            "the truth is hard sometimes, and my answer is no",
            "Yes. Do it. It'll be cool.",
            "What is in it for me? Nothing? Ask later.",
            "uhhhhh, sure",
            "Yea sure man I don't see why not.",
            "Yes as long as you give me head pats.",
            "Mmmm no.",
            "Yea if you call me a cutie :heart:",
            "let me take a picture of you face first. Ok now, yea.",
            "Don't talk to me right now, LEave me alone. Ask later",
            "Go away, ask later. Jerk",
            "Does that seem like a good idea? No. Because it's not.",
            "Don't worry I don't blame you. You can ask later",
            "I'm sorry ask me some other time.",
            "Fine yes!",
            "Sure whatever.",
            "Yea, but ony cause I care about you.",
            "I'm going for a drive, s ask me in a bit.",
            "yes...?",
            "Heh.. heh.. Ask later?",
            "Yyyyeeaaa....",
            "Yes sure let's get on with it",
            "FINE YES JUST STOP SHAKING MY HEAD",
            "What? No. Don't ever ask again",
            "Uhhhhhh nnnoooooo",
            "Is... is that the thing you want? no man. god.",
            "No and no to your next question",
            "A-ask again l-later...",
            "That's a hard question.... ask me again some other time please?",
            "Yea I don't see why not",
            "Pffft Haha, yea sure why not",
            "A-ask again later",
            "give me a sec... ask me some other time...",
            "Yes.... Yes...",
            "mmmmm..... maybe",
            "N-no...",
            "sure thing big boy",
            "certainly!",
            "Yes I'm feeling it",
            "yes",
            "oh boy! Yes!",
            "dude no, let it go",
            "what do you think?",
            "I'm not sure...",
            "I don't wanna answer that",
            "yes, but you will regret it",
            "c-come back later",
            "ve me time to think about it",
            "no you fucker!",
            "yea sure, what ever",
            "no not this time...",
            "hell yea man",
            "Nah",
            "Your Mother",
            "Pfft hahaha don't even ask.",
            "I don't feel like saying yes, so no",
            "Let me think about it..... no",
            "One sec. Let me ask my magic 8 ball...hold on...just a bit more...yes",
            "One sec. Let me ask my magic 8 ball...hold on...just a bit more...no",
            "Maybe if you yell louder",
            "Maybe if you shake harder you'll get a proper answer",
            "Does a bear shit in the woods?",
            "Do aliens stick shit up our poopers? Yes, yes they do.",
            "no, just stop",
            "It's not gonna happen, guy.",
            "Sure thing, friend",
            "No but I can make it a yes for $20",
            "Yes god dammit. Now quit shaking me!",
            "No, fuck you and your shitty dreams",
            "Stop oppressing me! No means No!",
            "Hell YEA",
            "Hell NO",
            "Fuck you, you figure it out",
            "Ha haha hahaha no",
            "Fuck yea",
            "Fuck no",
            "It is certain",
            "It is decidedly so",
            "Without a doubt",
            "Yes definitely",
            "You may rely on it",
            "As I see it, yes",
            "Most likely",
            "Doesn't look good...",
            "Yes",
            "Signs point to yes",
            "Ask again later",
            "Don't count on it",
            "My reply is no",
            "Drawbot says no"]

ZII = ["http://puu.sh/pCwOM/a55cb94cea.jpg",
       "http://puu.sh/pCwQc/b10381298b.jpg",
       "http://puu.sh/pCwSu/a87c3f352e.jpg",
       "http://puu.sh/pCwTj/fbcbaa61b6.jpg",
       "http://puu.sh/pCwU7/7363e7b5ad.jpg",
       "http://puu.sh/pCwV1/6db9f62766.jpg",
       "http://puu.sh/pCwXm/e0def20ba2.jpg",
       "http://puu.sh/pCwZh/669d9212d8.jpg",
       "http://puu.sh/pCwZh/669d9212d8.jpg",
       "http://puu.sh/pCwZu/772d8e3e09.jpg",
       "http://puu.sh/pCx1M/672739a131.jpg",
       "http://puu.sh/pCx4v/57577b2411.jpg",
       "http://puu.sh/pCxbC/8049f3232f.jpg",
       "http://puu.sh/pCxcy/68da5bc7b9.jpg",
       "http://puu.sh/pCxdc/28e7b19d9d.jpg",
       "http://puu.sh/pCxe4/fbde5b31bf.jpg",
       "http://puu.sh/pCxfZ/7669209698.jpg",
       "http://puu.sh/pCxgA/d8f919ec8e.jpg",
       "http://puu.sh/pCxhm/1637cc0f7d.jpg",
       "http://puu.sh/pCxid/1f8c059fa1.jpg",
       "http://puu.sh/pCxky/784115712b.jpg",
       "http://puu.sh/pCxqR/7a8158fc89.jpg",
       "http://puu.sh/pCxrg/490bb762aa.jpg",
       "http://puu.sh/pCxt4/a3a64a85a8.jpg",
       "http://puu.sh/pCxwo/ff11e43c1f.jpg",
       "http://puu.sh/pCxx8/783e6b98c0.jpg",
       "http://puu.sh/pCxyV/c2c2da4a01.jpg",
       "http://puu.sh/pCxF3/a2c110de3c.jpg",
       "http://puu.sh/pCxGO/3a27832a82.jpg",
       "http://puu.sh/pCxIp/a22edff12b.jpg",
       "http://puu.sh/pCxJr/1d917a0ecf.jpg",
       "http://puu.sh/pCxKR/7bbd6d36e9.jpg",
       "http://puu.sh/pCxLU/dffe1dd72a.jpg",
       "http://puu.sh/pCxMd/b47a317e88.jpg",
       "http://puu.sh/pCxMx/7e4d32fc38.jpg",
       "http://puu.sh/pCutG/b3085a9fb2.jpg",
       "http://puu.sh/pCuvw/64b387388a.jpg",
       "http://puu.sh/pCuwA/e60052bb42.jpg",
       "http://puu.sh/pCuxf/bb2633b2ad.jpg",
       "http://puu.sh/pCuys/40a51a64cb.jpg",
       "http://puu.sh/pCuzt/f415ddcf09.jpg",
       "http://puu.sh/pCuAR/72b993d9dd.jpg",
       "http://puu.sh/pCuBY/08697be7b3.jpg",
       "http://puu.sh/pCuCP/473f07c1a4.jpg",
       "http://puu.sh/pCuDC/b9dee75ad9.jpg",
       "http://puu.sh/pCuFV/4b85f5a1a5.jpg",
       "http://puu.sh/pCuH2/c5cb50dd2b.jpg",
       "http://puu.sh/pCuIb/54c95d8a75.jpg",
       "http://puu.sh/pCuIN/e25702470e.jpg",
       "http://puu.sh/pCuJv/388cdd25eb.jpg",
       "http://puu.sh/pCuKl/da6528c513.jpg",
       "http://puu.sh/pCuKY/643e2dff72.jpg",
       "http://puu.sh/pCuM3/e2508bc376.jpg",
       "http://puu.sh/pCuMW/9767fe964d.jpg",
       "http://puu.sh/pCuNZ/21ed1d828c.jpg",
       "http://puu.sh/pCuPt/7ce105b079.jpg",
       "http://puu.sh/pCuQL/789a74f811.jpg",
       "http://puu.sh/pCuRi/c2af6ab667.jpg",
       "http://puu.sh/pCuS2/72b6a67f74.jpg",
       "http://puu.sh/pCuTm/8adfba1e8b.jpg",
       "http://puu.sh/pCuU6/c34922448f.jpg",
       "http://puu.sh/pBohd/86210da8e5.png",
       "http://puu.sh/pBoq8/a52417e26f.jpg",
       "http://puu.sh/pBor6/6a4ba444fc.jpg",
       "http://puu.sh/pBov7/31d4796a73.png",
       "http://puu.sh/pBosq/5f1d0e3479.png",
       "http://puu.sh/pBox4/5811840c5c.png",
       "http://puu.sh/pBow6/567875b3ac.jpg",
       "http://puu.sh/pBoxH/c150a055ed.png",
       "http://puu.sh/pBoy8/dafb191e20.png",
       "http://puu.sh/pBoD4/e399c9a5ea.jpg",
       "http://puu.sh/pBoDN/309a8725ef.png",
       "http://puu.sh/pBoEt/492ee5ecb5.jpg",
       "http://puu.sh/pBoFn/b3327e5f17.jpg",
       "http://puu.sh/pBoG0/9fea6ced19.jpg",
       "http://puu.sh/pBoHY/9c561c47b3.png",
       "http://puu.sh/pBoID/4495d77f3c.png",
       "http://puu.sh/pBoJP/0ec1b5a19a.png",
       "http://puu.sh/pBoKd/46a632c992.png",
       "http://puu.sh/pBoLm/f9e3a3b416.jpg",
       "http://puu.sh/pBoME/7c410e64a9.jpg",
       "http://puu.sh/pBoNB/dfd904b8fe.jpg",
       "http://puu.sh/pBoO4/a1a4a04145.jpg",
       "http://puu.sh/pBoOP/66e7448ab7.jpg",
       "http://puu.sh/pBoPP/eabf6e1ae2.png",
       "http://puu.sh/pBoUg/8b16d31453.png",
       "http://puu.sh/pBoVa/30164ceae0.png",
       "http://puu.sh/pBoQo/76a7125b54.png",
       "http://puu.sh/pBoTF/56fe2f5b8d.png",
       "http://puu.sh/pBoTj/7c2664df15.png",
       "http://puu.sh/pBoWf/e73c08fcac.png",
       "http://puu.sh/pBoSw/8963c65d89.png",
       "http://puu.sh/pBoRT/ab49e451c9.png",
       "http://puu.sh/pBoWx/ca8bf43307.jpg",
       "http://puu.sh/pBoYk/87127da2ad.png",
       "http://puu.sh/pBoYJ/c7fe27ca63.jpg",
       "http://puu.sh/pBoZR/a4cddea3f4.png",
       "http://puu.sh/pBp0c/8648ce0a70.png",
       "http://puu.sh/pBp0L/0c77ff36c7.png"]

bot = Discordrb::Commands::CommandBot.new token: $db['token'], application_id: 168123456789123456, prefix: '~'

#restart bot
bot.command(:restart, description: "restarts the bot") do |event|
  break unless event.channel.id == DEVCHANNEL
  event << "Restart issued.. :wrench:"
  bot.stop
  exit
end

bot.ready do |event|
  event.bot.send_message(DEVCHANNEL, "Drawbot online! Let's get some art done!")
  avatar = File.open('media/avatar.jpg','rb')
  event.bot.profile.avatar = avatar
  nil
end

#-----------COMMANDS COMMAND--------#
commands = [
  "=======",
  "~rules",
  "=======",
  "",
  "Drawing Commands",
  " ~draw",
  " ~drawlewd",
  " ~drawcombo",
  " ~drawfaglewd",
  " ~colour",
  " ~outfit",
  " ~pokemon",
  " ~fpose",
  "",
  "Fun Commands",
  " ~8ball",
  " ~zii(8ball clone)",
  " ~bad",
  " ~boop",
  " ~slap",
  " ~rub",
  " ~hump",
  " ~spray",
  " ~grope",
  " ~nellyheart",
  " ~snek",
  " ~lewd",
  " ~roll (default 6, add number after to make larger)",
  " ~pun",
  " ~told",
  " ~gimme",
  " ~pout",
  " ~poses",
  " ~texas",
  " ~salt",
  " ~orangyheart",
  "",
  "References (type ~refs then @them)",
  " AngryCoconut",
  " Bluebun",
  " ClearCandy",
  " Dako",
  " Echo",
  " GlooTheSlime",
  " Jim",
  " Luna",
  " Mothbro",
  " Mundy",
  " Murphy",
  " Nelsha",
  " Nim",
  " Nuclear",
  " Orangy",
  " Ossien",
  " Solitaire",
  " mpsketches"
]
#-------------VARIABLES-------------#

rules = ["Golden Rule Be excelent to each other
1 - This is not a hugbox, but that does not give you the right to be a dick
2 - This place is to help everyone improve their art skills. So please use constructive criticism
3 - If there is an active conversation going on please do not try to derail it
4 - Be mature. We are all adults, so don't go memeing it up too much

Rules will be added by majority interest or by obtuse necessity by the acting administration, and shall exclusively serve to maintain creative expressionism and the integrity of the community, or to prevent the abuse, harassment or bullying by or unto one of the participants"]

#___________________________________________
#___________________________________________
#___________________________________________

#-------------SILLY COMMANDS---------#

bot.command(:'8ball') do |event, *message|
  message = message.join(' ')
  event << "#{event.user.mention} `#{message}`: **#{EIGHTBALL.sample}**"
end

bot.command(:zii) do |event, *message|
  message = message.join(' ')
  event << "#{event.user.mention} `#{message}`: **#{EIGHTBALL.sample}**"
  event << "#{ZII.sample}"
end

bot.command :roll do |event, roll|
  roll = roll.split('d').map(&:to_i)
  roll = roll[0].times.collect { |x| rand(1..roll[1]) }
  total = roll.inject(0){|sum,x| sum + x }
  event << "#{event.user.display_name} throws their dice down and roll `#{roll.join(', ')} = #{total}`"
end

bot.command(:boop) do |event, *message|
  message = message.join(' ')
  event << "#{event.user.display_name} #{BoopAction.sample} boops #{message}"
end

bot.command(:slap) do |event, *message|
  message = message.join(' ')
  event << "#{event.user.display_name} #{BoopAction.sample} slaps #{message}"
end

bot.command(:rub) do |event, *message|
  message = message.join(' ')
  event << "#{event.user.display_name} #{BoopAction.sample} rubs #{message}"
end

bot.command(:grope) do |event, *message|
  message = message.join(' ')
  event << "#{event.user.display_name} #{BoopAction.sample} gropes #{message}"
end

bot.command(:hug) do |event, *message|
  message = message.join(' ')
  event << "#{event.user.display_name} #{BoopAction.sample} hugs #{message}"
end

bot.command(:hump) do |event, *message|
  message = message.join(' ')
  event << "#{event.user.display_name} #{BoopAction.sample} humps #{message}"
end

bot.command(:doit) do |event|
  response = "https://puu.sh/pvFxQ/893adbe906.jpg"
  event << response
end

bot.command(:gimme) do |event|
  response = "http://puu.sh/pBgxi/d0b8de2e31.png"
  event << response
end

#TIMEOUT
bot.command(:bad) do |event, *message|
  break unless !event.user.roles.find { |x| x.name =="DBAdmin" }.nil?
  message = message.join(' ')
  event << "#{event.user.display_name} throws #{message} into timeout"
end

bot.command(:spray) do |event, *message|
  message = message.join(' ')
  event << "#{event.user.display_name} sprays #{message} with a #{WaterContainer.sample}"
end

bot.command(:outfit) do |event|
  event << "#{event.user.mention} your outfit is #{Outfit.sample}"
end

bot.command(:nellyheart) do |event|
  response = "http://puu.sh/pc0pc/2b1b918f9d.png"
  event << "#{response}"
end

bot.command(:snek) do |event|
  event << "#{Snake.sample}"
end

bot.command(:pun) do |event|
  event << "#{Puns.sample}"
end

bot.command(:told) do |event|
  event << Told
end

bot.command(:rekt) do |event|
  event << Rekt
end

bot.command(:rules) do |event|
  event << "#{rules.join("\n")}"
end

bot.command(:commands) do |event|
  event << "#{commands.join("\n")}"
end

#COLOUR COMMAND
bot.message(with_text: "~colour") do |event|
  response = [
    "Your complementarty colours are\nhttp://puu.sh/pqAwB/b5468b1654.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAx5/1c090a95b4.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAxT/cc4b5b2fc7.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAyG/7ab6b8f950.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAzl/4a32fab083.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAA8/f8106ac73e.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAB2/7d927ad8f6.png",
    "Your complementarty colours are\nhttp://puu.sh/pqABX/b54a2abd04.png",
    "Your complementarty colours are\nhttp://puu.sh/pqACN/9777db3774.png",
    "Your complementarty colours are\nhttp://puu.sh/pqADI/e6b0ec3761.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAEA/783cfdd343.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAFj/48248a1609.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAFG/88a459c891.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAGE/c844df2fef.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAH6/b22e5c586f.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAHC/1cd551a06a.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAIz/ed77f33642.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAJo/0053f1fe57.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAK3/bbeaf93d37.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAKC/664004eb1f.png",
    "Your complementarty colours are\nhttp://puu.sh/pqALq/c379d2693e.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAM3/07e445f7b1.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAMz/e6fecd98fa.png",
    "Your complementarty colours are\nhttp://puu.sh/pqAN0/f5d1f3243b.png",
    "Your complementarty colours are\nhttp://puu.sh/pqANz/71250f0876.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCp5/35616aae39.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCry/4149ac33ce.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCsf/da44188274.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCsV/427d4ce24c.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCty/1006208360.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCuf/9121b444b5.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCuQ/c81c283b27.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCwc/7bf6faac6a.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCwI/d1dadd50d1.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCxe/f56493c13a.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCyk/f6e4caf7ff.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCze/7d5d7f53da.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCA4/e3946d129d.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCAC/97ce61b43c.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCBn/b80a0d3bb8.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCCg/43e1354b35.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCCW/d433f6284d.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCDL/25f54ae1c9.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCEl/4e5da1116c.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCEW/b0e9ef7b99.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCFO/11adf02f6e.png",
    "Your complementarty colours are\nhttp://puu.sh/pqCGs/4e7377b53b.png",
  "Your complementarty colours are\nhttp://puu.sh/pqCHf/98acf8bddc.png"].sample

  event << response

end

#LEWD COMMAND
bot.command(:'lewd') do |event|
  response = [
    "https://i.imgur.com/I3apoUB.gif",
    "https://i.imgur.com/um5vVcC.gif",
    "https://i.imgur.com/pTb7vbZ.gif",
    "https://i.imgur.com/cqiyR1L.gif",
    "https://i.imgur.com/vZnMTFn.gif",
    "https://i.imgur.com/Ftuig9v.gif",
    "https://i.imgur.com/Gygj9sg.gif",
    "https://i.imgur.com/pPVVu2b.gif",
    "https://i.imgur.com/7QCizTa.gif",
    "https://i.imgur.com/PS12w7X.gif",
    "https://i.imgur.com/6fzs6jV.gif",
    "https://i.imgur.com/eBjiGR9.gif",
    "https://i.imgur.com/7KZ7hHy.gif",
    "https://i.imgur.com/hJP68mL.gif",
    "https://i.imgur.com/YXlOYiW.gif",
    "https://i.imgur.com/fUBsH9X.jpg",
    "https://i.imgur.com/MXeL1Jh.gif",
    "https://i.imgur.com/pUBnlrE.gif",
    "https://i.imgur.com/5xLBY1Y.gif",
    "https://i.imgur.com/WurU1qy.jpg",
    "https://i.imgur.com/UZV0T1p.gif",
    "https://i.imgur.com/7ncmr6H.png",
    "https://i.imgur.com/QQZmrJw.gif",
    "https://media.giphy.com/media/Ek61AvsTykm6k/giphy.gif",
  "https://i.imgur.com/3Etd0ik.gif",].sample

  event <<  response
end


#---------DRAW COMMANDS-----------#
bot.command(:draw) do |event|
  event << "You should draw #{DrawTopic.sample}"
end

bot.command(:drawlewd) do |event|
  event << "You should draw something #{DrawComboTopic.sample} #{LewdDrawTopic.sample}"
end

bot.command(:drawcombo) do |event|
  event << "You should draw something #{DrawComboTopic.sample} #{NormalDrawTopic.sample}"
end

bot.command(:drawfaglewd) do |event|
  event << "You must draw #{Artists.sample} #{LewdDrawFagTopic.sample}"
end
#this is really cool, i'm glad it was added!
bot.command :pokemon do |event|
  pkmn = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/pokemon/" + rand(1..721).to_s))
  url = JSON.parse(RestClient.get(pkmn['forms'][0]['url']))['sprites']['front_default']
  event << "Your pokemon to draw is: **#{pkmn['name'].split.map(&:capitalize).join(' ')}**"
  event << url
end

bot.command(:fpose) do |event|
  event << "The pose you get is #{Fpose.sample}"
end

bot.command(:poses) do |event|
  event << "roll 98\nhttps://puu.sh/oNXxK/474217250e.jpg\nroll 20\nhttps://puu.sh/oNxer/cb15424c85.jpg"
end

bot.command(:texas) do |event|
  event << "https://puu.sh/oQk1b/ddf195310c.png"
end

bot.command(:salt) do |event|
  event << "https://puu.sh/pwPPr/c4ea4b2e93.jpg"
end

bot.command(:orangyheart) do |event|
  event << "http://puu.sh/pCzpn/8f0f140aa1.jpg"
end



bot.command(:pout) do |event|
  event << "#{Pout.sample}"
end

#-----------REFERENCES--------#

#uses the yaml file, add more artists there!


#bot.command :refs do |event, *message|
#    message = message.join(' ')
#    user = Array.new
#
#    #pull users refs from db
#    $db['refs'].each do |key, value|
#        if key.casecmp(message) == 0
#            user = value
#        end
#    end
#
#    #check if array is still empty
#    #if it is, we didn't find a match
#    if user.empty?
#        event << "User not found.. :eyes:"
#        return
#    end
#
#    #output each ref
#    event << "#{message}'s refs:"
#    user.each { |x| event << x }
#    nil
#end


bot.command :refs do |event, mention|

  #get user
  user = $db['users'][event.bot.parse_mention(mention).id]

  #check if user isn't in our db
  if user.nil?
    event << "User not found.. :eyes:"
    return
  end

  if user['refs'].nil?
    event << "They don't have a ref, laugh at them!\nhttp://puu.sh/pBzdD/b516b51ba1.jpg"
    return
  end

  #output each ref
  event << "#{user['name']}'s refs:"
  user['refs'].each { |x| event << x }
  nil
end

bot.command :addref do |event, *url|
  break unless event.channel.id == DEVCHANNEL
  url = url.join(' ')

  #get user
  user = $db['users'][event.user.id]

  #check if user isn't in our db
  if user.nil?
    event << "User not found.. :eyes:"
    return
  end

  #add ref to user
  user['refs'] << url

  event << "Ref added! :wink:"

  #save db
  save
  nil
end

def save
  file = File.open("db.yaml", "w")
  file.write($db.to_yaml)
end

#------------Eval-----------#
bot.command(:eval, help_available: false) do |event, *code|
  break unless event.user.id == 132893552102342656
  begin
    eval code.join(' ')
  rescue => e
    "An error occured :disappointed: ```#{e}```"
  end
end

bot.command :getdb do |event|
  break unless event.channel.id == DEVCHANNEL
  file = File.open('db.yaml')
  event.channel.send_file(file)    
end

bot.run
