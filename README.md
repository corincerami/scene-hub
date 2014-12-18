# Scene Hub

## About:
Scene Hub is a web app written in Ruby on Rails that is being designed to serve as a tool to connect local musicians to their communities. Musicians and bands can post about upcoming shows or performances, from concerts at big name venues to impromptu gigs at the park to an open mic night at a coffee house. Fans and music lovers can then search for live music in their neighborhood and be connected to the musicans around them.

## Progress:
- Shows can be posted by signed in users to the front page.
- Bands can enter a date for the show.
- Venues and bands now have index pages.
- Added genre category to bands
- Shows are sorted on the front page by date, earliest first.
- Anyone can enter a zip code and find shows within 25 miles.
- Allow for signup/signin using devise gem
- Venues, bands, shows have individual pages
- Geocode new shows before saving them to the database
- Zip codes are now verified as valid before posting shows to the database.
- Shows can no longer be posted without bands, venues, and datetimes.
- Comments can now be posted to shows
- Users can now select several genres for a band using checkboxes.

## To Do:
- Users should be able to list several bands for a show
- Allow bands to post news/links on their individual band page
- Allow photos to be posted to show pages/band pages
- Create upvote/downvote or "like" system for comments and photos
- Signed in users can add favorites to their profiles
- Implement social features
