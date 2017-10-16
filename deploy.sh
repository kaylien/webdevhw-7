export PORT=4000
DIR=$1

if [ ! -d "$DIR" ]; then
  printf "Usage: ./deploy.sh <path>\n"
  exit
fi

mix ecto.migrate
mix deps.get
(cd assets && npm install)
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix phx.digest
mix release --env=prod

SRC=`pwd`
(cd $DIR && tar xzvf $SRC/_build/prod/rel/nu_mart/releases/0.0.1/nu_mart.tar.gz)

env PORT=4000 _build/prod/rel/microblog/bin/microblog restart





SRC=`pwd`
(cd $DIR && tar xzvf $SRC/_build/prod/rel/nu_mart/releases/0.0.1/nu_mart.tar.gz)

$DIR/bin/nu_mart start



export PORT=4000

printf "Usage: ./deploy.sh <path>\n"

mix ecto.migrate
mix deps.get
cd assets;
npm install
./node_modules/brunch/bin/brunch b -p
cd ..
mix phx.digest
mix release.init
#mix release --env=prod

env MIX_ENV=prod mix release --env=prod
env MIX_ENV=prod mix phx.digest --env=prod --verbose
env PORT=4000 _build/prod/rel/microblog/bin/microblog start

env PORT=4000 _build/prod/rel/microblog/bin/microblog restart