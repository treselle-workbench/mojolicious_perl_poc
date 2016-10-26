use Mojolicious::Lite;
get '/' => { text => 'Hello World' };

get '/user_details' => { json => {first_name => "Arun", last_name => "Kumar", address => "xx street", city => "chenai", now => time}};
get '/echo' => { text => q{
<form method="POST"><input name="q"><input type="submit" value="Echo"></form>
}};

app->secrets(['My very secret passphrase.']);
app->start;