import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'searchInput', 'list'];

  connect() {
    console.log(this.formTarget);
    console.log(this.searchInputTarget);
    console.log(this.listTargets);
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.listTargets.forEach(element => {
          element.outerHTML = data;
        });
      })
  }
}
