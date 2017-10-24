# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.Blog.User
alias Microblog.Blog.Post
alias Microblog.Blog.Following
#alias Integer, as: I

Repo.delete_all(Following)
Repo.delete_all(User)
Repo.delete_all(Post)

kaylien = Repo.insert!(%User{username: "kaylien", email: "kaylien@gmail.com", password: "qwertyuiop"})
leo = Repo.insert!(%User{username: "leo", email: "leo@gmail.com", password: "qwertyuiop"})
oriana = Repo.insert!(%User{username: "oriana", email: "oriana@gmail.com", password: "qwertyuiop"})
aneesa = Repo.insert!(%User{username: "aneesa", email: "aneesa@gmail.com", password: "qwertyuiop"})
hello = Repo.insert!(%User{username: "hello", email: "hello@gmail.com", password: "thisisatest"})
#katarina - Repo.insert!(%User{username: "katarina", email: "kitkat@gmail.com"})

post1 = Repo.insert!(%Post{post: "this is a post", user_id: "1"})
post2 = Repo.insert!(%Post{post: "oh my god", user_id: "2"})
post3 = Repo.insert!(%Post{post: "feta cheese is a great addition onto avocado toast", user_id: "3"})
post4 = Repo.insert!(%Post{post: "i am fifty percent more influential than any other human being", user_id: "4"})
#post5 - Repo.insert!(%Post{user_id: aneesa.id, post: "aaaaaaaaaaaaaa"})

Repo.insert!(%Following{user_id: "1", follows_user_id: "2"})
#Repo.insert!(%Following{user_id: kaylien.id, follows_user_id: oriana.id})
Repo.insert!(%Following{user_id: "1", follows_user_id: "4"})
#Repo.insert!(%Following{user_id: 1, follows_user_id: 5})
Repo.insert!(%Following{user_id: "2", follows_user_id: "1"})
Repo.insert!(%Following{user_id: "3", follows_user_id: "2"})
Repo.insert!(%Following{user_id: "4", follows_user_id: "1"})
