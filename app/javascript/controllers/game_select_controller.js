import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  selectGame(event) {
    const gameId = event.target.value;
    if (gameId) {
      window.location.href = `/games/${gameId}/scores`;
    } else {
      window.location.href = "/games";
    }
  }
}
