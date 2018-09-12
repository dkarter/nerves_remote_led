// for phoenix_html support, including form and button helpers
// copy the following scripts into your javascript bundle:
// * https://raw.githubusercontent.com/phoenixframework/phoenix_html/v2.10.0/priv/static/phoenix_html.js

const socket = new Phoenix.Socket('/socket');
socket.connect();

const channel = socket.channel('led:lobby');
channel
  .join()
  .receive('ok', resp => {
    console.log('Joined successfully', resp);
  })
  .receive('error', resp => {
    console.log('Unable to join', resp);
  });

const onButton = document.querySelector('button[data-on-button]');
const offButton = document.querySelector('button[data-off-button]');

onButton.addEventListener('click', () => channel.push('on'));
offButton.addEventListener('click', () => channel.push('off'));
