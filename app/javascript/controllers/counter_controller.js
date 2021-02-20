import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  connect() {
    setInterval(this.refresh, 5000);
    fetch('/gardens/mygardens', { headers: { accept: "application/json" }})
      .then(response => response.json())
      .then((data) => {
        if (data.bookings.length == 0) {
          this.element.classList.add("d-none");
        } else {
          this.element.classList.remove("d-none");
          this.countTarget.innerText = data.bookings.length;
        }
      });

  }

  refresh = () => {
    fetch('/gardens/mygardens', { headers: { accept: "application/json" }})
      .then(response => response.json())
      .then((data) => {
        if (data.bookings.length == 0) {
          this.element.classList.add("d-none");
        } else {
          this.element.classList.remove("d-none");
          this.countTarget.innerText = data.bookings.length;
        }
      });
  }




}
