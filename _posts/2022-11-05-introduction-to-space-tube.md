---
title: Introducing Space Tube
---

For a long time, I have been excited by the idea of democratic groups (e.g. coops and unions) communicating AS groups, rather than relying on individuals relaying messages, or forming a new group to chat in. 

Space Tube is my current project to experiment with this idea ([Wobbly](https://wobbly.app) is my old one). By linking existing chat groups together with bridging software, I want to see if new forms of communication emerge from the connection process.

In my wildest dreams, Space Tube enables coordination and collaboration of groups on a grand scale allowing us to flourish in a new earthly paradise or failing that, increase the numbers that survive the coming cataclysm.

## What have you built?

I’ve made a discord bot that relays conversations from one discord server to another, turning messages from individuals within a group into messages from that group posted in both groups’s servers.

Here’s some screenshots of a group of Xylophone enthusiasts speaking to some Zebra aficionados. 

![Discord screenshot of channel, with post from user king-mob asking what's up](https://wobbly.app/assets/img/space%20tube%20demo%20sequence%201.png "User sends message")

![Discord screenshot of channel, with post from xylophone club asking what's up](https://wobbly.app/assets/img/space%20tube%20demo%20sequence%202.png "Message is now sent from the group")

![Discord screenshot of channel, with post from zebra afficiandos replying that they're demonstrating space tube](https://wobbly.app/assets/img/space%20tube%20demo%20sequence%203.png "Reply from the other group that can see the message")

In the pictures you can see my account sends a message, then the message is deleted and replaced with the correct group depending on which server I sent the message from.

![Discord screenshot of two bot users, named Common Knowledge and Code-Operative discussing a recent gathering in Glasgow](https://wobbly.app/assets/img/codeop%20common%20knowledge%20convo%203.png "Here's another example of it actually in use, a coop called Common Knowledge asked Code-Operative about a recent coop gathering in Glasgow.")


## How did you do this?

Very short answer: combining a powerful ecosystem of chat tools called [Matrix](https://matrix.org/) with my immense levels of technical ability.

### Brief Paean to Matrix

The Matrix community have built a very powerful chat technology that has the potential to express complex relationships and events far beyond the user experience that we're accustomed to having with chat. Simple building blocks like nested rooms (channels inside channels) and custom events (you can add any field to an event) explodes the space of what is possible in online interaction. And there's encryption and federation for security and resilience. It’s like living in a dream.

### Longer explanation with more searchable keywords

Here’s what I did, roughly in the order I did it although there were loops and back tracking along the way. I might have forgotten something important that you need to know to replicate it, but I am available for questions.

* Installed Ubuntu 22.04 using WSL. Installed ansible on that.
* Created a matrix server using the [ansible playbook](https://github.com/spantaleev/matrix-docker-ansible-deploy) and a domain
* Enabled matrix-appservice-discord, by editing the vars.yml of the matrix-ansible playbook
* Created a Discord bot using Discord’s bot service tools and connected it to matrix-appservice-discord
* Wrote a script using the matrix-js-sdk that connects to the bridges on the server, and interacts with the conversations.
* Fetched a bunch of IDs from Matrix, put them in an env file and configured and avatars and display names
* Used a script called adminme from matrix-appservice-discord to get admin privileges in the 
* Deployed the script to a server where it waits patiently to forward messages.

Basically 75% setting up other people's work correctly, and then 25% writing some proof of concept code that’s pretty simple in the end.

Here’s the script that’s running on the server: https://github.com/Wobbly-App/space-tube/blob/main/index.js

Hard bits: avatars. I forgot how matrix media works that you have to get the internal mx url rather than the raw address. Also the matrix-discord bridge needed updating at one point so I had to seek help from the matrix community about that.

## How do I try space tube for myself?

There are 4 options.

1. Join the xylophone or zebra discord group, using the invite links here:
Xylophone Club: https://discord.gg/FVvUbgqpMq
Zebra Appreciators: https://discord.gg/yQNmZn84z2
Send some messages in the chat and watch what happens. Remember, you ARE the Xylophone club when you speak!

2. Ask me to add your discord server to the experiment. Contribute some money to the [opencollective](https://opencollective.com/wobbly) if you can afford it.

3. Wait for a version of the discord bot to be released that doesn’t require any manual set-up on my part, then add it to your server.
It’ll probably look like clicking a link to add the bot to the server then typing “!open” in a channel to register a tube opening with some kind of registration flow.

4. Replicate what I’ve done on your own server by following all the steps above that I did, and use the code and links that I’ve provided. This will likely take an hour or two if you know what you’re doing, or several hours if you kind of know what you’re doing, like I did.

## What next?

In terms of features, I’d like to get agreements between groups working. And I’d like to have quorums for sending messages (e.g. requiring other people to do !send after your message to actually send it).

I’d like to add more chat platforms, probably next one will be Slack because I think a few tech coops I know use it a tube between Slack and Discord would look cool. I’ve got a version of this that works with WhatsApp, but they have a pretty bot-hostile policy so it just looks like my WhatsApp account is sending all the messages. Embarrassingly I haven’t made a matrix native version of this that would work in Element or the other clients because the bridging feels more impressive in discord. The magic of the demo is key!

The obvious current limitation is that I can’t add buttons to someone else’s chat platform. I don’t have direct access to the UX. At the moment the interface is basically a command line, which some people are comfortable with and some aren’t. My idea to resolve this is to keep things in chat groups for now, but add links to an external tool for more complex features like sociocratic proposals and stuff.

I’m currently applying for grants so I can work on Space Tube in my prime working hours. This is my first time applying for grants so if you have any tips on where to apply to or how, please let me know, I am very new at this.

I also need communities and collectives to try this out, so if that’s you let’s organise some experiments! And if you want to help out with development, please get in touch!

## What do I want you to do?

Join the matrix room (#space-tube-public:wobbly.app), sign up for [the newsletter](http://tinyletter.com/wobbly), follow me on [twitter](https://twitter.com/JoKingMob), [email me](mailto:john@wobbly.app) and spread the good news about Matrix and Space Tube!

Bye!
