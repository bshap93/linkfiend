

b1 = Bookmark.create(name: "How to learn Emacs :: The very basics ", link: "http://david.rothlis.net/emacs/tutorial.html", user_id: 5)
b2 = Bookmark.create(name: "The Rust Programming Language ", link: "http://doc.rust-lang.org/stable/book/", user_id: 5)
b3 = Bookmark.create(name: "Formatted print | Rust by Example ", link: "http://rustbyexample.com/hello/print.html", user_id: 5)
b4 = Bookmark.create(name: "Eloquent JavaScript ", link: "http://eloquentjavascript.net/", user_id: 5)
b5 = Bookmark.create(name: "HAML", link: "http://haml.info/", user_id: 5, secret: true)
b6 = Bookmark.create(name: "Dive Into Python 3 ", link: "http://interactivepython.org/courselib/static/diveintopython3/index.html", user_id: 6)

t1 = Tag.create(name: "dev")
t2 = Tag.create(name: "javascript")
t3 = Tag.create(name: "rust")

b1.tags << t1
b1.save
b2.tags << t1
b2.tags << t3
b2.save
b4.tags << t1
b4.tags << t3
b4.save