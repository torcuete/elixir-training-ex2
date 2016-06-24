import "phoenix_html"
import {Socket} from "phoenix"

// Get counter DOM element
const $counter = document.getElementById("counter")
// And register function to update it
function updateCounter(value) {
  $counter.innerHTML = value
}

// The same DOM stuff with trophies
const $trophies = document.getElementById("trophies")
function addTrophy() {
  const $trophy = document.createElement("li")
  $trophy.innerHTML = "*"
  $trophies.appendChild($trophy)
}

// Connect to phoenix user socket
const socket = new Socket("/socket", {params: {}})
socket.connect()

// And join to arena channel
const channel = socket.channel("arenas:lobby", {})
channel.join()
  .receive("ok", ({counter}) => { updateCounter(counter) })
  .receive("error", response => { console.error("Unable to join!", response) })

// Listen for counter updates from channel
channel.on("update", ({counter}) => {
  updateCounter(counter)
})

// When clicking in counter a "count" event will be sent to channel
$counter.addEventListener("click", event => {
  channel.push("count", {})
    .receive("ok", ({won, counter})=> {
      // And, if everything is ok, we will receive the counter
      updateCounter(counter)
      if (won) {
        // informing if we won or not
        addTrophy()
      }
    })
    .receive("error", response => {console.error("Unable to join!", response) })
})
