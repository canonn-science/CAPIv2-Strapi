const DiscordStrategy = require('passport-discord');
const DiscordScopes = ['identify', 'email'];

module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'e611aa6a9b24762b1a4b4fec51a5920e'),
    providers: [
      {
        uid: 'discord',
        displayName: 'Discord',
        icon: 'https://cdn0.iconfinder.com/data/icons/free-social-media-set/24/discord-512.png',
        createStrategy: (strapi) =>
          new DiscordStrategy(
            {
              clientID: env('DISCORD_CLIENT_ID'),
              clientSecret: env('DISCORD_SECRET'),
              callbackURL: strapi.admin.services.passport.getStrategyCallbackURL('discord'),
              scope: DiscordScopes,
            },
            (accessToken, refreshToken, profile, done) => {
              done(null, {
                email: profile.email,
                username: profile.username + '#' + profile.discriminator,
              });
            }
          ),
      },
    ],
  },
});
