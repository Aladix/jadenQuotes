# Description:
#   Gives wisdom from Jaden Smith
#
# Dependencies:
#   "twit": "1.1.6"
#   "underscore": "1.4.4"
#
# Configuration:
#   None
#
# Commands:
#   hubot jaden me - Wisdom from Jaden Smith
#
# Author:
#   pcarn <https://github.com/pcarn>

_ = require "underscore"
Twit = require "twit"
config =
  consumer_key: process.env.HUBOT_TWITTER_CONSUMER_KEY
  consumer_secret: process.env.HUBOT_TWITTER_CONSUMER_SECRET
  access_token: process.env.HUBOT_TWITTER_ACCESS_TOKEN
  access_token_secret: process.env.HUBOT_TWITTER_ACCESS_TOKEN_SECRET

wisdom = [
  "I Hope It Doesn't Take For Me To Die For You To See What I Do For You",
  "I Watch Twilight Every Night",
  "Most Trees Are Blue",
  "People Use To Ask Me What Do You Wanna Be When You Get Older And I Would Say What A Stupid Question The Real Question Is What Am I Right Now",
  "How Can Mirrors Be Real If Our Eyes Aren't Real",
  "If Newborn Babies Could Speak They Would Be The Most Intelligent Beings On Planet Earth.",
  "I Only Apply To The Sixth Amendment",
  "I'm 13 This Is Ridiculous",
  "When I Die. Then You Will Realize",
  "I've Bin Drinking Distilled Water For So Long That When I Drink Normal Water It Feels Like I'm Swallowing Huge Chunks Of Aluminum.",
  "You Would Have To Eat 5 Apples Today To Get The Same Nutritional Value As An Apple From 1950.",
  "Dying Is MainStream #MONEY",
  "\"It's Your Birthday\" Mateo Said. I Didn't Respond. \"Are You Not Excited To Be 15\" He Asked. Reading My Book I Uttered \"I Turned 15 Long Ago\"",
  "I Will Always Give You The Truth I Will Never Lie To You In My music If You Cant Handle My Feelings And Emotions Please Unfollow Me",
  "Ill Never Forget The Blogs That Believed In Me Since The Begging.",
  "People Tell Me To Smile I Tell Them The Lack Of Emotion In My Face Doesn't Mean I'm Unhappy",
  "You Must Not Know Fashion",
  "If A Book Store Never Runs Out Of A Certain Book, Dose That Mean That Nobody Reads It, Or Everybody Reads It",
  "All The Rules In This World Were Made By Someone No Smarter Than You. So Make Your Own.",
  "School Is The Tool To Brainwash The Youth.",
  "Trees Are Never Sad Look At Them Every Once In Awhile They're Quite Beautiful",
  "We Need To Stop Teaching The Youth About The Past And Encourage Them To Change The Future",
  "There Is No Nutrients In Our Food Anymore Or In Our Soil OR IN OUR WATER",
  "You Think You Get It. YOU DONT YOU DONT YOU DONT!!!!!!!",
  "I Scare People Away",
  "Either I Lie To You Or We Cry Together",
  "If I Had A Nickel For Every Time I've Cried In The Back Of An Uber, I Would Have Another Pair Of Yeezy's.",
  "You Can Discover Everything You Need To Know About Everything By Looking At Your Hands",
  "When The First Animal Went Extinct That Should've Bin A Sign.",
  "If I Die In My Flannel Will You Write My Poems On Tyler's 5 Panels And Jesusus Sandals This Plane Is Just To Much To Handle.",
  "I Build Pyramids Constantly",
  "Anyone Born On This Planet Should Have A Planetary Citizenship Enabling Them To Freely Explore There Home",
  "I Don't Want You Guys To Think Because I Was Born In America That I Speak And Abide By English Grammar. I Speak Jaden, Indefinitely.",
  "You Taught Me How To Play The Piano But Have Never Heard Me.",
  "Don't Worry Bae I'll Talk To You About SpaceTime Over FaceTime.",
  "I Just Scrolled Through My Tweets And \"I\" Started Laughing.",
  "The Head Of The Sphinx Will Fall Off In The Near Future.",
  "HardWork Dedication Until There's Peace And Non Poverty In Every Nation, And I Isn't Patient. ||",
  "Every 7 Years Your Body Is Completely Replaced With Entirely New Cells So Just Because You Look The Same Doesn't Mean You Are.",
  "People Hate What They Don't Understand",
  "\"Hey Are You Jaden Can I Have A Picture With You\" No Cause I'm Super Sad But We Can Sit And Talk.",
  "Haters Are Just Pre Creators Who Need The Seed Of Greatness.",
  "If I Was Moses Where Would I Be",
  "If Everybody In The World Dropped Out Of School We Would Have A Much More Intelligent Society.",
  "I Should Just Stop Tweeting, The Human Consciousness Must Raise Before I Speak My Juvenile Philosophy.",
  "I Read \???The Ancient Secret of the Flower of Life\??? And Ancient Texts. Things That Cant Be Pre-dated.",
  "When You Think About An Apple You Also Think About The Opposite Of An Apple",
  "You Never Learn Anything In School. Think About How Many Car Accidents Happen Every Day. Driver???s Ed? What???s Up? I Still Haven???t Been To Driver???s Ed Because If Everybody I Know Has Bin In An Accident, I Can???t See How Driver???s Ed Is Really Helping Them Out.",
  "This Cute Little Blonde Baby Just Looked At Me.",
  "Currently Going Through Customs Even Though I Was Born On This Planet.",
  "Gimme 12 months. You See What's Bin Started",
  "That's Art Ladies And Gentlemen",
  "Drake Is Tight.",
  "No Pain No Gain Young Kurt Cobain.",
  "Dear Everybody Who Can Rap Better Than Me. Please Show Me",
  "Dear The Internet Have Fun With That.",
  "Once All 100% Is Neglected You Have A Citizen. A Walking Zombie Who Criticizes Every Thing They See. Have Fun Its A Really Awesome Place.",
  "Hate Me Love Me Doesn't Matter I'm Still Occupying Time Inside Of Your Psyche.",
  "Teleport To Me.",
  "I Feel Like People Who Look Similar Act Similar.",
  "My Parents Are The Trillest People I Know",
  "If A Cup Cake Falls From A Tree How Far Away Will It Be From Down. #Jupiter",
  "To Kiss A Humming Bird...",
  "SPIDER MAN IS AMAZING OH MY GOD !!!!!! PLEASE GO WATCH IT",
  "Unawareness Is The Only Sin, And If You Were Aware You Would Know.",
  "People Think A RelationShip Makes You Whole, That It's Two 50%'s Coming Together To Make 100% When It Should Be Two 100%'s Making 200%",
  "Water In The Eyes And Alcohol In The Eyes Are Pretty Much The Same I Know This From First Hand Experience.",
  "Your Passion For Hating Me Is The Same Passion I Have For SacGeometry And MagLev Technology And Any Passion Is To Be Respected",
  "I'm Here If You Need A Fellow Insane Person To Talk To. But I'm Seriously Here Not Like One Of Those I'm Here For You's That Everybody Says.",
  "If Everybody Got To Meet Me In Real Life, 50% Of My Fans Would Hate Me And 50% of My Hatters Would Love Me.",
  "I'm Slowly Realizing I Need To Make A Trip Out To Norway",
  "I Don't Like To Tweet But The New Hunger Games Is Literally Amazing.",
  "The Current Population Of Earth Is 7,124,102,180",
  "I Encourage You All To Unfollow Me So I Can Be Left With The People Who Actually Appreciate Philosophy And Poetry. #CoolTapeVol2",
  "Why Is It Always 3 WHY IS IT ALWAYS 3!!!!!",
  "The Great Gatsby Is One Of The Greatest Movies Of All Time, Coachella.",
  "Lately People Call Me Scoop Life",
  "I Gave Justin His Cartier Then Went Home.",
  "I'm Really Lovin My Instagram Right Now",
  "Like I Can't Take Life Right Now",
  "Once You Go In You Always Come Out Alive",
  "Swear To God If Who Hacked My Instagram Is Who I Think Hacked My Instagram..........Good Luck",
  "I Cried When I Made This #StarryRoom"
]

module.exports = (robot) ->
  twit = undefined

  robot.respond /jaden me/i, (msg) ->
    msg.send msg.random wisdom

  robot.respond /jaden latest/i, (msg) ->
    unless config.consumer_key
      msg.send "Please set the HUBOT_TWITTER_CONSUMER_KEY environment variable."
      return
    unless config.consumer_secret
      msg.send "Please set the HUBOT_TWITTER_CONSUMER_SECRET environment variable."
      return
    unless config.access_token
      msg.send "Please set the HUBOT_TWITTER_ACCESS_TOKEN environment variable."
      return
    unless config.access_token_secret
      msg.send "Please set the HUBOT_TWITTER_ACCESS_TOKEN_SECRET environment variable."
      return
    unless twit
      twit = new Twit config
    twit.get "statuses/user_timeline",
      screen_name: escape("officialjaden")
      count: 1
      include_rts: false
      exclude_replies: true
    , (err, reply) ->
      return msg.send "Error" if err
      return msg.send _.unescape(_.last(reply)['text']) if reply[0]['text']
