Forum
=====

A simple forum I started building to possible migrate a medium sized vbulletin forum away from the devestation that is vbulletin.

I started it while getting my wisdom teeth out, and it most likely won't go anywhere.


### How can I get it working?

I use mocksmtp for development emails. If you don't have it, update the `config/development.rb` and change the mail settings to whatever you need

    bundle
    rake db:create
    rake db:migrate
    rake db:seed  # to set seed data

### Some notes so far:

Colours need to be fixed (http://www.paletton.com/#uid=13G0u0kp2lDgdu9lapntohmBvbZ) as a base pallet

### What's it do?

1. Admin/members (still loads of work needed here)
1. Admin can create sections
1. Can create posts
1. can reply to posts
1. a little bit responsive
1. Pagination
1. Inline replies
1. Extended User model fields
1. CanCan Integration

### What's to come?

A lot.

1. Smart SEO defaults
1. WYSIWYG
1. An admin that can manage, users, posts, replies, etc.
1. Sticky Threads
1. Close Threads
1. Askimet Integration (spam management)
1. What's new (since last visit)
1. Better caching, memoization, memcached, etc. etc.
1. User profiles
1. Gravatar/profile integration
1. Omniauth
1. Subscription to posts
1. Subscription to sections
1. Proper email management
1. Banned Users
1. Make all views haml
1. private messaging between users

### License

Release under MIT
