# smoothie

## Setup

Turn off screen blanking and remove powersave, etc, by adding these lines to `~/.config/lxsession/LXDE-pi/autostart`

```
@xset s 0 0
@xset s noblank
@xset s noexpose
@xset dpms 0 0 0
```

Use `config/config.txt` to replace/augment `/boot/config.txt` to enable full 1024x600 resolution

## Secrets

`secrets.json` has to be created in this directory with the following format:

```
{
  "apikey": "<restdb apikey goes here>"
}
```

Set the webserver to serve from this directory for smoothie to work.

```
python -m http.server
```

And then navigate to http://localhost:8000.

## Setting up the api key

On restdb.io, create a CORS-enabled scoped API key, and

+ Allow REST API path: `/<collection name>`
+ Enable only `GET`
+ Under real time events, subscribe to
    + `POST:<collection name>`
    + `PUT:<collection name>`
