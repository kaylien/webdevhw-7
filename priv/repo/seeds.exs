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

Repo.delete_all(Post)
Repo.delete_all(Following)
Repo.delete_all(User)

kaylien = Repo.insert!(%User{username: "kaylien", email: "kaylien@gmail.com"})
leo = Repo.insert!(%User{username: "leo", email: "leo@gmail.com"})
oriana = Repo.insert!(%User{username: "oriana", email: "oriana@gmail.com"})
aneesa = Repo.insert!(%User{username: "aneesa", email: "aneesa@gmail.com"})
#katarina - Repo.insert!(%User{username: "katarina", email: "kitkat@gmail.com"})

post1 = Repo.insert!(%Post{user_id: kaylien.id, post: "this is a post"})
post2 = Repo.insert!(%Post{user_id: leo.id, post: "oh my god"})
post3 = Repo.insert!(%Post{user_id: oriana.id, post: "feta cheese is a great addition onto avocado toast"})
post4 = Repo.insert!(%Post{user_id: aneesa.id, post: "i am fifty percent more influential than any other human being"})
#post5 - Repo.insert!(%Post{user_id: aneesa.id, post: "aaaaaaaaaaaaaa"})

Repo.insert!(%Following{user_id: kaylien.id, follows_user_id: leo.id})
#Repo.insert!(%Following{user_id: kaylien.id, follows_user_id: oriana.id})
Repo.insert!(%Following{user_id: kaylien.id, follows_user_id: aneesa.id})
#Repo.insert!(%Following{user_id: 1, follows_user_id: 5})
Repo.insert!(%Following{user_id: leo.id, follows_user_id: kaylien.id})
Repo.insert!(%Following{user_id: oriana.id, follows_user_id: leo.id})
Repo.insert!(%Following{user_id: aneesa.id, follows_user_id: kaylien.id})
