# Project 4 - Twitchm

Twitchm is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: 24 hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can sign in using OAuth login flow
- [X] User can view last 20 tweets from their home timeline
- [X] The current signed in user will be persisted across restarts
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] Retweeting and favoriting should increment the retweet and favorite count.
- [X] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [X] Profile page:
   - [X] Contains the user header view
   - [X] Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] Home Timeline: Tapping on a user image should bring up that user's profile page
- [X] Compose Page: User can compose a new tweet by tapping on a compose button.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Types of errors
2. Debugging Network Errors
3. Passing an exact cell without pressing the cell itself
4. How to send data for various tasks

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/4S1mm5c.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I created about 3/4 of this app using the old videos and the other using the new ones when they came out. This led to
miniscule errors in the code that I'm still not sure what they were, but were causing very strange and large problems.
For instance I could retrieve user data but not tweet data, as that what unauthorized for some reason. Also, the imageView
will not change with URLs for some reason so there's that as well. Overall this app was very difficult and time consuming.

Most of this app is completed, but not all of it. I could not get the picture of a tweet to go to that user's profile page. However, the page that it should go to exists and is working so it is just the connection that is the error. Besides that, everything should be working just fine.

## License

    Copyright 2016 Cole McLemore

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
